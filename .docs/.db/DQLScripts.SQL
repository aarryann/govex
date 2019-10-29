USE hectre;


DELIMITER ;;
CREATE PROCEDURE `DEBUG`(deleteNow boolean, message varchar(6000))
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS DEBUG (
		message VARCHAR(6000) NOT NULL
	);

	IF deleteNow = true THEN
        DROP temporary table DEBUG;
    else
		insert into DEBUG (message) values (message);
	end if;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `EncounterForm_GetByGroupId`(studyId varchar(36), formCode tinytext, encounterId varchar(36))
BEGIN
	Select CRF_LONG_NAME, CRF_DESCRIPTION_TEXT,
	CRQ_ID, CRQ_QUESTION_TEXT, CRQ_QUESTION_TOOLTIP, CRQ_DISPLAY_ORDER, CRQ_IS_MANDATORY,
	   CRQ_MIN_VALUE,
	   CRQ_MAX_VALUE,
	   CRQ_MAX_LENGTH,
	   CRQ_CRQ_ID,
	   CRQ_DEPENDENCY_CONDITION,
	   CRQ_DISPLAY_DATATYPE,
	   CRQ_UOM_ID,
	   CRQ_RESPONSE_STYLE,
	   CRQ_VALIDATION_MESSAGE,
	   CRQ_DISPLAY_TYPE,
	   (Select group_concat(CQR_RESPONSE_VALUE SEPARATOR '~') from cqr_question_responses where CQR_RESPONSE_CODE=CRQ_CQR_ID) 'responseValue',
	   (Select group_concat(UOM_UNIT SEPARATOR '~') from unit_of_measurements where UOM_DESCRIPTION = CRQ_UOM_ID or UOM_BASE_UOM=CRQ_UOM_ID) 'units',
	   PCR_RESPONSE_VALUE,
       CRF_BTN_TEXT,
       CRQ_RELATED, 'radio' as UnitType
	FROM crf_library
	INNER JOIN crf_sections ON CRS_CRF_ID = CRF_ID
	INNER JOIN crf_questions ON CRQ_CRS_ID = CRS_ID
	LEFT JOIN participant_crf_responses ON PCR_QUE_ID = CRQ_ID AND PCR_PEN_ID = encounterId
	WHERE CRF_SHORT_CODE = formCode
    order by CRQ_DISPLAY_ORDER asc;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `EncounterForm_SaveDetails`(studyId varchar(36), encounterId varchar(36), formCode varchar(45), query JSON, userId varchar(36), submitStatus varchar(40))
BEGIN
    DECLARE l_crf_id varchar(36) default null;
    DECLARE i      INT DEFAULT  0;
	DECLARE jCount INT DEFAULT -1;
  	DECLARE l_pcr_id varchar(36) default null;

    select CRF_ID into l_crf_id from CRF_LIBRARY where CRF_SHORT_CODE=formCode;

    if l_crf_id is not null THEN
		begin
			-- first insert record in CRF Main table for participant responses. check if record exist else add new one.
			declare l_pcd_id varchar(36) default null;

            select PCD_ID into l_pcd_id from participant_crf_details where PCD_CRF_ID = l_crf_id and PCD_PEN_ID = encounterId;

			if l_pcd_id is null THEN
			begin
				set l_pcd_id = uuid();

                INSERT INTO participant_crf_details (PCD_ID, PCD_PEN_ID, PCD_CRF_ID, PCD_CRF_ENTRY_DT, PCD_CRF_STATUS, PCD_LAST_USR_ID, PCD_LAST_CHANGE_DT)
				VALUES (l_pcd_id, encounterId, l_crf_id, CURRENT_TIMESTAMP(), submitStatus, userId, CURRENT_TIMESTAMP());

			end;
            else
            begin
				UPDATE participant_crf_details SET PCD_CRF_STATUS = submitStatus, PCD_LAST_CHANGE_DT = CURRENT_TIMESTAMP()
                WHERE PCD_ID = l_pcd_id;
			end;
			end if;

                -- Now looping for each question and store values in crf response table.


                SET jCount = jCount + JSON_LENGTH( query, '$' );
				  WHILE ( i <= jCount ) DO

					SELECT PCR_ID INTO l_pcr_id
					FROM participant_crf_responses
					WHERE PCR_PEN_ID = encounterId and PCR_CRF_CODE = formCode and  PCR_QUE_ID = JSON_EXTRACT(query, CONCAT( '$[', i, '].CODE'));
					/* Check for the record Exists for the encounter for Vital records Exist Yes Or No; If yes then Update else Add new record*/
					if l_pcr_id is null then
					begin
							INSERT INTO participant_crf_responses
                            (PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_UOM_ID, PCR_PEN_ID, PCR_LAST_USR_ID, PCR_LAST_CHANGED_DT, PCR_PCD_ID)
							VALUES(
									uuid(),
									formCode,
									JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].CODE')))
								  , JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].VALUE')))
                                  ,null, encounterId
								  , userId,
								  current_timestamp(), l_pcd_id
								  );
					END;
					ELSE
						UPDATE participant_crf_responses
						SET  PCR_RESPONSE_VALUE = JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].VALUE')))
						, PCR_LAST_USR_ID = userId
						, PCR_LAST_CHANGED_DT =  current_timestamp()
						WHERE PCR_ID = l_pcr_id AND
						PCR_PEN_ID = encounterId AND PCR_CRF_CODE = formCode
                        AND PCR_QUE_ID  = JSON_EXTRACT(query, CONCAT( '$[', i, '].CODE'));
					END IF;


                    # UPDATE RELETED TABLE VALUE
                    SELECT CRQ_RELATED into @relatedTable from crf_questions where CRQ_ID = JSON_EXTRACT(query, CONCAT( '$[', i, '].CODE'));

                    IF @relatedTable IS NOT NULL THEN
						SET @tableName = JSON_UNQUOTE(JSON_EXTRACT(@relatedTable, '$.table'));
						SET @fieldName = JSON_UNQUOTE(JSON_EXTRACT(@relatedTable, '$.field'));
                        SET @fieldValue = JSON_EXTRACT(query, CONCAT( '$[', i, '].VALUE'));

                        #SELECT SPT_SCN_ID into @screeningId FROM participant_encounters LEFT JOIN study_site_participants ON PEN_SPT_ID = SPT_ID WHERE PEN_ID = encounterId;
                        SELECT pat_id into @participantId
							FROM participant_encounters
							JOIN study_site_participants ON spt_id = pen_spt_id
							JOIN participants ON spt_pat_id = pat_id
							LEFT JOIN participant_study_consents ON psc_spt_id = spt_id
							WHERE pen_id = encounterId;

                        # UPDATE QUERY BUILD HERE
						SET @updateQuery = CONCAT('UPDATE ', @tableName,' SET ', @fieldName, '=', @fieldValue, ' WHERE PAT_ID = "', @participantId, '";');

						PREPARE statement FROM @updateQuery;
						EXECUTE statement;
						DEALLOCATE PREPARE statement;

                    END IF;

                    SET i = i + 1;
				  END WHILE;

            end;
    end if;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Encounters_CreateEncounter`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
#	{ encounterDate: "2017-12-01", encounterType: "Screening", encounterUnscheduled: "No", encounterReason:"", fname: "Andy", mi: "", lname: "Garcia", gender: "M", dob: "1970-01-10", consentDate:"2017-12-01", consentVersion: 1, mrn: "TEMP-009", userId: 1, studyId: 3, siteId: 5, studyVersionId: 2, studySiteParticipantId: 2 }
	DECLARE encounterDate DATETIME default null;
    DECLARE consentDate DATETIME default null;
    DECLARE dob DATETIME default null;
    DECLARE encounterType varchar(100) default null;
    DECLARE encounterUnscheduled varchar(20) default null;
    DECLARE encounterReason varchar(100) default null;
    DECLARE fname varchar(100) default null;
    DECLARE mi varchar(100) default null;
    DECLARE lname varchar(100) default null;
	DECLARE gender varchar(100) default null;
    DECLARE consentVersion varchar(100) default null;
    DECLARE mrn varchar(100) default null;
    DECLARE userId varchar(36) default null;
    DECLARE studyVersionId varchar(36) default null;
    DECLARE studySiteParticipantId varchar(36) default null;
    DECLARE screeningId varchar(36) default null;
    DECLARE parEncId varchar(36) default null;
	SET encounterDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterDate')), '');
    SET consentDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.consentDate')), '');
    SET dob = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.dob')), '');
    SET encounterType = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterType')), '');
    SET encounterUnscheduled = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterUnscheduled')), '');
    SET encounterReason = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterReason')), '');
    SET fname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.fname')), '');
    SET mi = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.mi')), '');
    SET lname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.lname')), '');
	SET gender = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.gender')), '');
    SET consentVersion = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.consentVersion')), '');
    SET mrn = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.mrn')), '');
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
    SET studySiteParticipantId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.studySiteParticipantId')), '');
	SELECT SRS_SVE_ID INTO studyVersionId FROM SITE_REGISTERED_STUDIES WHERE SRS_STU_ID = studyId AND SRS_SIT_ID = siteId AND SRS_REG_CURRENT = 'Y';
    if studySiteParticipantId is null then
	begin
		set screeningId = uuid();

		INSERT INTO SCREENING (SCN_ID, SCN_TNT_ID, SCN_MRN, SCN_FNAME, SCN_MI, SCN_LNAME, SCN_GENDER_CURR, SCN_DOB, SCN_SCREEN_DT, SCN_SCREEN_STATUS, SCN_LAST_USR_ID )
		VALUES (screeningId, 'cd0256d7-8439-11e8-9538-00155d0a851b', mrn, fname, mi, lname, gender, dob, encounterDate, 'In Progress', userId );
		set studySiteParticipantId = uuid();
		INSERT INTO STUDY_SITE_PARTICIPANTS (SPT_ID, SPT_PAT_ID, SPT_SCN_ID, SPT_SIT_ID, SPT_STU_ID, SPT_SPID, SPT_ENROLL_DT, SPT_ENROLL_STATUS, SPT_ENROLL_STATUS_DT, SPT_LAST_USR_ID )
		VALUES (studySiteParticipantId, NULL, screeningId, siteId, studyId, NULL, NULL, 'In Progress', CURRENT_DATE(), userId );

	end;
    end if;

    set parEncId = uuid();

	INSERT INTO PARTICIPANT_ENCOUNTERS (PEN_ID, PEN_SPT_ID, PEN_ENC_SVE_ID, PEN_EVENT_NAME, PEN_EVENT_UNSCH, PEN_ENC_DT, PEN_ENC_REASON, PEN_LAST_USR_ID )
	VALUES (parEncId, studySiteParticipantId, studyVersionId, encounterType, encounterUnscheduled, encounterDate, encounterReason, userId );


  INSERT INTO PARTICIPANT_STUDY_CONSENTS (PSC_ID, PSC_SPT_ID, PSC_SCO_ID, PSC_LAST_USR_ID, PSC_CON_DT, PSC_LAST_CHANGE_DT)
  VALUES (uuid(),studySiteParticipantId, consentVersion, userId, consentDate, now());


	CALL Encounters_GetEncounterInfoById( parEncId );
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Encounters_GetAllIssues`(encounterId varchar(36))
BEGIN
	SELECT EDD_ID as id, EDD_EDS_PEN_ID AS encounterId, EDD_STEP_CD as stepCode, EDD_ISSUE_DESC as issueDesc
    FROM encounter_data_details where EDD_EDS_PEN_ID = encounterId;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Encounters_GetEncounterInfoById`(encounterId varchar(36))
BEGIN
#	{ encounterDate: "2017-12-01", encounterType: "Screening", encounterReason:"", fname: "Andy", mi: "", lname: "Garcia", gender: "M", dob: "1970-01-10", consentDate:"2017-12-01", consentVersion: 1, mrn: "TEMP-009", spid: "HC005-001", userId: 1, studyId: 3, siteId: 5, studyVersionId: 2, studySiteParticipantId: 2, encounterId: 1 }
	DECLARE participantId varchar(36) DEFAULT NULL;
    SELECT spt_pat_id INTO participantId
    FROM participant_encounters
    JOIN study_site_participants ON spt_id = pen_spt_id
    WHERE pen_id = encounterId;
    IF participantId IS NULL THEN
    BEGIN
		SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, scn_fname fname, scn_mi mi, scn_lname lname, scn_gender_curr gender, scn_dob dob, psc_con_dt AS consentDate, psc_sco_id AS consentVersion, scn_mrn mrn, concat(left(scn_fname, 1), ' ', left(scn_lname, 1)) spid, pen_id encounterId, pen_spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, scn_id as screeningId, null as participantId
		FROM participant_encounters
		JOIN study_site_participants ON spt_id = pen_spt_id
        JOIN screening ON spt_scn_id = scn_id
        LEFT JOIN participant_study_consents ON psc_spt_id = spt_id
		WHERE pen_id = encounterId;
	END;
	ELSE
    BEGIN
		SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, pat_fname fname, pat_mi mi, pat_lname lname, pat_gender_curr gender, pat_dob dob, psc_con_dt AS consentDate, psc_sco_id AS consentVersion, pat_mrn mrn, spt_spid spid, pen_id encounterId, pen_spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, null as screeningId, pat_id as participantId
		FROM participant_encounters
		JOIN study_site_participants ON spt_id = pen_spt_id
        JOIN participants ON spt_pat_id = pat_id
        LEFT JOIN participant_study_consents ON psc_spt_id = spt_id
		WHERE pen_id = encounterId;
	END;
	END IF;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Encounters_UpdateEncounter`(encounterId varchar(36), query JSON)
BEGIN
#	{ encounterDate: "2017-12-01", encounterType: "Screening", encounterUnscheduled: "No", encounterReason:"", fname: "Andy", mi: "", lname: "Garcia", gender: "M", dob: "1970-01-10", consentDate:"2017-12-01", consentVersion: 1, mrn: "TEMP-009", userId: 1, studyId: 3, siteId: 5, studyVersionId: 2, studySiteParticipantId: 2 }
	DECLARE encounterDate DATETIME default null;
    DECLARE consentDate DATETIME default null;
    DECLARE dob DATETIME default null;
    DECLARE encounterType varchar(100) default null;
    DECLARE encounterUnscheduled varchar(20) default null;
    DECLARE encounterReason varchar(100) default null;
    DECLARE fname varchar(100) default null;
    DECLARE mi varchar(100) default null;
    DECLARE lname varchar(100) default null;
	DECLARE gender varchar(100) default null;
    DECLARE consentVersion varchar(100) default null;
    DECLARE mrn varchar(100) default null;
    DECLARE userId varchar(36) default null;
    DECLARE studyVersionId varchar(36) default null;
    DECLARE studySiteParticipantId varchar(36) default null;
    DECLARE screeningId varchar(36) default null;
    DECLARE participantId varchar(36) default null;
	SET encounterDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterDate')), '');
    SET consentDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.consentDate')), '');
    SET dob = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.dob')), '');
    SET encounterType = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterType')), '');
    SET encounterUnscheduled = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterUnscheduled')), '');
    SET encounterReason = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterReason')), '');
    SET fname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.fname')), '');
    SET mi = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.mi')), '');
    SET lname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.lname')), '');
	SET gender = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.gender')), '');
    SET consentVersion = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.consentVersion')), '');
    SET mrn = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.mrn')), '');
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
	SELECT SPT_SCN_ID, SPT_PAT_ID, SPT_ID
	INTO screeningId, participantId, studySiteParticipantId
	FROM STUDY_SITE_PARTICIPANTS
	JOIN PARTICIPANT_ENCOUNTERS ON PEN_SPT_ID = SPT_ID
	WHERE PEN_ID = encounterId;
    if encounterType = 'Screening' then
	begin
		UPDATE SCREENING
		SET SCN_MRN = mrn
		, SCN_FNAME = fname
		, SCN_MI = mi
		, SCN_LNAME = lname
		, SCN_GENDER_CURR = gender
		, SCN_DOB = dob
		, SCN_SCREEN_DT = encounterDate
		, SCN_LAST_USR_ID = userId
		WHERE SCN_ID = screeningId;
	end;
	end if;
	if participantId is not null then
	begin
		UPDATE PARTICIPANTS
		SET PAT_MRN = mrn
		, PAT_FNAME = fname
		, PAT_MI = mi
		, PAT_LNAME = lname
		, PAT_GENDER_CURR = gender
		, PAT_DOB = dob
		, PAT_LAST_USR_ID = userId
		WHERE PAT_ID = participantId;
	end;
	end if;
	UPDATE PARTICIPANT_ENCOUNTERS
	SET PEN_EVENT_NAME = encounterType
	, PEN_EVENT_UNSCH = encounterUnscheduled
	, PEN_ENC_DT = encounterDate
	, PEN_ENC_REASON = encounterReason
	, PEN_LAST_USR_ID = userId
	WHERE PEN_ID = encounterId;

    UPDATE PARTICIPANT_STUDY_CONSENTS
	SET PSC_SCO_ID = consentVersion, PSC_CON_DT = consentDate
	WHERE PSC_SPT_ID = studySiteParticipantId AND PSC_LAST_USR_ID = userId;
	CALL Encounters_GetEncounterInfoById( encounterId );
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `getAllGroupList`(spt_id varchar(36))
BEGIN
	select count(elr.ELR_ID) AS ELRCount,elr.encounter_group_id,ELR_LBT_TEST_DATE,
	ELR_PEN_ID, PEN.PEN_EVENT_NAME AS TestName
	from encounter_lab_result elr
	LEFT JOIN participant_encounters AS pen ON elr.ELR_pen_id=pen.PEN_ID
	where elr.ELR_pen_id in (select PEN_ID from participant_encounters where pen_spt_id = spt_id)
	group by encounter_group_id,ELR_LBT_TEST_DATE,ELR_PEN_ID;
    END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `getAllMedications`()
BEGIN
	Select MED_CD medCode , MED_NAMES medName from medications order by MED_NAMES;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `getAllParticipantEncounters`()
BEGIN
    SELECT PEN_ID as encounterId, concat(PEN_EVENT_NAME,' ', PEN_ENC_DT) as encounterType from participant_encounters;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `getAllSpecimens`(siteId varchar(36))
BEGIN
	select st.id id, ssp.SPT_SPID participantSptId, pe.PEN_EVENT_NAME encounterEventName, st.specimen_type specimenType,
    st.specimen_date specimenDate, st.specimen_number specimenNumber, st.specimen_sent_to specimenSentTo,
    st.lab_result_date labResultDate, st.participant participant, st.encounter encounter, pe.PEN_ENC_DT encounterEventDate
	from specimen_tracking st
	join study_site_participants ssp on st.participant = ssp.SPT_ID
	join participant_encounters pe on st.encounter = pe.PEN_ID where st.spe_site_id = siteId;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `getAppVersion`()
BEGIN
SELECT AVR_DISPLAY_TXT AS VERSION FROM app_versions order by AVR_LAST_CHANGE_DT DESC;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `GetEncounterLabResult`(encounterId VARCHAR(36), group_id VARCHAR(36), event_name VARCHAR(30))
BEGIN
     DECLARE p_sev_id VARCHAR(36);
 	SELECT SEV_ID INTO @p_sev_id FROM study_events WHERE sev_event_name = event_name LIMIT 1;

	SELECT
	CASE WHEN ELT_SEV_ID = @p_sev_id THEN TRUE ELSE FALSE END AS IS_ENC_QUE
	,LBT_ID,LBT_NAME,LBT_DESC,LBT_CODE AS ELR_LBT_CODE
	,LBT_GROUP_ID,LBT_CONTROL_TYPE,LBT_HAS_CRITICAL,
	(SELECT ELR_UOM FROM encounter_lab_result WHERE ELR_PEN_ID = encounterId AND Encounter_GROUP_ID = group_id AND ELR_LBT_CODE = LBT_CODE LIMIT 1) AS ELR_UOM,
	(SELECT ELR_ID FROM encounter_lab_result WHERE ELR_PEN_ID = encounterId AND Encounter_GROUP_ID = group_id AND ELR_LBT_CODE = LBT_CODE LIMIT 1) AS ELR_ID,
	(SELECT ELR_RESULT_VALUE FROM encounter_lab_result WHERE ELR_PEN_ID = encounterId AND Encounter_GROUP_ID = group_id AND ELR_LBT_CODE = LBT_CODE LIMIT 1) AS ELR_RESULT_VALUE,
	(SELECT GROUP_CONCAT(CQR_RESPONSE_VALUE) FROM cqr_question_responses WHERE CQR_RESPONSE_CODE= LBT_RESPONSE_CODE GROUP BY CQR_RESPONSE_CODE) AS OPTIONS
	FROM lab_tests
	LEFT JOIN encounter_lab_tests ON elt_lbt_id = lbt_id
	WHERE LBT_RECORD_STATUS = 'Active'
ORDER BY LBT_NAME;
    END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `GetMasterLabTest`()
begin
	select LBT_ID,LBT_NAME,LBT_DESC,LBT_CODE as ELR_LBT_CODE,LBT_GROUP_ID,
    LBT_CONTROL_TYPE,LBT_HAS_CRITICAL,
    (SELECT GROUP_CONCAT(CQR_RESPONSE_VALUE)  FROM cqr_question_responses where CQR_RESPONSE_CODE= LBT_RESPONSE_CODE group by CQR_RESPONSE_CODE) AS OPTIONS
    from lab_tests
    where LBT_RECORD_STATUS = 'Active'
    order by LBT_NAME;
end ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `GetSpecimens`()
BEGIN
    SELECT * from specimen_tracking ;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `getSPID`(OUT p_pid_final varchar(50))
BEGIN
declare p_pid varchar(50) default null;
select CASE WHEN ((SUBSTRING_INDEX(PAT_PID, '-', -1) + 1) < 9) THEN concat(SUBSTRING_INDEX(PAT_PID, '-', 1),'-00',(SUBSTRING_INDEX(PAT_PID, '-', -1) + 1))
						WHEN ((SUBSTRING_INDEX(PAT_PID, '-', -1) + 1) > 9) THEN concat(SUBSTRING_INDEX(PAT_PID, '-', 1),'-0',(SUBSTRING_INDEX(PAT_PID, '-', -1) + 1))
						WHEN ((SUBSTRING_INDEX(PAT_PID, '-', -1) + 1) > 99) THEN concat(SUBSTRING_INDEX(PAT_PID, '-', 1),'-',(SUBSTRING_INDEX(PAT_PID, '-', -1) + 1))
						ELSE (SUBSTRING_INDEX(PAT_PID, '-', -1) + 1) END AS PID INTO p_pid
						from participants order by PAT_LAST_CHANGE_DT DESC limit 1;

						if p_pid is null then
						begin
							set p_pid = concat('HC00','-001');
						end;
						end if;

set p_pid_final= p_pid;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `GetUnitsOfMeasurement`()
begin
	select UOM_ID AS 'key', UOM_UNIT as value from unit_of_measurements;
end ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `GetUpdateScript`(in version varchar(20))
BEGIN
    SELECT AVR_FILE_LOCATION from app_versions WHERE AVR_DISPLAY_TXT = version;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `GetUserDetails`(in p_uname varchar(200))
BEGIN
    SELECT * from users WHERE usr_uname = p_uname;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `GetUsers`()
BEGIN
    SELECT * from users;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `LibraryDocuments_GetAll`(siteId varchar(36), studyID varchar(36))
BEGIN
 SELECT DOC_FIELDNAME as fieldname , DOC_ORIGINALNAME as originalname , DOC_FILENAME as filename from
 document_library WHERE DOC_STU_ID = studyID order by DOC_FILENAME;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `LibraryDocuments_Upload`(siteID varchar(36), studyID varchar(36), query JSON)
BEGIN
    DECLARE l_query longtext default null;
    DECLARE jCount INT DEFAULT -1;
    DECLARE i      INT DEFAULT  0;
	DECLARE field varchar(100) default null;
    DECLARE uu_id varchar(36) default null;
    SET l_query = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.files')), '');
	SET jCount = jCount + JSON_LENGTH( l_query, '$' );

WHILE ( i <= jCount ) DO

	begin
    SET uu_id = uuid();
    SET field = JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].fieldname')));
		INSERT INTO document_library(DOC_ID, DOC_STU_ID, DOC_SIT_ID, DOC_FIELDNAME, DOC_ORIGINALNAME, DOC_FILENAME, DOC_UPLOAD_DATE)
		VALUES( uu_id,
				studyID,
                siteID,
				JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].fieldname')))
			  , JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].originalname')))
              , JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].filename')))
			  , current_timestamp()
			  );

	END;
     SET i = i + 1;
END WHILE;
 SELECT DOC_FIELDNAME as fieldname , DOC_ORIGINALNAME as originalname , DOC_FILENAME as filename from document_library WHERE DOC_ID = uu_id;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Log_Create`(userId varchar(36), query JSON)
BEGIN

    DECLARE logDate DATETIME default null;
	DECLARE logTitle VARCHAR(255) default null;

	SET logDate = now();
    SET logTitle = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.title')), '');

	INSERT INTO api_logs ( ID, USER_ID, LOG_DATE, LOG_TITLE )
	VALUES ( uuid(), userId, logDate, logTitle );
	SELECT last_insert_id();
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Orders_CreateOrder`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
# 	'{"encounterId":"1","testCode":"ANT BODY","orderEffDate":"2018-05-18 ","userId":"1"}'
	DECLARE encounterId varchar(36) default null;
    DECLARE testCode varchar(100) default null;
    DECLARE orderEffDate DATETIME default null;
	DECLARE userId varchar(36) default null;
    DECLARE isActiveTest BIT default 0;
    DECLARE orderDate DATETIME default null;
    DECLARE orderId varchar(36) default null;
    DECLARE resID varchar(36) default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN
	 select 0 as InsertedID;
	 ROLLBACK;
	END;

    SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');
    SET testCode = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.testCode')), '');
    SET orderEffDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.orderEffDate')), '');
	SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
    SET orderId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.orderId')), '');
    SET orderDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.orderDate')), '');

	SELECT CASE WHEN TES_STATUS = 'Active' THEN 1 ELSE 0 END INTO isActiveTest
	FROM tests
	WHERE TES_TEST_CD = testCode;

     START TRANSACTION;
    if isActiveTest = 1 then
	begin
		if orderId <> '' then
        begin
			UPDATE encounter_test_orders
			SET
			`ETO_TEST_CD` = testCode,
			`ETO_ORD_PLACE_DT` = orderDate,
			`ETO_ORD_EFF_DT` = orderEffDate,
			`ETO_LAST_USR_ID` = userId,
			`ETO_LAST_CHANGE_DT` = curdate()
			WHERE `ETO_ID` = orderId;
            set resID =  orderId;
        end;
        else
        begin

        set resID =  uuid();

			INSERT INTO encounter_test_orders
			(ETO_ID,
            ETO_PEN_ID,
			ETO_TEST_CD,
			ETO_ORD_PLACE_DT,
			ETO_ORD_EFF_DT,
			ETO_LAST_USR_ID,
			ETO_LAST_CHANGE_DT)
			VALUES
			(resID,
            encounterId,
			testCode,
			orderDate,
			orderEffDate,
			userId,
			now());

        end;
        end if;
	end;
    else
    begin
		set resID =   '-1';
    end;
    end if;

     select resID as InsertedID;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Orders_DeleteOrder`(orderId varchar(36))
BEGIN
	DECLARE isAvailable INT default 0;
    DECLARE resID varchar(36) default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN
	 select 0 as InsertedID;
	 ROLLBACK;
	END;

	SELECT CASE WHEN count(*) > 0 THEN 1 ELSE 0 END INTO isAvailable
	FROM encounter_test_orders
	WHERE ETO_ID = orderId;

     START TRANSACTION;
    if isAvailable = 1 then
	begin
		DELETE FROM encounter_test_orders WHERE `ETO_ID` = orderId;
        set resID =  orderId;
	end;
    else
    begin
		set resID =   '-1';
    end;
    end if;
    COMMIT;
     select resID as InsertedID;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Orders_GetAll`(encounterId varchar(36))
BEGIN
	SELECT ETO_ID as ID, ETO_TEST_CD as testCode, TES_TEST_NAMES as testName,
    ETO_ORD_PLACE_DT as orderPlaceDate, ETO_ORD_EFF_DT as orderEffectiveDate
    FROM encounter_test_orders
	LEFT join tests on ETO_TEST_CD = TES_TEST_CD WHERE ETO_PEN_ID = encounterId  order by ETO_LAST_CHANGE_DT desc;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participants_CheckCounter`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
	#sample query format: {}
    SELECT 'true' as PROCEED;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participants_CheckDuplicate`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
	#sample query format: {}
    DECLARE fname varchar(100) default null;
    DECLARE mi varchar(100) default null;
    DECLARE lname varchar(100) default null;
	DECLARE gender varchar(100) default null;
    DECLARE dob DATETIME default null;
    SET fname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.fname')), '');
    SET mi = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.mi')), '');
    SET lname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.lname')), '');
	SET gender = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.gender')), '');
    SET dob = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.dob')), '');
    SELECT
		CASE WHEN count(1) > 1 then 'false'
			else 'true'
		end as PROCEED
	from screening
	where scn_fname = fname and scn_mi = mi
	and scn_lname = lname and scn_dob = dob
	and scn_gender_curr = gender;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participants_CheckEligibility`(pen_id varchar(36))
BEGIN
	DECLARE CNT INT;
    DECLARE enrollDate datetime;
    DECLARE IS_ENROLLED BIT;
	#sample query format: {}
    select COUNT(*) INTO CNT
    from encounter_data_summary where EDS_PEN_ID = pen_id
    AND EDS_ISSUES_CNT > 0;

    select
    SPT_ENROLL_DT,
    (CASE WHEN SPT_ENROLL_DT IS NOT NULL THEN 1 ELSE 0 END) as IS_ENROLLED INTO enrollDate,IS_ENROLLED
    from study_site_participants
	join participant_encounters on pen_spt_id = spt_id
	where participant_encounters.pen_id = pen_id and SPT_PAT_ID IS NOT NULL AND spt_enroll_status = 'Enrolled' and SPT_SPID IS NOT NULL LIMIT 1;

    IF IS_ENROLLED = 1 THEN
    BEGIN
		SELECT 1 AS IS_ELIGIBLE,1 as IS_ENROLLED,DATE_FORMAT(enrollDate, '%Y-%m-%d') AS DT;
    END;
    ELSE
    BEGIN
		IF CNT = 0 THEN
		BEGIN

		SELECT
		CASE WHEN (select PCR_RESPONSE_VALUE FROM crf_questions
		INNER join participant_crf_responses on PCR_QUE_ID = CRQ_ID
		WHERE PCR_PEN_ID = pen_id AND CRQ_QUESTION_CODE = 'ELI_1') = 'Test at screening'
		THEN
			CASE WHEN (SELECT ELR_RESULT_VALUE FROM encounter_lab_result where ELR_LBT_CODE = 'HepC AB' AND ELR_PEN_ID = pen_id LIMIT 1) = 'Positive'
			THEN 1 ELSE 0 END
		ELSE
			CASE WHEN PCR_RESPONSE_VALUE = 'Positive' THEN 1 ELSE 0 END
		END AS IS_ELIGIBLE,
        0 AS IS_ENROLLED,
        '' AS DT
		FROM crf_questions
		INNER join participant_crf_responses on PCR_QUE_ID = CRQ_ID
		WHERE PCR_PEN_ID = pen_id AND CRQ_QUESTION_CODE = 'ELI_2.2';

		END;
		ELSE
		BEGIN
			SELECT 0 AS IS_ELIGIBLE,0 AS IS_ENROLLED,'' AS DT;
		END;
		END IF;
	END;
	END IF;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participants_Enroll`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
# 	'{"encounterId":"1","enrollmentDate":"2018-05-18 ","userId":"1"}'
	DECLARE encounterId varchar(36) default null;
    DECLARE enrollmentDate DATETIME default null;
	DECLARE userId varchar(36) default null;
    DECLARE p_spt_id varchar(36) default null;
    DECLARE p_scn_id varchar(36) default null;
    DECLARE p_pat_id varchar(36) default null;
    DECLARE isEnrolled BIT default 0;
    DECLARE p_pid varchar(80) default null;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN
		select false as FLAG,'' AS PAT_ID;
		ROLLBACK;
	END;

	SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');
    SET enrollmentDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.enrollmentDate')), '');
	SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
    START TRANSACTION;

    select CASE WHEN ((SUBSTRING_INDEX(PAT_PID, '-', -1) + 1) < 9) THEN concat(SUBSTRING_INDEX(PAT_PID, '-', 1),'-00',(SUBSTRING_INDEX(PAT_PID, '-', -1) + 1))
	WHEN ((SUBSTRING_INDEX(PAT_PID, '-', -1) + 1) > 9) THEN concat(SUBSTRING_INDEX(PAT_PID, '-', 1),'-0',(SUBSTRING_INDEX(PAT_PID, '-', -1) + 1))
	WHEN ((SUBSTRING_INDEX(PAT_PID, '-', -1) + 1) > 99) THEN concat(SUBSTRING_INDEX(PAT_PID, '-', 1),'-',(SUBSTRING_INDEX(PAT_PID, '-', -1) + 1))
	ELSE (SUBSTRING_INDEX(PAT_PID, '-', -1) + 1) END AS PID INTO p_pid
    from participants order by PAT_ID desc limit 1;

    if p_pid is null then
    begin
		set p_pid = concat('HC00',siteId,'-001');
    end;
    end if;

    select PEN_SPT_ID into p_spt_id from participant_encounters where PEN_ID = encounterId;
		if p_spt_id is not null then
		begin
		select SPT_SCN_ID into p_scn_id from study_site_participants where SPT_ID = p_spt_id;
			if p_scn_id is not null then
            begin

            set p_pat_id = uuid();

            INSERT INTO participants (`PAT_ID`,`PAT_TNT_ID`,`PAT_MRN`,`PAT_PID`,`PAT_FNAME`,`PAT_MI`,`PAT_LNAME`,`PAT_GENDER_CURR`,`PAT_DOB`,
			`PAT_STATUS`,`PAT_LAST_USR_ID`,`PAT_LAST_CHANGE_DT`)
            (select
            p_pat_id,
            SCN_TNT_ID,
            null,
            p_pid,
            SCN_FNAME,
            SCN_MI,
            SCN_LNAME,
            SCN_GENDER_CURR,
            SCN_DOB,
            'Active',
            userId,
            now() from screening where SCN_ID = p_scn_id);

				if p_pat_id is not null then
				begin
					update study_site_participants set
                    SPT_PAT_ID = p_pat_id,
                    SPT_SPID = p_pid,
                    SPT_ENROLL_STATUS = 'Enrolled',
                    SPT_ENROLL_DT = enrollmentDate,
					SPT_ENROLL_STATUS_DT = now(),
                    SPT_LAST_USR_ID = userId,
					SPT_LAST_CHANGE_DT = NOW()
					where SPT_ID = p_spt_id;

					update screening set
                    SCN_SCREEN_STATUS = 'Enrolled',
                    SCN_LAST_USR_ID = userId,
					SCN_LAST_CHANGE_DT = NOW()
                    WHERE SCN_ID = p_scn_id;

					set isEnrolled = 1;

                    COMMIT;
				end;
				end if;
			end;
			end if;
		end;
		end if;

    if isEnrolled = 1 then
    begin
		select true as FLAG,p_pat_id AS PAT_ID;
	end;
	else
	begin
		select false as FLAG,'' AS PAT_ID;
    end;
    end if;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participants_getMedications`(pen_id varchar(36))
BEGIN
   select PM_ID as pmId,
    PM_DOC_START_DT AS docStartDate,
    PM_DOC_END_DT AS docEndDate,
    PM_MED_CODE AS ncdCode,
    PM_DRUG_DESC AS drugCodeDesc,
    PM_DOSE_QUNTITY AS doseQuntity,
    PM_DOSE_FREQ AS doseFreq,
    PM_DOSE_STRENGTH AS doseStrength,
    PM_REASON_FOR_DISCONTI AS reasonDiscontinue,
    PM_DIAGNOSIS AS diagnosis,
    PM_PEN_ID AS penId
    from participant_medication_history WHERE PM_PEN_ID = pen_id;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participants_saveLabResults`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
	DECLARE i      INT DEFAULT  0;
	DECLARE jCount INT DEFAULT -1;
	DECLARE isSaved BIT default 0;
 	DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN
	select false as FLAG;
	ROLLBACK;
	END;

	SET jCount = jCount + JSON_LENGTH(query, '$' );

	START TRANSACTION;
	WHILE ( i <= jCount ) DO
	if JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].ELR_ID'))) is not null
    and JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].ELR_ID'))) <> 'null'
    then
    begin
		UPDATE encounter_lab_result
		SET ELR_RESULT_VALUE = IFNULL(JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].ELR_RESULT_VALUE'))),''),
			ELR_UOM = IFNULL(JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].ELR_UOM'))),0),
			ELR_LBT_TEST_DATE = (SELECT DATE_FORMAT(JSON_UNQUOTE(JSON_EXTRACT(QUERY, CONCAT( '$[', i, '].ELR_LBT_TEST_DATE'))),'%Y-%m-%d %h:%i:%s')),
            ELR_LAST_CHANGED_DT = now()
		WHERE ELR_ID = JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].ELR_ID')))
		AND encounter_group_id = JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].encounter_group_id')));
	end;
    else
    begin
		INSERT INTO encounter_lab_result
		(`ELR_ID`,
		`ELR_PEN_ID`,
		`ELR_LBT_CODE`,
		`ELR_RESULT_VALUE`,
		`ELR_RESULT_DT`,
		`ELR_UOM`,
		`ELR_LAST_USR_ID`,
		`ELR_LAST_CHANGED_DT`,
		`ELR_LBT_TEST_DATE`,
		`encounter_group_id`)
		VALUES
		(uuid(),
		JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].ELR_PEN_ID'))),
		JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].ELR_LBT_CODE'))),
		JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].ELR_RESULT_VALUE'))),
		current_timestamp(),
		JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].ELR_UOM'))),
		JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].USR_ID'))),
		current_timestamp(),
		(SELECT DATE_FORMAT(JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].ELR_LBT_TEST_DATE'))),'%Y-%m-%d %h:%i:%s')),
		JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].encounter_group_id'))));
    end;
    end if;
	SET i = i + 1;
	END WHILE;
	COMMIT;
     set isSaved = 1;
    if isSaved = 1 then
    begin
		select true as FLAG;
	end;
	else
	begin
		select false as FLAG;
    end;
    end if;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participant_AddDischarge`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
	DECLARE encounterId varchar(36) default null;
    DECLARE userId varchar(36) default null;
    DECLARE dischargId varchar(36) default null;
    DECLARE dscId varchar(36) default null;
    DECLARE resID varchar(36) default null;
    DECLARE dischargeNotes varchar(200) default null;
    DECLARE dischargeDetails varchar(45) default null;

    SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');
    SET dischargeNotes = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.dischargeNotes')), '');
    SET dischargeDetails = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.dischargeDetails')), '');
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');

    SELECT PDC_ID into dscId  from participant_discharge WHERE PDC_ECO_ID = encounterId LIMIT 1;
    if dscId is null or dscId = 0 then
	begin
		set resID =  uuid();
		INSERT INTO participant_discharge(PDC_ID,PDC_ECO_ID,PDC_LAST_USR_ID,PDC_EDC_PROVIDE, PDC_NOTE, PDC_LAST_CHANGE_DT)
			VALUES(resID,encounterId,userId,dischargeDetails,dischargeNotes, current_timestamp());

	END;
	ELSE
		UPDATE participant_discharge
			SET `PDC_EDC_PROVIDE` = dischargeDetails,
				`PDC_NOTE` = dischargeNotes,
				`PDC_LAST_CHANGE_DT` =  current_timestamp()
        WHERE
			`PDC_ECO_ID` = encounterId;

		set resID =  dscId;
	END IF;
    commit;

	select resID as InsertedID;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participant_Discharge`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
	DECLARE encounterId varchar(36) default null;
    DECLARE userId varchar(36) default null;
    DECLARE dischargId varchar(36) default null;
    DECLARE dscId varchar(36) default 0;
    DECLARE resID varchar(36) default 0;
    DECLARE dischargeNotes varchar(200) default null;
    DECLARE dischargeDetails varchar(45) default null;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN
		select '00' as InsertedID;
		ROLLBACK;
	END;

    SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');
    SET dischargeNotes = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.dischargeNotes')), '');
    SET dischargeDetails = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.dischargeDetails')), '');
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');

    SELECT PDC_ID into dscId  from participant_discharge WHERE PDC_USR_ID = userId;
    start transaction;
    if dscId is null then
	begin
		INSERT INTO participant_discharge(PDC_ID,PDC_USR_ID, PDC_EDC_PROVIDE, PDC_NOTE, PDC_LAST_CHANGE_DT)
			VALUES(uuid(),userId, dischargeDetails, dischargeNotes, current_timestamp());
		set resID =  last_insert_id();
	END;
	ELSE
		UPDATE participant_discharge
			SET `PDC_EDC_PROVIDE` = dischargeDetails,
				`PDC_NOTE` = dischargeNotes,
				`PDC_LAST_CHANGE_DT` =  current_timestamp()
        WHERE
			`PDC_USR_ID` = userId;

		set resID =  dscId;
	END IF;
    commit;

	select resID as InsertedID;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `participant_encounters_GetAllVitals`(encounterId varchar(36))
BEGIN
	select VTL_CODE AS code, vtl_display_text as vitalDisplayText,
    (Select group_concat(UOM_UNIT SEPARATOR '~') from unit_of_measurements where UOM_DESCRIPTION = vtl_uom_id) 'units',
     PEV_VTL_VALUE AS responseValue, 'radio' as UnitType
    FROM vitals
    -- left join unit_of_measurements on uom_description = vtl_uom_id
    left join participant_encounter_vitals on PEV_VTL_CODE = VTL_CODE AND PEV_PEN_ID  = encounterId
    order by VTL_DISPLAY_ORDER;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `participant_encounter_SaveAllVitals`(siteId varchar(36), studyId varchar(36), query JSON, userId varchar(36))
BEGIN
# 	'{"encounterId":"1","enrollmentDate":"2018-05-18 ","userId":"1"}'
--   SELECT JSON_EXTRACT(query, '$.encounterId');

    -- IF Encoutner Information is not available then create a new Encounter for Participant and store Vital Details
    DECLARE encounterDate DATETIME default null;
    DECLARE consentDate DATETIME default null;

    DECLARE encounterType varchar(100) default null;
    DECLARE encounterUnscheduled varchar(20) default null;
    DECLARE encounterReason varchar(100) default null;
	DECLARE consentVersion varchar(100) default null;
	DECLARE studySiteParticipantId varchar(36) default null;
    DECLARE userId varchar(36) default null;
    DECLARE encounterId varchar(36) default null;
    DECLARE studyVersionId varchar(36) default null;
    DECLARE i      INT DEFAULT  0;
	DECLARE jCount INT DEFAULT -1;

	declare l_pev_id varchar(36) default null;
    declare l_query longtext default null;

    SET encounterDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterDate')), '');
    SET consentDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.consentDate')), '');

	SET encounterType = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterType')), '');
    SET encounterUnscheduled = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterUnscheduled')), '');
    SET encounterReason = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterReason')), '');
    SET consentVersion = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.consentVersion')), '');
     SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
    SET studySiteParticipantId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.studySiteParticipantId')), '');
    SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');

    SELECT SRS_SVE_ID INTO studyVersionId
	FROM SITE_REGISTERED_STUDIES
	WHERE SRS_STU_ID = studyId AND SRS_SIT_ID = siteId
	AND SRS_REG_CURRENT = 'Y';

    IF encounterId  = 0 then
		set encounterId = uuid();
		INSERT INTO PARTICIPANT_ENCOUNTERS ( PEN_ID, PEN_SPT_ID, PEN_ENC_SVE_ID, PEN_EVENT_NAME, PEN_EVENT_UNSCH, PEN_ENC_DT, PEN_ENC_REASON, PEN_LAST_USR_ID )
		VALUES (encounterId, studySiteParticipantId, studyVersionId, encounterType, encounterUnscheduled, encounterDate, encounterReason, userId );


	else
		UPDATE PARTICIPANT_ENCOUNTERS
			SET PEN_EVENT_NAME = encounterType
			, PEN_EVENT_UNSCH = encounterUnscheduled
			, PEN_ENC_DT = encounterDate
			, PEN_ENC_REASON = encounterReason
			, PEN_LAST_USR_ID = userId
			WHERE PEN_ID = encounterId;
    end if;

    UPDATE PARTICIPANT_STUDY_CONSENTS
	SET PSC_SCO_ID = consentVersion, PSC_CON_DT = consentDate
	WHERE PSC_SPT_ID = studySiteParticipantId AND PSC_LAST_USR_ID = userId;

    -- Now use this encounter to update vitals details

    SET l_query = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.vitalsData')), '');



SET jCount = jCount + JSON_LENGTH( l_query, '$' );
  WHILE ( i <= jCount ) DO

	SELECT PEV_ID INTO l_pev_id
	FROM participant_encounter_vitals
	WHERE pev_pen_id = encounterId and PEV_VTL_CODE = JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].CODE')));
	/* Check for the record Exists for the encounter for Vital records Exist Yes Or No; If yes then Update else Add new record*/
	if l_pev_id is null then
	begin
			INSERT INTO participant_encounter_vitals(PEV_ID,PEV_PEN_ID, PEV_VTL_CODE, PEV_VTL_VALUE, PEV_LAST_USR_ID, PEV_LAST_CHANGED_DT)
			VALUES(
					uuid(),
					encounterId,
					JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].CODE')))
				  , JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].VALUE')))
				  , userId,
				  current_timestamp()
				  );
	END;
    ELSE
		UPDATE participant_encounter_vitals
        SET  PEV_VTL_VALUE = JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].VALUE')))
        , PEV_LAST_USR_ID = userId
        , PEV_LAST_CHANGED_DT =  current_timestamp()
        WHERE
        PEV_PEN_ID = encounterId AND PEV_VTL_CODE  = JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].CODE')));
    END IF;
    SET i = i + 1;
    set l_pev_id = null;
  END WHILE;
    CALL Encounters_GetEncounterInfoById(encounterId);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participant_GetAllLabTests`(encounterId varchar(36), spt_id varchar(36))
BEGIN
if (select count(*) from encounter_lab_result where ELR_PEN_ID = encounterId) > 0 then
begin
select
(SELECT LBT_NAME FROM lab_tests l WHERE l.LBT_ID = lt.LBT_GROUP_ID) AS GROUP_NAME,
(SELECT LBT_NAME FROM lab_tests l WHERE l.LBT_ID = lt.LBT_GROUP_ID) TEST_CODE,
lt.LBT_NAME,
CASE WHEN elr.ELR_LBT_TEST_DATE IS NULL THEN pen.PEN_ENC_DT ELSE elr.ELR_LBT_TEST_DATE END as testDate,
elr.ELR_ID as ID,
elr.ELR_PEN_ID,
-- case when elr.ELR_PEN_ID = pen.PEN_ID then elr.ELR_ID else null end as ID,
pen.PEN_ID,
pen.PEN_EVENT_NAME,
pen.PEN_ENC_DT,
case when elr.ELR_PEN_ID = pen.PEN_ID then elr.ELR_RESULT_VALUE else null end as ELR_RESULT_VALUE,
case when elr.ELR_PEN_ID = pen.PEN_ID then elr.ELR_UOM else 0 end as ELR_UOM,
case when elr.ELR_PEN_ID = pen.PEN_ID then uom.UOM_UNIT else null end as unitName,
case when pen.PEN_ID = encounterId THEN 'Active' else 'InActive' End as Status,
lt.LBT_NORMAL_RANGE
from encounter_lab_result elr
left join unit_of_measurements uom on  elr.elr_uom = uom.UOM_ID
inner join lab_tests lt on lt.lbt_code = elr.elr_lbt_code
left outer join participant_encounters pen
on pen.pen_id in (select pen_id from participant_encounters where pen_spt_id = spt_id)
where elr_pen_id in (select pen_id from participant_encounters where pen_spt_id =spt_id)
and elr_pen_id = pen_id order by pen_id desc;
end;
else
begin
select
(SELECT LBT_NAME FROM lab_tests l WHERE l.LBT_ID = lt.LBT_GROUP_ID) AS GROUP_NAME,
(SELECT LBT_NAME FROM lab_tests l WHERE l.LBT_ID = lt.LBT_GROUP_ID) TEST_CODE,
lt.LBT_NAME,
CASE WHEN elr.ELR_LBT_TEST_DATE IS NULL THEN pen.PEN_ENC_DT ELSE elr.ELR_LBT_TEST_DATE END as testDate,
-- elr.ELR_ID as ID,
elr.ELR_PEN_ID,
case when elr.ELR_PEN_ID = pen.PEN_ID then elr.ELR_ID else null end as ID,
pen.PEN_ID,
pen.PEN_EVENT_NAME,
pen.PEN_ENC_DT,
case when elr.ELR_PEN_ID = pen.PEN_ID then elr.ELR_RESULT_VALUE else null end as ELR_RESULT_VALUE,
case when elr.ELR_PEN_ID = pen.PEN_ID then elr.ELR_UOM else 0 end as ELR_UOM,
case when elr.ELR_PEN_ID = pen.PEN_ID then uom.UOM_UNIT else null end as unitName,
case when pen.PEN_ID = encounterId THEN 'Active' else 'InActive' End as Status,
lt.LBT_NORMAL_RANGE
from encounter_lab_result elr
left join unit_of_measurements uom on  elr.elr_uom = uom.UOM_ID
right outer join lab_tests lt on lt.lbt_code = elr.elr_lbt_code
left outer join participant_encounters pen
on pen.pen_id in (select pen_id from participant_encounters where pen_spt_id = spt_id)
where lt.lbt_group_id <> '0'
group by lbt_name, pen_id order by pen_id desc;
end;
end if;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participant_GetDischarge`(encid varchar(36))
BEGIN
	SELECT PDC_EDC_PROVIDE as dischargeDetails , PDC_NOTE as  dischargeNotes from participant_discharge WHERE PDC_ECO_ID = encid;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Participant_UPDATE_SPID`(SPID varchar(50),PATID VARCHAR(50))
BEGIN

  UPDATE participants SET PAT_PID=SPID WHERE PAT_ID=PATID;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `PatientVitals_SaveVitals`(siteId varchar(36), studyId varchar(36), query JSON, userId varchar(36))
BEGIN
# 	'{"encounterId":"1","enrollmentDate":"2018-05-18 ","userId":"1"}'
--   SELECT JSON_EXTRACT(query, '$.encounterId');

    -- IF Encoutner Information is not available then create a new Encounter for Participant and store Vital Details
    DECLARE userId varchar(36) default null;
    DECLARE encounterId varchar(36) default null;
    DECLARE i      INT DEFAULT  0;
	DECLARE jCount INT DEFAULT -1;

	declare l_pev_id varchar(36) default null;
    declare l_query longtext default null;

    -- Now use this encounter to update vitals details
    SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');
    SET l_query = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.vitalsData')), '');
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');



SET jCount = jCount + JSON_LENGTH( l_query, '$' );
  WHILE ( i <= jCount ) DO

	SELECT PEV_ID INTO l_pev_id
	FROM participant_encounter_vitals
	WHERE pev_pen_id = encounterId and PEV_VTL_CODE = JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].CODE')));
	/* Check for the record Exists for the encounter for Vital records Exist Yes Or No; If yes then Update else Add new record*/
	if l_pev_id is null then
	begin
			INSERT INTO participant_encounter_vitals(PEV_ID, PEV_PEN_ID, PEV_VTL_CODE, PEV_VTL_VALUE, PEV_LAST_USR_ID, PEV_LAST_CHANGED_DT)
			VALUES(
					uuid(),
					encounterId,
					JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].CODE')))
				  , JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].VALUE')))
				  , userId,
				  current_timestamp()
				  );
	END;
    ELSE
		UPDATE participant_encounter_vitals
        SET  PEV_VTL_VALUE = JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].VALUE')))
        , PEV_LAST_USR_ID = userId
        , PEV_LAST_CHANGED_DT =  current_timestamp()
        WHERE
        PEV_PEN_ID = encounterId AND PEV_VTL_CODE  = JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].CODE')));
    END IF;
    SET i = i + 1;
    set l_pev_id = null;
  END WHILE;
   CALL Encounters_GetEncounterInfoById(encounterId);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `saveParicipantMedication`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
	DECLARE encounterId varchar(36) default null;
    DECLARE docStartDate DATETIME default null;
    DECLARE docEndDate DATETIME default null;
    DECLARE ncdCode varchar(80) default null;
    DECLARE drugCodeDesc varchar(1000) default null;
    DECLARE doseQuntity varchar(80) default null;
    DECLARE doseFreq varchar(80) default null;
    DECLARE doseStrength varchar(80) default null;
    DECLARE reasonDiscontinue varchar(1000) default null;
    DECLARE diagnosis varchar(80) default null;
	DECLARE userId varchar(36) default null;
    DECLARE pmId varchar(36) default null;
    DECLARE id BIT default 0;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN
		select false as FLAG;
		ROLLBACK;
	END;

	SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');
    SET docStartDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.docStartDate')), '');
	SET docEndDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.docEndDate')), '');
    SET ncdCode = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.ncdCode')), '');
    SET drugCodeDesc = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.drugCodeDesc')), '');
	SET doseQuntity = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.doseQuntity')), '');
    SET doseFreq = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.doseFreq')), '');
    SET doseStrength = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.doseStrength')), '');
    SET reasonDiscontinue = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.reasonDiscontinue')), '');
	SET diagnosis = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.diagnosis')), '');
	SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
    set pmId =  NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.pmId')), '');
    START TRANSACTION;
    if pmId <> '' then
    begin
		update participant_medication_history
        set
        `PM_DOC_START_DT`= docStartDate,
		`PM_DOC_END_DT`= docEndDate,
		`PM_MED_CODE`= ncdCode,
		`PM_DRUG_DESC`= drugCodeDesc,
		`PM_DOSE_QUNTITY`= doseQuntity,
		`PM_DOSE_FREQ`= doseFreq,
		`PM_DOSE_STRENGTH`= doseStrength,
		`PM_REASON_FOR_DISCONTI`= reasonDiscontinue,
		`PM_DIAGNOSIS`= diagnosis,
		`PM_PEN_ID`= encounterId,
		`PM_LAST_USR_ID`= userId,
		`PM_LAST_CHANGE_DT`= now() where PM_ID = pmId;
	end;
    else
    begin
		INSERT INTO participant_medication_history
		(`PM_ID`,
        `PM_DOC_START_DT`,
		`PM_DOC_END_DT`,
		`PM_MED_CODE`,
		`PM_DRUG_DESC`,
		`PM_DOSE_QUNTITY`,
		`PM_DOSE_FREQ`,
		`PM_DOSE_STRENGTH`,
		`PM_REASON_FOR_DISCONTI`,
		`PM_DIAGNOSIS`,
		`PM_PEN_ID`,
		`PM_LAST_USR_ID`,
		`PM_LAST_CHANGE_DT`
		)
		VALUES
		(uuid(),
        docStartDate,
		docEndDate,
		ncdCode,
		drugCodeDesc,
		doseQuntity,
		doseFreq,
		doseStrength,
		reasonDiscontinue,
		diagnosis,
		encounterId,
		userId,
		NOW());
    end;
    end if;
    COMMIT;
    SET id = 1;

    if id = 1 then
    begin
		select true as FLAG;
	end;
	else
	begin
		select false as FLAG;
    end;
    end if;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Sites_GetAll`()
BEGIN
	SELECT SIT_ID as id, SIT_SITE_NAME as site
    FROM sites WHERE SIT_STATUS = 'Active';
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `specimen_createSpecimen`(siteId varchar(36), studyId varchar(40), query JSON)
BEGIN
	DECLARE encounter varchar(40) ;
    DECLARE participant varchar(40) ;
    DECLARE specimen_date DATETIME default null;
    DECLARE specimen_number varchar(50);
    DECLARE specimen_sent_to varchar(100);
    DECLARE lab_result_date Datetime;
    DECLARE specimen_type varchar(50);
    DECLARE sId varchar(40) default 0;
    DECLARE site varchar(36) default 0;
    DECLARE comments text;
    DECLARE scount int default 0;
    DECLARE resID varchar(36) default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN
	 select 0 as InsertedID;
	 ROLLBACK;
	END;

    SET sId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.sId')), '');
    SET site = siteId;
    SET encounter = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounter')), '');
    SET participant = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.pId')), '');
    SET specimen_date = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.specimenDate')), '');
	SET specimen_number = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.specimenNumber')), '');
    SET specimen_sent_to = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.specimenSentTo')), '');
    SET lab_result_date = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.labResultDate')), '');
    SET specimen_type = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.specimenType')), '');
    SET comments = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.comments')), '');
    START TRANSACTION;
    SELECT count(*) into scount FROM specimen_tracking WHERE id = sId;
    if scount = 0 then
		begin
			set resID = scount;
			set sId = uuid();
			INSERT INTO specimen_tracking (id, spe_site_id, specimen_date, specimen_number, specimen_sent_to, lab_result_date,
            specimen_type, participant, encounter, comments)
			VALUES (sId, site, specimen_date, specimen_number, specimen_sent_to, lab_result_date, specimen_type,
            participant, encounter, comments);
		end;
	else
		begin
			set resID =   scount;
            UPDATE specimen_tracking
			SET
			`specimen_date` = specimen_date,
			`specimen_number` = specimen_number,
			`specimen_sent_to` = specimen_sent_to,
			`lab_result_date` = lab_result_date,
			`specimen_type` = specimen_type,
            `participant`= participant,
            `encounter`= encounter,
            `comments`= comments
			WHERE `id` = sId;
		end;
	end if;
  select resID as InsertedID;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Specimen_GetDetailsById`(sId VARCHAR(40))
BEGIN
	SELECT participant participant, encounter encounter, specimen_number specimenNumber,
		specimen_date specimenDate, specimen_sent_to specimenSentTo, lab_result_date labResultDate,
        specimen_type specimenType, comments comm, ssp.SPT_SPID pid FROM specimen_tracking
        join study_site_participants ssp on ssp.SPT_ID = participant
        WHERE id = sId;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `StudyConsents_GetAllConsents`(studyId varchar(36))
BEGIN
	Select sco_id scoId, sco_ver_txt scoVerText, sco_consent_url scoConsentUrl from Study_consents
where SCO_STATUS = 'Active' and SCO_STU_ID =  studyId;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `StudyEncounters_GetAllEncounters`(studyId varchar(36))
BEGIN
	SELECT SEV_EVENT_NAME eventName, sev_id sevId, sev_short_cd sevShortCd,sev_event_order sevEventOrder, sev_duration sevDuration, sev_unit_duration sevUnitDuration
    FROM study_events where sev_stu_id = studyId
    order by sev_event_order asc;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `StudyEncounters_GetAllEncounterSteps`(studyId varchar(36), eventName varchar(40))
BEGIN

    Select DCS_STEP_CD dcsStepCd, DCS_DISPLAY_NAME dcsDisplayName, SVS_GROUP_ID svsGroupId
    ,DCS_DISPLAY_ORDER as displayOrder, SVS_ID as id
    from data_capture_steps
	join study_event_steps on SVS_STEP_CD = DCS_STEP_CD
	where SVS_EVENT_NAME = eventName and SVS_STU_ID = studyId
    order by SVS_DISPLAY_ORDER asc;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `StudyEncounters_GetParticipantEncounterOrders`(encounterId varchar(36))
BEGIN

   Select ETO_TEST_CD as etoTestCd, ETO_ORD_PLACE_DT etoOrdPlaceDt, TES_TEST_NAMES tesTestNames FROM encounter_test_orders
   JOIN tests on tests.TES_TEST_CD = encounter_test_orders.ETO_TEST_CD
   where eto_pen_id = encounterId;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `StudySite_FindParticipants`(siteId VARCHAR(36), studyId VARCHAR(36), QUERY JSON)
BEGIN
	#sample query format: '{ "userId": "1", "studyId": "3", "siteId": "5" }'
    DECLARE userId VARCHAR(36) DEFAULT NULL;
    DECLARE sortBy VARCHAR(200) DEFAULT NULL;
    DECLARE filterBy VARCHAR(200) DEFAULT NULL;
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.userId')), '');
    SET sortBy = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.sortBy')), '');
    SET filterBy = IFNULL(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.filterBy')), '');
	-- set sortBy = 'gender DESC';
	SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, pat_fname fname, pat_mi mi, pat_lname lname, pat_gender_curr gender, pat_dob dob,
    NULL AS consentDate, NULL AS consentVersion, pat_mrn mrn, spt_spid spid, c.pen_id encounterId, b.spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId,
    SPT_ENROLL_DT enrollmentDate, PEN_LAST_CHANGE_DT lastEdited
    ,spt_pat_id, b.sev_event_name, b.sev_short_cd,
    CASE WHEN (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) > 0 THEN
    (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) ELSE 0 END AS issues ,sev_event_order
	FROM
    (
		SELECT spt_id, sev_event_name, sev_short_cd ,
			pen_id, sev_event_order
			FROM study_events
			JOIN study_site_participants
			LEFT JOIN (SELECT pen_id, pen_spt_id, pen_event_name, PEN_ENC_DT FROM participant_encounters) B ON pen_spt_id = spt_id AND pen_event_name = sev_event_name
			ORDER BY study_site_participants.created_dt, IFNULL(PEN_ENC_DT, '2100-01-01')) B
    LEFT JOIN participant_encounters c ON b.pen_id = c.pen_id AND b.spt_id = c.pen_spt_id
	JOIN study_site_participants d ON d.spt_id = b.spt_id
	JOIN participants ON spt_pat_id = pat_id
    JOIN screening ON spt_scn_id = scn_id
	AND spt_stu_id = studyId AND spt_sit_id = siteId AND (spt_spid LIKE CONCAT('%',filterBy,'%') OR CONCAT(LEFT(scn_fname, 1), ' ', LEFT(scn_lname, 1)) LIKE CONCAT('%',filterBy,'%'))
	UNION

    SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, scn_fname fname, scn_mi mi, scn_lname lname, scn_gender_curr gender,
    scn_dob dob, NULL AS consentDate, NULL AS consentVersion, scn_mrn mrn, CONCAT(LEFT(scn_fname, 1), ' ', LEFT(scn_lname, 1)) spid, c.pen_id encounterId,
    b.spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, NULL AS enrollmentDate, PEN_LAST_CHANGE_DT lastEdited
	,spt_pat_id, b.sev_event_name, b.sev_short_cd,
    CASE WHEN (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) > 0 THEN
    (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) ELSE 0 END AS issues , sev_event_order
    FROM (
		SELECT spt_id, sev_event_name, sev_short_cd ,
			pen_id , sev_event_order
			FROM study_events
			JOIN study_site_participants
			LEFT JOIN (SELECT pen_id, pen_spt_id, pen_event_name, PEN_ENC_DT FROM participant_encounters) B ON pen_spt_id = spt_id AND pen_event_name = sev_event_name
			ORDER BY study_site_participants.created_dt, IFNULL(PEN_ENC_DT, '2100-01-01')) B
    LEFT JOIN participant_encounters c ON b.pen_id = c.pen_id AND b.spt_id = c.pen_spt_id
	JOIN study_site_participants d ON d.spt_id = b.spt_id AND spt_pat_id IS NULL
    JOIN screening ON spt_scn_id = scn_id
	AND spt_stu_id = studyId AND spt_sit_id = siteId AND (spt_spid LIKE CONCAT('%',filterBy,'%') OR CONCAT(LEFT(scn_fname, 1), ' ', LEFT(scn_lname, 1)) LIKE CONCAT('%',filterBy,'%'))
	ORDER BY
		CASE WHEN sortBy='lastEdited ASC' THEN lastEdited END , -- studysiteparticipantId asc, IFNULL(encounterDate,'2100-01-01')  asc, sev_event_order asc,
		CASE WHEN sortBy='gender ASC' THEN gender END ASC,
		CASE WHEN sortBy='lastEdited DESC' THEN lastEdited END DESC,
		CASE WHEN sortBy='gender DESC' THEN gender END DESC,
		CASE WHEN sortBy='enrollmentDate ASC' THEN enrollmentDate END ASC,
		CASE WHEN sortBy='enrollmentDate DESC' THEN enrollmentDate END DESC,
        studysiteparticipantId , encounterDate IS NULL, encounterDate ASC, sev_event_order  ASC;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Study_GetAllTests`()
BEGIN
	SELECT TES_ID TestId, TES_TEST_CD TestCode, TES_TEST_NAMES TestName
    FROM tests where TES_STATUS = 'Active';
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Study_site_participants_update_spid`(SPTID varchar(50))
BEGIN
    SELECT SPT_PAT_ID into @SPT_PAT_ID from  study_site_participants WHERE SPT_ID=SPTID;

		   if @SPT_PAT_ID is NOT null then
			begin

                 SELECT PAT_PID INTO @PAT_PID from participants WHERE PAT_ID=@SPT_PAT_ID;

                 IF @PAT_PID IS NOT NULL THEN
                 BEGIN
					UPDATE study_site_participants SET SPT_SPID=@PAT_PID where SPT_ID=@SPT_ID;

                 END;
                 END IF;

			end;
			end if;
  END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Summary_GetEncounterDetail`(penId varchar(36))
SELECT data_capture_steps.DCS_DISPLAY_NAME as formName,
    participant_crf_details.pcd_crf_status as status,
    participant_crf_details.PCD_CRF_ENTRY_DT as entryDate,
    LOWER(REPLACE(data_capture_steps.DCS_DISPLAY_NAME,' ','-'))  AS link,
    participant_encounters.PEN_EVENT_NAME as encounterType
    FROM participant_crf_details
    JOIN participant_encounters ON pen_id = participant_crf_details.pcd_pen_id
    JOIN crf_library  ON crf_library.crf_id = participant_crf_details.pcd_crf_id
    join data_capture_steps on data_capture_steps.DCS_STEP_CD = crf_library.CRF_SHORT_CODE
    WHERE pcd_pen_id = penId ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Summary_GetEncounterSummary`(patId varchar(36))
SELECT pen_id as penId, pen_event_name as visitType,
    pen_enc_dt visitDate FROM participant_encounters
    WHERE pen_spt_id IN (SELECT spt_id FROM study_site_participants
    WHERE spt_pat_id = patId) ORDER BY PEN_ENC_DT ASC ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Summary_GetParticipantDischargeDetail`(penId varchar(36))
SELECT PDC_EDC_PROVIDE as value, PDC_NOTE as note FROM participant_discharge WHERE PDC_ECO_ID = penId ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Summary_GetPatientInfo`(patId varchar(36))
SELECT pat_id AS patId, CONCAT(pat_fname, ' ', pat_lname) AS `name`,
    pat_gender_curr AS gender, pat_dob AS dob, spt_id AS studyParticipantId FROM participants
    JOIN study_site_participants ON pat_id=spt_pat_id WHERE pat_id = patId ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Summary_GetSpecimenCollectionDetail`(penId varchar(36))
SELECT specimen_type as type, specimen_date as collectionDate,
	specimen_sent_to as labName, lab_result_date as resultDate
	FROM specimen_tracking WHERE encounter = penId ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Sync_GetAll`(fromDate datetime)
BEGIN
	# INPUT : '2011-10-10 10:10:00'
    CALL Sync_GetJsonFromTable('app_versions', CONCAT('AVR_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @app_versions);
    CALL Sync_GetJsonFromTable('cqr_question_responses', CONCAT('CQR_LAST_CHANGED_DT >= ', '\'' , fromDate, '\''), @cqr_question_responses);
    CALL Sync_GetJsonFromTable('crf_library', CONCAT('CRF_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @crf_library);
    CALL Sync_GetJsonFromTable('crf_questions', CONCAT('CRQ_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @crf_questions);
    CALL Sync_GetJsonFromTable('crf_sections', CONCAT('CRS_LAST_CHANGED_DT >= ', '\'' , fromDate, '\''), @crf_sections);
    CALL Sync_GetJsonFromTable('data_capture_steps', CONCAT('DCS_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @data_capture_steps);
    CALL Sync_GetJsonFromTable('encounter_data_details', CONCAT('EDD_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @encounter_data_details);
    CALL Sync_GetJsonFromTable('encounter_data_summary', CONCAT('EDS_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @encounter_data_summary);
    CALL Sync_GetJsonFromTable('encounter_lab_result', CONCAT('ELR_LAST_CHANGED_DT >= ', '\'' , fromDate, '\''), @encounter_lab_result);
    CALL Sync_GetJsonFromTable('encounter_med_orders', CONCAT('EMO_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @encounter_med_orders);
    CALL Sync_GetJsonFromTable('encounter_referrals', CONCAT('ERE_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @encounter_referrals);
    CALL Sync_GetJsonFromTable('encounter_test_orders', CONCAT('ETO_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @encounter_test_orders);
    CALL Sync_GetJsonFromTable('lab_tests', CONCAT('LBT_LAST_CHANGED_DT >= ', '\'' , fromDate, '\''), @lab_tests);
    CALL Sync_GetJsonFromTable('medications', CONCAT('MED_LAST_USR_ID >= ', '\'' , fromDate, '\''), @medications);
    CALL Sync_GetJsonFromTable('participant_crf_details', CONCAT('PCD_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @participant_crf_details);
    CALL Sync_GetJsonFromTable('participant_crf_responses', CONCAT('PCR_LAST_CHANGED_DT >= ', '\'' , fromDate, '\''), @participant_crf_responses);
    CALL Sync_GetJsonFromTable('participant_demographics', CONCAT('PDG_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @participant_demographics);
    CALL Sync_GetJsonFromTable('participant_discharge', CONCAT('PDC_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @participant_discharge);
    CALL Sync_GetJsonFromTable('participant_encounters', CONCAT('PEN_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @participant_encounters);
    CALL Sync_GetJsonFromTable('participant_encounter_vitals', CONCAT('PEV_LAST_CHANGED_DT >= ', '\'' , fromDate, '\''), @participant_encounter_vitals);
    CALL Sync_GetJsonFromTable('participant_medication_history', CONCAT('PM_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @participant_medication_history);
    CALL Sync_GetJsonFromTable('participants', CONCAT('PAT_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @participants);
    CALL Sync_GetJsonFromTable('participant_study_consents', CONCAT('PSC_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @participant_study_consents);
    CALL Sync_GetJsonFromTable('pid_counter_assignments', CONCAT('PCA_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @pid_counter_assignments);
    CALL Sync_GetJsonFromTable('question_library', CONCAT('QLY_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @question_library);
    CALL Sync_GetJsonFromTable('referrals', CONCAT('REF_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @referrals);
    CALL Sync_GetJsonFromTable('screening', CONCAT('SCN_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @screening);
    CALL Sync_GetJsonFromTable('site_registered_studies', CONCAT('SRS_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @site_registered_studies);
    CALL Sync_GetJsonFromTable('sites', CONCAT('SIT_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @sites);
    CALL Sync_GetJsonFromTable('studies', CONCAT('STU_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @studies);
    CALL Sync_GetJsonFromTable('study_consents', CONCAT('SCO_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @study_consents);
    CALL Sync_GetJsonFromTable('study_events', CONCAT('SEV_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @study_events);
    CALL Sync_GetJsonFromTable('study_event_steps', CONCAT('SVS_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @study_event_steps);
    CALL Sync_GetJsonFromTable('study_site_participants', CONCAT('SPT_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @study_site_participants);
    CALL Sync_GetJsonFromTable('study_versions', CONCAT('SVE_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @study_versions);
    CALL Sync_GetJsonFromTable('tenant_addresses', CONCAT('TAD_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @tenant_addresses);
    CALL Sync_GetJsonFromTable('tenant_medications', CONCAT('TME_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @tenant_medications);
    CALL Sync_GetJsonFromTable('tenant_referrals', CONCAT('TRE_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @tenant_referrals);
    CALL Sync_GetJsonFromTable('tenants', CONCAT('TNT_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @tenants);
    CALL Sync_GetJsonFromTable('tenant_sites', CONCAT('TSI_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @tenant_sites);
    CALL Sync_GetJsonFromTable('tenant_steps', CONCAT('TSE_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @tenant_steps);
    CALL Sync_GetJsonFromTable('tenant_studies', CONCAT('TST_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @tenant_studies);
    CALL Sync_GetJsonFromTable('tenant_tests', CONCAT('TTE_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @tenant_tests);
    CALL Sync_GetJsonFromTable('tenant_users', CONCAT('TUS_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @tenant_users);
    CALL Sync_GetJsonFromTable('tests', CONCAT('TES_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @tests);
    CALL Sync_GetJsonFromTable('unit_of_measurements', CONCAT('UOM_LAST_CHANGED_DT >= ', '\'' , fromDate, '\''), @unit_of_measurements);
    CALL Sync_GetJsonFromTable('users', CONCAT('USR_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @users);
    CALL Sync_GetJsonFromTable('vitals', CONCAT('VTL_LAST_CHANGED_DT >= ', '\'' , fromDate, '\''), @vitals);
    CALL Sync_GetJsonFromTable('document_library', CONCAT('DOC_UPLOAD_DATE >= ', '\'' , fromDate, '\''), @document_library);
    CALL Sync_GetJsonFromTable('participant_discharge', CONCAT('PDC_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @participant_discharge);
    SELECT
        @app_versions as app_versions,
        @cqr_question_responses as cqr_question_responses,
        @crf_library as crf_library,
        @crf_questions as crf_questions,
        @crf_sections as crf_sections,
        @data_capture_steps as data_capture_steps,
        @encounter_data_details as encounter_data_details,
        @encounter_data_summary as encounter_data_summary,
        @encounter_lab_result as encounter_lab_result,
        @encounter_med_orders as encounter_med_orders,
        @encounter_referrals as encounter_referrals,
        @encounter_test_orders as encounter_test_orders,
        @lab_tests as lab_tests,
        @medications as medications,
        @participant_crf_details as participant_crf_details,
        @participant_crf_responses as participant_crf_responses,
        @participant_demographics as participant_demographics,
        @participant_discharge as participant_discharge,
        @participant_encounters as participant_encounters,
        @participant_encounter_vitals as participant_encounter_vitals,
        @participant_medication_history as participant_medication_history,
        @participants as participants,
        @participant_study_consents as participant_study_consents,
        @pid_counter_assignments as pid_counter_assignments,
        @question_library as question_library,
        @referrals as referrals,
        @screening as screening,
        @site_registered_studies as site_registered_studies,
        @sites as sites,
        @studies as studies,
        @study_consents as study_consents,
        @study_events as study_events,
        @study_event_steps as study_event_steps,
        @study_site_participants as study_site_participants,
        @study_versions as study_versions,
        @tenant_addresses as tenant_addresses,
        @tenant_medications as tenant_medications,
        @tenant_referrals as tenant_referrals,
        @tenants as tenants,
        @tenant_sites as tenant_sites,
        @tenant_steps as tenant_steps,
        @tenant_studies as tenant_studies,
        @tenant_tests as tenant_tests,
        @tenant_users as tenant_users,
        @tests as tests,
        @unit_of_measurements as unit_of_measurements,
        @users as users,
        @vitals as vitals,
        @document_library as document_library,
        @participant_discharge as participant_discharge;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Sync_GetAllPrimaryKeys`(OUT results JSON)
BEGIN
	SET results = JSON_OBJECT(
		'api_logs', 'ID',
		'app_versions', 'AVR_ID',
        'cqr_question_responses', 'CQR_ID',
        'crf_library', 'CRF_ID',
        'crf_questions', 'CRQ_ID',
        'crf_sections', 'CRS_ID',
        'data_capture_steps', 'DCS_ID',
        'encounter_data_details', 'EDD_ID',
        'encounter_data_summary', 'EDS_PEN_ID',
        'encounter_lab_result', 'ELR_ID',
        'encounter_med_orders', 'EMO_ID',
        'encounter_referrals', 'ERE_ID',
        'encounter_test_orders', 'ETO_ID',
        'lab_tests', 'LBT_ID',
        'login_history', 'ID',
        'medications', 'MED_ID',
        'participant_crf_details', 'PCD_ID',
        'participant_crf_responses', 'PCR_ID',
        'participant_demographics', 'PDG_ID',
        'participant_encounters', 'PEN_ID',
        'participant_encounter_vitals', 'PEV_ID',
        'participant_medication_history', 'PM_ID',
        'participants', 'PAT_ID',
        'participant_study_consents', 'PSC_ID',
        'pid_counter_assignments', 'PCA_SRS_ID',
        'question_library', 'QLY_ID',
        'referrals', 'REF_ID',
        'reset_password', 'RSE_ID',
        'screening', 'SCN_ID',
        'site_registered_studies', 'SRS_ID',
        'sites', 'SIT_ID',
        'studies', 'STU_ID',
        'study_consents', 'SCO_ID',
        'study_events', 'SEV_ID',
        'study_event_steps', 'SVS_ID',
        'study_site_participants', 'SPT_ID',
        'study_versions', 'SVE_ID',
        'tenant_addresses', 'TAD_ID',
        'tenant_medications', 'TME_ID',
        'tenant_referrals', 'TRE_ID',
        'tenants', 'TNT_ID',
        'tenant_sites', 'TSI_ID',
        'tenant_steps', 'TSE_ID',
        'tenant_studies', 'TST_ID',
        'tenant_tests', 'TTE_ID',
        'tenant_users', 'TUS_ID',
        'tests', 'TES_ID',
        'unit_of_measurements', 'UOM_ID',
        'users', 'USR_ID',
        'vitals', 'VTL_ID',
        'document_library', 'DOC_ID',
        'participant_discharge', 'PDC_ID'
    );

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Sync_GetJsonFromTable`(pTableName text, whereCondi text, OUT outvar json)
BEGIN
	SET SESSION group_concat_max_len = 1000000;

	SELECT  GROUP_CONCAT(CONCAT("'", COLUMN_NAME, "', ", COLUMN_NAME) SEPARATOR ',')
	INTO    @cols
	FROM    information_schema.columns
	WHERE   TABLE_NAME = pTableName AND TABLE_SCHEMA = database();
	SET @q = CONCAT('SELECT CONCAT(\'[\',GROUP_CONCAT(JSON_OBJECT(', @cols, ')), \']\') into @outvar FROM ', pTableName);
	SET @q = CONCAT(@q, ' WHERE ', whereCondi);
	SET @q = CONCAT(@q, ';');
	PREPARE statement FROM @q;
	EXECUTE statement;
    select @outvar into outvar;

	DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Sync_Update`(jsonData json)
BEGIN
	# INPUT : {"device" : { "DEVICEID":  "2342342"}, "inserts": { "screening": [{ "SCN_ID": "6d95c3cc-88b8-11e8-9cb2-a6cf71072f73", "SCN_TNT_ID": "6d95c692-88b8-11e8-9cb2-a6cf71072f73", "SCN_MRN": "Test Data", "SCN_FNAME": "First Name", "SCN_MI": "M", "SCN_LNAME": "Test", "SCN_GENDER_CURR": "data", "SCN_DOB": "1990-10-01", "SCN_SCREEN_DT": "2018-10-01 10:00:00", "SCN_SCREEN_STATUS": "test", "SCN_LAST_USR_ID": "6d95c692-88b8-11e8-9cb2-a6cf71072f73", "SCN_LAST_CHANGE_DT": "2018-10-01 10:00:00" }, { "SCN_ID": "6d95c7e6-88b8-11e8-9cb2-a6cf71072f73", "SCN_TNT_ID": "6d95cb60-88b8-11e8-9cb2-a6cf71072f73", "SCN_MRN": "Test Data", "SCN_FNAME": "First Name", "SCN_MI": "M", "SCN_LNAME": "Test", "SCN_GENDER_CURR": "data", "SCN_DOB": "1990-12-15", "SCN_SCREEN_DT": "2018-07-18 10:00:00", "SCN_SCREEN_STATUS": "test", "SCN_LAST_USR_ID": "6d95cb60-88b8-11e8-9cb2-a6cf71072f73", "SCN_LAST_CHANGE_DT": "2018-07-18 10:00:00" }], "study_consents": [] }, "delete": { "screening": ["6d95c3cc-88b8-11e8-9cb2-a6cf71072f73", "6d95c7e6-88b8-11e8-9cb2-a6cf71072f73", "hfghdfghfg-fghfdsfg"], "study_consents": ["6d95c567-88b8-11e8-9cb2-a6cf71072f73", "6d95c3fh-88b8-11e8-9cb2-a6cf71072f73", "6d95dkfg-88b8-11e8-9cb2-a6cf71072f73"] } }
	DECLARE insertData JSON;
    DECLARE deleteData JSON;
	DECLARE insertTblNames JSON;
    DECLARE deleteTblNames JSON;

    DECLARE counter INT DEFAULT  0;
    DECLARE dataCounter INT DEFAULT  0;
    DECLARE colCounter INT DEFAULT 0;
    DECLARE p_pid VARCHAR(50) DEFAULT null;

    SET SESSION FOREIGN_KEY_CHECKS = 0;

	SET insertData = JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT( '$.inserts')));
    SET deleteData = JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT( '$.delete')));

    SET insertTblNames = JSON_KEYS(insertData);
    SET deleteTblNames = JSON_KEYS(deleteData);

    # Get all tables primary keys
    CALL Sync_GetAllPrimaryKeys(@primaryKeys);

    # INSERT AND UPDATE PROCESS
    WHILE ( counter < JSON_LENGTH(insertTblNames) ) DO
-- CALL DEBUG(false, concat('counter: ', counter));
		# Get table name
        SET @tblName = JSON_UNQUOTE(JSON_EXTRACT(insertTblNames, CONCAT( '$[', counter, ']')));
-- CALL DEBUG(false, concat('@tblName: ', @tblName));
        # Get table's primary key
        SET @tblPrimaryKey = JSON_UNQUOTE(JSON_EXTRACT(@primaryKeys, CONCAT( '$.', @tblName)));
        SET dataCounter = 0;
        # Get records
        SET @tblData = JSON_UNQUOTE(JSON_EXTRACT(insertData, CONCAT( '$.', @tblName)));
-- CALL DEBUG(false, concat('@tblData: ', @tblData));
-- CALL DEBUG(false, concat('dataCounter 0: ', dataCounter));
        WHILE ( dataCounter < JSON_LENGTH(@tblData) ) DO
-- CALL DEBUG(false, concat('dataCounter 1: ', dataCounter));
            SET @tblRec = JSON_UNQUOTE(JSON_EXTRACT(@tblData, CONCAT( '$[', dataCounter, ']')));
-- CALL DEBUG(false, concat('@tblRec: ', @tblRec));
            # Get primary key value
            SET @tblPrimaryValue = JSON_UNQUOTE(JSON_EXTRACT(@tblRec, CONCAT( '$.', @tblPrimaryKey)));

            # CHECK DUPLICATE QUERY BUILD HERE
            SET @checkQuery = CONCAT('SELECT COUNT(*) into @countRec FROM ', @tblName, ' WHERE ', @tblPrimaryKey, ' = "', @tblPrimaryValue, '";');

            PREPARE statement FROM @checkQuery;
			EXECUTE statement;
			DEALLOCATE PREPARE statement;

            SET @columnCounter = 0;

            SET @column = '';
            SET @value = '';
            SET @columnValue = '';
            SET @columnsArray = JSON_KEYS(@tblRec);
            SET @valuesArray = JSON_EXTRACT(@tblRec, CONCAT( '$.*'));
-- CALL DEBUG(false, concat('@valuesArray: ', @valuesArray));
			WHILE ( @columnCounter < JSON_LENGTH(@columnsArray) ) DO
				# table keys & values collect here
				IF @countRec = 0 THEN
					# For insert query
					IF @column = '' then
						SET @column = JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']')));
						SET @value = JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']'));
					ELSE
						SET @column = REPLACE(TRIM(CONCAT(@column,'~',JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']'))))), '~', ',');
						SET @value = REPLACE(TRIM(CONCAT(@value,'~',JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']')))), '~', ',');
					END IF;
				ELSE
					# For update query
					IF @columnValue = '' then
						SET @columnValue = CONCAT(
							JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']'))),
                            '=',
                            JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']'))
                        );
					ELSE
						SET @columnValue = REPLACE(TRIM(CONCAT(@columnValue,'~', CONCAT(
							JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']'))),
                            '=',
                            JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']'))
                        ))), '~', ',');
					END IF;
                END IF;
				SET @columnCounter = @columnCounter + 1;

			END WHILE;

            IF @countRec = 0 THEN
				# INSERT QUERY BUILD HERE



				SET @insertQuery = CONCAT('INSERT INTO ', @tblName, ' (', @column, ') VALUES (', @value, ')');

				PREPARE statement FROM @insertQuery;
				EXECUTE statement;
				DEALLOCATE PREPARE statement;


            ELSE
				# UPDATE QUERY BUILD HERE
				SET @updateQuery = CONCAT('UPDATE ', @tblName,' SET ', @columnValue, ' WHERE ', @tblPrimaryKey, ' = "', @tblPrimaryValue, '";');

				PREPARE statement FROM @updateQuery;
				EXECUTE statement;
				DEALLOCATE PREPARE statement;
            END IF;

			SET dataCounter = dataCounter + 1;

		END WHILE;

		SET counter = counter + 1;
	END WHILE;


    # DELETE PROCESS
    SET counter = 0;
    SET dataCounter = 0;

    WHILE ( counter < JSON_LENGTH(deleteTblNames) ) DO
		# Get table name
        SET @tblName = JSON_UNQUOTE(JSON_EXTRACT(deleteTblNames, CONCAT( '$[', counter, ']')));

        # Get table's primary key
        SET @tblPrimaryKey = JSON_UNQUOTE(JSON_EXTRACT(@primaryKeys, CONCAT( '$.', @tblName)));

        # Get records
        SET @tblData = JSON_UNQUOTE(JSON_EXTRACT(deleteData, CONCAT( '$.', @tblName)));

        WHILE ( dataCounter < JSON_LENGTH(@tblData) ) DO

            # Get primary key value
            SET @tblPrimaryValue = JSON_UNQUOTE(JSON_EXTRACT(@tblData, CONCAT( '$[', dataCounter, ']')));

            # DELETE QUERY BUILD HERE
            SET @deleteQuery = CONCAT('DELETE FROM ', @tblName, ' WHERE ', @tblPrimaryKey, ' = "', @tblPrimaryValue, '";');

            PREPARE statement FROM @deleteQuery;
			EXECUTE statement;
			DEALLOCATE PREPARE statement;
            SET dataCounter = dataCounter + 1;

        END WHILE;
        SET counter = counter + 1;

    END WHILE;

    # Update DEVICE ID with Synch Date
    SET @deviceId = JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT( '$.device.DEVICEID')));

    SELECT SYN_ID into @syncId from sync_database where DEVICEID = @deviceId;

    IF (@syncId IS NULL || @syncId = '' ) THEN
		INSERT INTO sync_database ( SYN_ID, DEVICEID ) VALUES (uuid(), @deviceId);
    ELSE
		UPDATE sync_database SET LAST_UPDATED_DATE = NOW() WHERE SYN_ID = @syncId;
    END IF;

    SELECT * from sync_database where DEVICEID = @deviceId;

-- SELECT * FROM DEBUG;
-- CALL DEBUG(true, '');
	SET SESSION FOREIGN_KEY_CHECKS = 1;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Sync_Update_Unique_SPID`(jsonData json)
BEGIN
	# INPUT : {"device" : { "DEVICEID":  "2342342"}, "inserts": { "screening": [{ "SCN_ID": "6d95c3cc-88b8-11e8-9cb2-a6cf71072f73", "SCN_TNT_ID": "6d95c692-88b8-11e8-9cb2-a6cf71072f73", "SCN_MRN": "Test Data", "SCN_FNAME": "First Name", "SCN_MI": "M", "SCN_LNAME": "Test", "SCN_GENDER_CURR": "data", "SCN_DOB": "1990-10-01", "SCN_SCREEN_DT": "2018-10-01 10:00:00", "SCN_SCREEN_STATUS": "test", "SCN_LAST_USR_ID": "6d95c692-88b8-11e8-9cb2-a6cf71072f73", "SCN_LAST_CHANGE_DT": "2018-10-01 10:00:00" }, { "SCN_ID": "6d95c7e6-88b8-11e8-9cb2-a6cf71072f73", "SCN_TNT_ID": "6d95cb60-88b8-11e8-9cb2-a6cf71072f73", "SCN_MRN": "Test Data", "SCN_FNAME": "First Name", "SCN_MI": "M", "SCN_LNAME": "Test", "SCN_GENDER_CURR": "data", "SCN_DOB": "1990-12-15", "SCN_SCREEN_DT": "2018-07-18 10:00:00", "SCN_SCREEN_STATUS": "test", "SCN_LAST_USR_ID": "6d95cb60-88b8-11e8-9cb2-a6cf71072f73", "SCN_LAST_CHANGE_DT": "2018-07-18 10:00:00" }], "study_consents": [] }, "delete": { "screening": ["6d95c3cc-88b8-11e8-9cb2-a6cf71072f73", "6d95c7e6-88b8-11e8-9cb2-a6cf71072f73", "hfghdfghfg-fghfdsfg"], "study_consents": ["6d95c567-88b8-11e8-9cb2-a6cf71072f73", "6d95c3fh-88b8-11e8-9cb2-a6cf71072f73", "6d95dkfg-88b8-11e8-9cb2-a6cf71072f73"] } }
	DECLARE insertData JSON;
    DECLARE deleteData JSON;
	DECLARE insertTblNames JSON;
    DECLARE deleteTblNames JSON;

    DECLARE counter INT DEFAULT  0;
    DECLARE dataCounter INT DEFAULT  0;
    DECLARE colCounter INT DEFAULT 0;
    DECLARE p_pid VARCHAR(50) DEFAULT null;

    SET SESSION FOREIGN_KEY_CHECKS = 0;

	SET insertData = JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT( '$.inserts')));
    SET deleteData = JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT( '$.delete')));

    SET insertTblNames = JSON_KEYS(insertData);
    SET deleteTblNames = JSON_KEYS(deleteData);

    # Get all tables primary keys
    CALL Sync_GetAllPrimaryKeys(@primaryKeys);

    # INSERT AND UPDATE PROCESS
    WHILE ( counter < JSON_LENGTH(insertTblNames) ) DO
-- CALL DEBUG(false, concat('counter: ', counter));
		# Get table name
        SET @tblName = JSON_UNQUOTE(JSON_EXTRACT(insertTblNames, CONCAT( '$[', counter, ']')));
-- CALL DEBUG(false, concat('@tblName: ', @tblName));
        # Get table's primary key
        SET @tblPrimaryKey = JSON_UNQUOTE(JSON_EXTRACT(@primaryKeys, CONCAT( '$.', @tblName)));
        SET dataCounter = 0;
        # Get records
        SET @tblData = JSON_UNQUOTE(JSON_EXTRACT(insertData, CONCAT( '$.', @tblName)));
-- CALL DEBUG(false, concat('@tblData: ', @tblData));
-- CALL DEBUG(false, concat('dataCounter 0: ', dataCounter));
        WHILE ( dataCounter < JSON_LENGTH(@tblData) ) DO
-- CALL DEBUG(false, concat('dataCounter 1: ', dataCounter));
            SET @tblRec = JSON_UNQUOTE(JSON_EXTRACT(@tblData, CONCAT( '$[', dataCounter, ']')));
-- CALL DEBUG(false, concat('@tblRec: ', @tblRec));
            # Get primary key value
            SET @tblPrimaryValue = JSON_UNQUOTE(JSON_EXTRACT(@tblRec, CONCAT( '$.', @tblPrimaryKey)));

            # CHECK DUPLICATE QUERY BUILD HERE
            SET @checkQuery = CONCAT('SELECT COUNT(*) into @countRec FROM ', @tblName, ' WHERE ', @tblPrimaryKey, ' = "', @tblPrimaryValue, '";');

            PREPARE statement FROM @checkQuery;
			EXECUTE statement;
			DEALLOCATE PREPARE statement;

            SET @columnCounter = 0;

            SET @column = '';
            SET @value = '';
            SET @columnValue = '';
            SET @columnsArray = JSON_KEYS(@tblRec);
            SET @valuesArray = JSON_EXTRACT(@tblRec, CONCAT( '$.*'));
-- CALL DEBUG(false, concat('@valuesArray: ', @valuesArray));
			WHILE ( @columnCounter < JSON_LENGTH(@columnsArray) ) DO
				# table keys & values collect here
				IF @countRec = 0 THEN
					# For insert query
					IF @column = '' then
						SET @column = JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']')));
						SET @value = JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']'));
					ELSE
						SET @column = REPLACE(TRIM(CONCAT(@column,'~',JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']'))))), '~', ',');
						SET @value = REPLACE(TRIM(CONCAT(@value,'~',JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']')))), '~', ',');
					END IF;
				ELSE
					# For update query
					IF @columnValue = '' then
						SET @columnValue = CONCAT(
							JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']'))),
                            '=',
                            JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']'))
                        );
					ELSE
						SET @columnValue = REPLACE(TRIM(CONCAT(@columnValue,'~', CONCAT(
							JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']'))),
                            '=',
                            JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']'))
                        ))), '~', ',');
					END IF;
                END IF;
				SET @columnCounter = @columnCounter + 1;

			END WHILE;

            IF @countRec = 0 THEN
				# INSERT QUERY BUILD HERE
					IF lower(@tblName) = 'participants' THEN
                    BEGIN

                        CALL getSPID(p_pid);

                    END;
					END IF;


				SET @insertQuery = CONCAT('INSERT INTO ', @tblName, ' (', @column, ') VALUES (', @value, ')');

				PREPARE statement FROM @insertQuery;
				EXECUTE statement;
				DEALLOCATE PREPARE statement;

                	if p_pid IS NOT null then
						begin
						 call Participant_UPDATE_SPID(p_pid,@tblPrimaryValue);
                         SET p_pid = NULL;
						end;
					end if;
					IF lower(@tblName) = 'study_site_participants' THEN
                    BEGIN
                    select @tblPrimaryKey;
                    select @tblPrimaryValue;
					# Update Study Site Participant
                        CALL Study_site_participants_update_spid(@tblPrimaryValue);

                    END;
					END IF;

            ELSE
				# UPDATE QUERY BUILD HERE
				SET @updateQuery = CONCAT('UPDATE ', @tblName,' SET ', @columnValue, ' WHERE ', @tblPrimaryKey, ' = "', @tblPrimaryValue, '";');

				PREPARE statement FROM @updateQuery;
				EXECUTE statement;
				DEALLOCATE PREPARE statement;
                # Update Study Site Participant
                 CALL Study_site_participants_update_spid(@tblPrimaryValue);
            END IF;

			SET dataCounter = dataCounter + 1;

		END WHILE;

		SET counter = counter + 1;
	END WHILE;


    # DELETE PROCESS
    SET counter = 0;
    SET dataCounter = 0;

    WHILE ( counter < JSON_LENGTH(deleteTblNames) ) DO
		# Get table name
        SET @tblName = JSON_UNQUOTE(JSON_EXTRACT(deleteTblNames, CONCAT( '$[', counter, ']')));

        # Get table's primary key
        SET @tblPrimaryKey = JSON_UNQUOTE(JSON_EXTRACT(@primaryKeys, CONCAT( '$.', @tblName)));

        # Get records
        SET @tblData = JSON_UNQUOTE(JSON_EXTRACT(deleteData, CONCAT( '$.', @tblName)));

        WHILE ( dataCounter < JSON_LENGTH(@tblData) ) DO

            # Get primary key value
            SET @tblPrimaryValue = JSON_UNQUOTE(JSON_EXTRACT(@tblData, CONCAT( '$[', dataCounter, ']')));

            # DELETE QUERY BUILD HERE
            SET @deleteQuery = CONCAT('DELETE FROM ', @tblName, ' WHERE ', @tblPrimaryKey, ' = "', @tblPrimaryValue, '";');

            PREPARE statement FROM @deleteQuery;
			EXECUTE statement;
			DEALLOCATE PREPARE statement;
            SET dataCounter = dataCounter + 1;

        END WHILE;
        SET counter = counter + 1;

    END WHILE;

    # Update DEVICE ID with Synch Date
    SET @deviceId = JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT( '$.device.DEVICEID')));

    SELECT SYN_ID into @syncId from sync_database where DEVICEID = @deviceId;

    IF (@syncId IS NULL || @syncId = '' ) THEN
		INSERT INTO sync_database ( SYN_ID, DEVICEID ) VALUES (uuid(), @deviceId);
    ELSE
		UPDATE sync_database SET LAST_UPDATED_DATE = NOW() WHERE SYN_ID = @syncId;
    END IF;

    SELECT * from sync_database where DEVICEID = @deviceId;

-- SELECT * FROM DEBUG;
-- CALL DEBUG(true, '');
	SET SESSION FOREIGN_KEY_CHECKS = 1;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `teste`()
BEGIN
  DECLARE i      INT DEFAULT  0;
  DECLARE jCount INT DEFAULT -1;
	DROP TEMPORARY TABLE IF exists tmp;
  CREATE TEMPORARY TABLE tmp( ou_from varchar(100), out_to  varchar(500));
  SET @mapJSON = '[{ "code": "TMP", "value": "0" }, { "code": "TMP1", "value": "-1" }, { "code": "TMP2", "value": "1" }, { "code": "TMP3", "value": "1" }]';
  SET jCount = jCount + JSON_LENGTH( @mapJSON, '$' );
  WHILE ( i <= jCount ) DO
    INSERT INTO tmp( ou_from, out_to )
    VALUES( JSON_EXTRACT(@mapJSON, CONCAT( '$[', i, '].code') )
          , JSON_EXTRACT(@mapJSON, CONCAT( '$[', i, '].value'  ) )
          );
    SET i = i + 1;
  END WHILE;
  SELECT ou_from AS 'from', out_to AS 'to' FROM tmp;
  /*
  SELECT JSON_EXTRACT(@mapJSON, "$[1].from") AS 'from',
         JSON_EXTRACT(@mapJSON, "$[1].to") AS 'to' ;
*/
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `TEST_procedure`()
BEGIN
DECLARE TEMP_INSERT VARCHAR(500) DEFAULT NULL;

                INSERT INTO api_logs (ID,USER_ID,LOG_DATE,LOG_TITLE,record_status)
                VALUES(uuid(),'79edc2fd-843a-11e8-9538-00155d0a851b', curDate(),'test','a');
                select last_insert_id() as insertedId;

				DEALLOCATE PREPARE statement;


END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Users_GetById`(userId varchar(36))
BEGIN
    SELECT USR_ID as id, USR_DISPLAY_TXT as fullName, USR_EMAIL as email, USR_STATUS as status, USR_TYPE as type, USR_UNAME as username
    FROM users
    WHERE USR_ID = userId;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Users_SignIn`(tenantId varchar(36), uname varchar(100), pwd varchar(100))
BEGIN

	DECLARE usrId varchar(36) default '0';
	DECLARE usrPassword varchar(100) default null;
	DECLARE tusId varchar(36) default 0;
	DECLARE usrDisplayTxt varchar(100) default null;
	DECLARE stuId varchar(36) default 0;
	DECLARE sitId varchar(36) default 0;
	DECLARE studyName varchar(100) default null;
	DECLARE siteName varchar(100) default null;
	DECLARE sveId varchar(36) default 0;
	DECLARE sveVerTxt varchar(100) default null;
    DECLARE lastLogin varchar(100) default null;
    DECLARE usrStatus varchar(100) default null;
    DECLARE usrAttempt varchar(100) default null;
    SELECT usr_id, usr_password, tus_id, usr_display_txt, usr_last_change_dt, usr_status, usr_attempt into
	usrId, usrPassword, tusId, usrDisplayTxt, lastLogin, usrStatus, usrAttempt
	from users
	join tenant_users on usr_id = tus_usr_id and tus_tnt_id = tenantId
	WHERE usr_uname = uname LIMIT 1;

    case
    when usrId <> '0' && sha1(pwd) = usrPassword && usrStatus = 'Active' then
		#TODO: Study & Site configuration
		select tst_stu_id, tsi_sit_id, stu_display_txt, sit_site_name, sve_id, sve_ver_txt
		into stuId, sitId, studyName, siteName, sveId, sveVerTxt
		from tenant_studies
		join studies on tst_stu_id = stu_id
		join tenant_sites on tsi_tnt_id = tst_tnt_id
		join sites on tsi_sit_id = sit_id
		join site_registered_studies on stu_id = srs_stu_id and sit_id = srs_sit_id and srs_reg_current = 'Y'
		join study_versions on sve_id = srs_sve_id
		where tst_tnt_id = tenantId;

		update users set usr_last_change_dt = now(), usr_attempt = 0 where USR_ID = usrId;

        insert into login_history (id, user_id,details, status, created_at)
        values (uuid(), usrId, CONCAT('{"uname":', uname, '}'), 'SUCCESS', now());

		select "OK" as status, usrId id, usrDisplayTxt fullName, stuId studyId, sitId siteId, studyName, siteName, lastLogin;

	when usrStatus = 'Inactive' then
		insert into login_history (id, user_id,details, status, created_at)
        values (uuid(), usrId, CONCAT('{"uname":', uname, '}'), 'INACTIVE', now());

		select "INACTIVE" as status;
	when usrStatus = 'Lock' then
		insert into login_history (id, user_id,details, status, created_at)
        values (uuid(), usrId, CONCAT('{"uname":', uname, '}'), 'LOCK', now());

		select "LOCK" as status;
    else
		if usrAttempt < 4 then
			update users set usr_attempt = usrAttempt+1 where USR_ID = usrId;
        else
			update users set usr_attempt = usrAttempt+1, usr_status = 'Lock' where USR_ID = usrId;
		end if;

        insert into login_history (id, details, status, created_at)
        values (uuid(), CONCAT('{"uname":', uname, ',"pwd":', pwd, '}'), 'FAILED', now());

        select "FAILED" as status;

    end case;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `User_CheckEmail`(uname varchar(100))
BEGIN
	SELECT USR_ID as id, USR_EMAIL as email from users WHERE USR_UNAME = uname;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `User_Check_Token`(tk varchar(100))
BEGIN

    SELECT RSE_USR_ID as usrId , RSE_LAST_CHANGE_DT as  lastDate from reset_password WHERE RSE_RESET_TOKEN = tk;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `User_GetAll`()
BEGIN
	SELECT USR_ID uuid, USR_UNAME uname, USR_DISPLAY_TXT fullname, USR_EMAIL email, USR_TYPE utype, USR_STATUS ustatus
    FROM users;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `User_GetDetailsById`(uu_id varchar(36))
BEGIN
	SELECT USR_ID uuid, USR_UNAME uname, USR_DISPLAY_TXT fullname, USR_EMAIL email, USR_TYPE utype, USR_STATUS ustatus
    FROM users WHERE USR_ID = uu_id;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `User_Registration_Data`(tenantId varchar(36),siteId varchar(36), studyId varchar(36),pwd varchar(50), query JSON)
BEGIN
	DECLARE fname varchar(50) default null;
    DECLARE lname varchar(50) default null;
    DECLARE uname varchar(20) default null;
    DECLARE useremail varchar(100) default null;
    DECLARE utype varchar(20) default null;
    DECLARE ustatus varchar(20) default null;
    DECLARE user_password varchar(100) default null;
    DECLARE resID varchar(36) default 0;
    DECLARE uu_ID varchar(36) default 0;
	DECLARE userId varchar(36) default 0;
    DECLARE t_uId varchar(36) default 0;
    DECLARE usrcount int default 0;
    DECLARE fullname varchar(100) default null;

    SET fname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.fname')), '');
    SET lname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.lname')), '');
	  SET uname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.uname')), '');
    SET utype = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.utype')), '');
    SET ustatus = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.ustatus')), '');
    SET useremail = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.email')), '');
    SET uu_ID = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.uId')), '');
	  SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
    SET user_password = pwd;
	  SET fullname = concat(fname," ",lname);

    SELECT count(*) into usrcount FROM users WHERE USR_ID = uu_ID;


	if usrcount = 0 then
		begin
			set resID = usrcount;
			set uu_ID = uuid();
			INSERT INTO users(USR_ID,USR_UNAME,USR_DISPLAY_TXT,USR_EMAIL,USR_TYPE,USR_STATUS,USR_PASSWORD,USR_LAST_CHANGE_DT)
				VALUES(uu_ID,uname,fullname,useremail,utype,ustatus,sha1(user_password),now());
            set t_uId = uuid();
            INSERT INTO tenant_users(TUS_ID,TUS_TNT_ID,TUS_USR_ID,TUS_LAST_LOGIN_DT,TUS_LAST_USR_ID,TUS_LAST_CHANGE_DT)
				VALUES(t_uId,tenantId,uu_ID,now(),userId,now());

		end;
	else
		begin
			set resID =   usrcount;
            UPDATE users
			SET
			`USR_UNAME` = uname,
			`USR_DISPLAY_TXT` = fullname,
			`USR_EMAIL` = useremail,
			`USR_TYPE` = utype,
            `USR_STATUS` = ustatus,
            `USR_LAST_CHANGE_DT`= now()
			WHERE `USR_ID` = uu_ID;
		end;
	end if;
  select resID as InsertedID;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `User_Reset_Password`(usrId varchar(36), pwd varchar(50))
BEGIN

    DECLARE resID varchar(36) default 0;

   	update users set usr_password = sha1(pwd), usr_last_change_dt = now() where usr_id = usrId;

	set resID =  usrId;
	select resID as InsertedID;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `User_Reset_token`(uname varchar(100) , token varchar(100))
BEGIN
	DECLARE usrId varchar(36) default 0;
	DECLARE usrUname varchar(100) default null;
    DECLARE rseId varchar(36) default null;
    DECLARE resID varchar(36) default 0;
    DECLARE tokenStr varchar(100) default 0;

    SET usrUname = uname;
    SET tokenStr = token;

    SELECT USR_ID into usrId from users WHERE USR_UNAME = uname;
    SELECT RSE_ID into rseId  from reset_password WHERE RSE_USR_ID = usrId;

	if rseId is null then
	begin
		set resID =  uuid();
		INSERT INTO reset_password(RSE_ID, RSE_USR_ID, RSE_RESET_TOKEN, RSE_LAST_CHANGE_DT)
			VALUES(resID, usrId, tokenStr, current_timestamp());

	END;
	ELSE
		UPDATE reset_password
			SET `RSE_RESET_TOKEN` = tokenStr,
				`RSE_LAST_CHANGE_DT` =  current_timestamp()
        WHERE
			`RSE_USR_ID` = usrId;

		set resID =  rseId;
	END IF;

     select resID as InsertedID;


END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `Referrals_CreateReferral`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
# 	'{"encounterId":"1","testCode":"ANT BODY","orderEffDate":"2018-05-18 ","userId":"1"}'
	DECLARE encounterId varchar(36) default null;
    DECLARE testCode varchar(100) default null;
	DECLARE userId varchar(36) default null;
    DECLARE isActiveTest BIT default 0;
    DECLARE referralDate DATETIME default null;
    DECLARE referralId varchar(36) default null;
    DECLARE resID varchar(36) default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN
	 select 0 as InsertedID;
	 ROLLBACK;
	END;

    SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');
    SET testCode = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.testCode')), '');
	SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
    SET referralId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.referralId')), '');
    SET referralDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.referralDate')), '');


     START TRANSACTION;

	if referralId <> '' then
        begin
			UPDATE encounter_referrals
			SET
			`ERE_REF_CD` = testCode,
			`ERE_REF_DT` = referralDate,
			`ERE_LAST_USR_ID` = userId,
			`ERE_LAST_CHANGE_DT` = curdate()
			WHERE `ERE_ID` = referralId;
            set resID =  referralId;
        end;
	else
        begin

			set resID =  uuid();

			INSERT INTO encounter_referrals
			(ERE_ID,
            ERE_PEN_ID,
			ERE_REF_CD,
			ERE_REF_DT,
			ERE_LAST_USR_ID,
			ERE_LAST_CHANGE_DT)
			VALUES
			(resID,
            encounterId,
			testCode,
			referralDate,
			userId,
			now());

        end;
	end if;


     select resID as InsertedID;
END;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `Referrals_GetAll`(encounterId varchar(36))
BEGIN
	SELECT ERE_ID as ID, ERE_REF_CD as testCode, ERE_REF_DT as referralDate
    FROM encounter_referrals WHERE ERE_PEN_ID = encounterId  order by ERE_LAST_CHANGE_DT desc;
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `Referrals_DeleteReferral`(referralId varchar(36))
BEGIN

	DECLARE isAvailable INT default 0;
    DECLARE resID varchar(36) default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN
	 select 0 as InsertedID;
	 ROLLBACK;
	END;

	SELECT CASE WHEN count(*) > 0 THEN 1 ELSE 0 END INTO isAvailable
	FROM encounter_referrals
	WHERE ERE_ID = referralId;

     START TRANSACTION;
    if isAvailable = 1 then
	begin
		DELETE FROM encounter_referrals WHERE `ERE_ID` = referralId;
        set resID =  referralId;
	end;
    else
    begin
		set resID =   '-1';
    end;
    end if;
    COMMIT;
     select resID as InsertedID;
END;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `Referrals_GetAllTests`()
BEGIN
	SELECT REF_ID TestId, REF_CD TestCode, REF_NAMES TestName
    FROM referrals;
END;;
DELIMITER ;
