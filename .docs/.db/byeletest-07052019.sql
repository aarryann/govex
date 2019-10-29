/*
SQLyog Community v12.03 (64 bit)
MySQL - 8.0.12 : Database - hectre_live_new
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hectre_live_new` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `hectre_live_new`;

/*Table structure for table `app_versions` */

DROP TABLE IF EXISTS `app_versions`;

CREATE TABLE `app_versions` (
  `AVR_ID` varchar(36) NOT NULL,
  `AVR_DISPLAY_TXT` varchar(100) NOT NULL,
  `AVR_STATUS` varchar(20) NOT NULL DEFAULT 'Active',
  `AVR_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AVR_FILE_LOCATION` varchar(500) NOT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`AVR_ID`),
  UNIQUE KEY `AVR_DISPLAY_TXT` (`AVR_DISPLAY_TXT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_versions` */

insert  into `app_versions`(`AVR_ID`,`AVR_DISPLAY_TXT`,`AVR_STATUS`,`AVR_LAST_CHANGE_DT`,`AVR_FILE_LOCATION`,`record_status`) values ('291887a5-8428-11e8-9538-00155d0a851b','0.1','Active','2018-07-10 20:46:32','services/assets/sqlightscript.txt',NULL);

/*Table structure for table `cqr_question_responses` */

DROP TABLE IF EXISTS `cqr_question_responses`;

CREATE TABLE `cqr_question_responses` (
  `CQR_ID` varchar(36) NOT NULL,
  `CQR_RESPONSE_VALUE` varchar(2000) NOT NULL,
  `CQR_RESPONSE_TEXT` varchar(2000) NOT NULL,
  `CQR_DESCRIPTION` varchar(2000) DEFAULT NULL,
  `CQR_DISPLAY_ORDER` int(11) NOT NULL,
  `CQR_UOM_ID` varchar(36) DEFAULT NULL,
  `CQR_RESPONSE_WEIGHTAGE` int(11) DEFAULT NULL,
  `CQR_LAST_USER_ID` varchar(36) DEFAULT NULL,
  `CQR_LAST_CHANGED_DT` datetime DEFAULT NULL,
  `CQR_RESPONSE_CODE` varchar(45) NOT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`CQR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cqr_question_responses` */

insert  into `cqr_question_responses`(`CQR_ID`,`CQR_RESPONSE_VALUE`,`CQR_RESPONSE_TEXT`,`CQR_DESCRIPTION`,`CQR_DISPLAY_ORDER`,`CQR_UOM_ID`,`CQR_RESPONSE_WEIGHTAGE`,`CQR_LAST_USER_ID`,`CQR_LAST_CHANGED_DT`,`CQR_RESPONSE_CODE`,`record_status`) values ('0216ba3a-b4bf-11e8-ae48-00155d0a851b','Scleral icterus','Scleral icterus','Scleral icterus',1,NULL,NULL,NULL,NULL,'44',NULL),('02177851-b4bf-11e8-ae48-00155d0a851b','Tooth pain','Tooth pain','Tooth pain',2,NULL,NULL,NULL,NULL,'44',NULL),('0217df54-b4bf-11e8-ae48-00155d0a851b','Chest pain','Chest pain','Chest pain',1,NULL,NULL,NULL,NULL,'45',NULL),('0218389c-b4bf-11e8-ae48-00155d0a851b','Palpitations','Palpitations','Palpitations',2,NULL,NULL,NULL,NULL,'45',NULL),('021891ff-b4bf-11e8-ae48-00155d0a851b','Cough','Cough','Cough',1,NULL,NULL,NULL,NULL,'46',NULL),('0218eb37-b4bf-11e8-ae48-00155d0a851b','Shortness of breath','Shortness of breath','Shortness of breath',2,NULL,NULL,NULL,NULL,'46',NULL),('021940ce-b4bf-11e8-ae48-00155d0a851b','Distension','Distension','Distension',1,NULL,NULL,NULL,NULL,'47',NULL),('02199c0f-b4bf-11e8-ae48-00155d0a851b','Abdominal pain','Abdominal pain','Abdominal pain',2,NULL,NULL,NULL,NULL,'47',NULL),('0219f659-b4bf-11e8-ae48-00155d0a851b','Ascites','Ascites','Ascites',3,NULL,NULL,NULL,NULL,'47',NULL),('021a524a-b4bf-11e8-ae48-00155d0a851b','Change in stool color or blood in stool','Change in stool color or blood in stool','Change in stool color or blood in stool',4,NULL,NULL,NULL,NULL,'47',NULL),('021aab16-b4bf-11e8-ae48-00155d0a851b','Joint swelling','Joint swelling','Joint swelling',1,NULL,NULL,NULL,NULL,'48',NULL),('021b050d-b4bf-11e8-ae48-00155d0a851b','Swelling in legs','Swelling in legs','Swelling in legs',2,NULL,NULL,NULL,NULL,'48',NULL),('021b5e21-b4bf-11e8-ae48-00155d0a851b','No missed doses in last 4 weeks','No missed doses in last 4 weeks\r\n','No missed doses in last 4 weeks\r\n',1,NULL,NULL,NULL,NULL,'49',NULL),('021bb8d3-b4bf-11e8-ae48-00155d0a851b','1-3 missed doses in last 4 weeks','1-3 missed doses in last 4 weeks\r\n','1-3 missed doses in last 4 weeks',2,NULL,NULL,NULL,NULL,'49',NULL),('021c124b-b4bf-11e8-ae48-00155d0a851b','3-10 missed doses in last 4 weeks','3-10 missed doses in last 4 weeks\r\n','3-10 missed doses in last 4 weeks\r\n',3,NULL,NULL,NULL,NULL,'49',NULL),('052b72f5-9ef7-11e9-9de9-00059a3c7a00','HRMP |-12','HRMP |-12','HRMP |-12',8,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('0b08c7b0-9e61-11e9-9de9-00059a3c7a00','Yes','Yes','Yes',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','60',NULL),('0e3ef705-b58c-11e8-ae48-00155d0a851b','F0','F0','F0',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'52',NULL),('0e406970-b58c-11e8-ae48-00155d0a851b','F0-1','F0-1','F0-1',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'52',NULL),('0e406cbe-b58c-11e8-ae48-00155d0a851b','F1','F1','F1',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'52',NULL),('0e406fbb-b58c-11e8-ae48-00155d0a851b','F1-2','F1-2','F1-2',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'52',NULL),('0e4072a0-b58c-11e8-ae48-00155d0a851b','F2','F2','F2',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'52',NULL),('0e40758f-b58c-11e8-ae48-00155d0a851b','F2-3','F2-3','F2-3',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'52',NULL),('0e407862-b58c-11e8-ae48-00155d0a851b','F3','F3','F3',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'52',NULL),('0e407b30-b58c-11e8-ae48-00155d0a851b','F3-4','F3-4','F3-4',7,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'52',NULL),('0e407dff-b58c-11e8-ae48-00155d0a851b','F4','F4','F4',8,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'52',NULL),('0e5a1a4d-b80b-11e8-89ed-00155d0a851b','','','',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'56',NULL),('0fd5172d-b80b-11e8-89ed-00155d0a851b','','','',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'56',NULL),('13ec4318-9e61-11e9-9de9-00059a3c7a00','No','No','No',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','60',NULL),('1a84f481-9efb-11e9-9de9-00059a3c7a00','Maskeen Colony','Maskeen Colony','Maskeen Colony',23,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('1a872ee7-9efb-11e9-9de9-00059a3c7a00','Bekan Saydan Colony','Bekan Saydan Colony','Bekan Saydan Colony',24,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('1a8730fa-9efb-11e9-9de9-00059a3c7a00','Muslin + Essa Nagri Christians Colony','Muslin + Essa Nagri Christians Colony','Muslin + Essa Nagri Christians Colony',25,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('1a87326f-9efb-11e9-9de9-00059a3c7a00','Akram Gill Masih Colony','Akram Gill Masih Colony','Akram Gill Masih Colony',26,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('1bf2e6e2-9ef7-11e9-9de9-00059a3c7a00','HRMP (Punjabi)','HRMP (Punjabi)','HRMP (Punjabi)',10,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('2065fef2-ab5f-11e8-b3c7-00155d0a851b','Normal','Normal','Normal',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'41',NULL),('20665f6b-ab5f-11e8-b3c7-00155d0a851b','Abnormal','Abnormal','Abnormal',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'41',NULL),('2139f270-8b56-11e8-b999-00155d0a851b','A-','A-','A-',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'34',NULL),('29c00ce4-8b56-11e8-b999-00155d0a851b','A+','A+','A+',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'34',NULL),('29d713bc-4ee9-11e9-83a3-00059a3c7800','Other','Other','Other',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','2',NULL),('2b36ad2f-5065-11e9-83a3-00059a3c7800','Yes','Yes','Yes',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'57',NULL),('2e37b2da-8b56-11e8-b999-00155d0a851b','B-','B-','B-',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'34',NULL),('31580b9e-9ef7-11e9-9de9-00059a3c7a00','Baba Shera Ki Basti','Baba Shera Ki Basti','Baba Shera Ki Basti',9,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('32ec2c8f-8b56-11e8-b999-00155d0a851b','B+','B+','B+',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'34',NULL),('376b8a10-5065-11e9-83a3-00059a3c7800','No','No','No',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'57',NULL),('379bc082-8b56-11e8-b999-00155d0a851b','O-','O-','O-',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'34',NULL),('3b703de8-8b56-11e8-b999-00155d0a851b','O+','O+','O+',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'34',NULL),('3b74fca6-9efa-11e9-9de9-00059a3c7a00','Faisal Colony + Muslim Colony','Faisal Colony + Muslim Colony','Faisal Colony + Muslim Colony',18,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('3f26f0d2-8b56-11e8-b999-00155d0a851b','AB-','AB-','AB-',7,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'34',NULL),('43015954-8b56-11e8-b999-00155d0a851b','AB+','AB+','AB+',8,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'34',NULL),('4a449ffb-9ef9-11e9-9de9-00059a3c7a00','France Colony','France Colony','France Colony',15,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('4e147256-9ef5-11e9-9de9-00059a3c7a00','UNHCR Camp (Afghan)','UNHCR Camp (Afghan)','UNHCR Camp (Afghan)',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('4fa9e570-9efa-11e9-9de9-00059a3c7a00','Hansa Colony','Hansa Colony','Hansa Colony',19,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('502a1bc5-9ef6-11e9-9de9-00059a3c7a00','HRMP Buffer zone(Afghan)','HRMP Buffer zone(Afghan)','HRMP Buffer zone(Afghan)',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('529ad750-9e5f-11e9-9de9-00059a3c7a00','Yes','Yes','Yes',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','58',NULL),('5db03c78-9ef9-11e9-9de9-00059a3c7a00','Dhobhi Ghat','Dhobhi Ghat','Dhobhi Ghat',16,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('60867d2d-9e5f-11e9-9de9-00059a3c7a00','No','No','No',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','58',NULL),('66054374-9e60-11e9-9de9-00059a3c7a00','At home','At home','At home',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','59',NULL),('66ae6f75-9efa-11e9-9de9-00059a3c7a00','Charles Colony','Charles Colony','Charles Colony',20,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('683ef16c-b5ad-11e8-ae48-00155d0a851b','Hep C natural history','Hep C natural history','Hep C natural history',1,NULL,NULL,NULL,NULL,'38',NULL),('683f4916-b5ad-11e8-ae48-00155d0a851b','Hep C treatment','Hep C treatment','Hep C treatment',2,NULL,NULL,NULL,NULL,'38',NULL),('683fa08a-b5ad-11e8-ae48-00155d0a851b','Alcohol counseling','Alcohol counseling','Alcohol counseling',3,NULL,NULL,NULL,NULL,'38',NULL),('683fd854-b5ad-11e8-ae48-00155d0a851b','Safe injection practice and harm reduction','Safe injection practice and harm reduction','Safe injection practice and harm reduction',4,NULL,NULL,NULL,NULL,'38',NULL),('68401428-b5ad-11e8-ae48-00155d0a851b','Sexual transmission','Sexual transmission','Sexual transmission',5,NULL,NULL,NULL,NULL,'38',NULL),('68404d31-b5ad-11e8-ae48-00155d0a851b','Contraception education','Contraception education','Contraception education',6,NULL,NULL,NULL,NULL,'38',NULL),('6c5c1947-9e5f-11e9-9de9-00059a3c7a00','N/A','N/A','N/A',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','58',NULL),('72599292-9e62-11e9-9de9-00059a3c7a00','One Dose','One Dose','One Dose',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','61',NULL),('74173f30-9efa-11e9-9de9-00059a3c7a00','J-Salik Colony','J-Salik Colony','J-Salik Colony',21,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('79b7a046-9ef6-11e9-9de9-00059a3c7a00','HRMP Railway Line','HRMP Railway Line','HRMP Railway Line',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('7c6003c9-b5a0-11e8-ae48-00155d0a851b','mg','mg','mg',1,NULL,NULL,NULL,NULL,'55',NULL),('7d96bd97-9e62-11e9-9de9-00059a3c7a00','Two Dose','Two Dose','Two Dose',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','61',NULL),('7ff26b7b-9e60-11e9-9de9-00059a3c7a00','Barber','Barber','Barber',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','59',NULL),('866bbc84-9e64-11e9-9de9-00059a3c7a00','N/A','N/A','N/A',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','62',NULL),('88a6450d-b5ad-11e8-ae48-00155d0a851b','No missed doses in last 4 weeks','No missed doses in last 4 weeks','No missed doses in last 4 weeks',1,NULL,NULL,NULL,NULL,'39',NULL),('88a9382f-b5ad-11e8-ae48-00155d0a851b','1-3 missed doses in last 4 weeks','1-3 missed doses in last 4 weeks','1-3 missed doses in last 4 weeks',2,NULL,NULL,NULL,NULL,'39',NULL),('88a972d4-b5ad-11e8-ae48-00155d0a851b','3-10 missed doses in last 4 weeks','3-10 missed doses in last 4 weeks','3-10 missed doses in last 4 weeks',3,NULL,NULL,NULL,NULL,'39',NULL),('88a9ab2a-b5ad-11e8-ae48-00155d0a851b','>10 missed doses in last 4 weeks','>10 missed doses in last 4 weeks','>10 missed doses in last 4 weeks',4,NULL,NULL,NULL,NULL,'39',NULL),('89c8323a-b4be-11e8-ae48-00155d0a851b','Grade |','Grade |','Grade |',1,NULL,NULL,NULL,NULL,'43',NULL),('89cbd668-b4be-11e8-ae48-00155d0a851b','Grade ||','Grade ||','Grade ||',2,NULL,NULL,NULL,NULL,'43',NULL),('89cc3044-b4be-11e8-ae48-00155d0a851b','Grade |||','Grade |||','Grade |||',3,NULL,NULL,NULL,NULL,'43',NULL),('89cc8ab8-b4be-11e8-ae48-00155d0a851b','Grade |v','Grade |v','Grade |v',4,NULL,NULL,NULL,NULL,'43',NULL),('8b4cab65-b5a6-11e8-ae48-00155d0a851b','qdaily','qdaily','qdaily',1,NULL,NULL,NULL,NULL,'56',NULL),('8ea8adb7-9e62-11e9-9de9-00059a3c7a00','Three Dose','Three Dose','Three Dose',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','61',NULL),('91eeddb1-a793-11e8-8b48-00155d0a851b','None','None','None',1,NULL,NULL,NULL,NULL,'36',NULL),('91ef34dd-a793-11e8-8b48-00155d0a851b','IFN only','IFN only','IFN only',2,NULL,NULL,NULL,NULL,'36',NULL),('91ef6fd4-a793-11e8-8b48-00155d0a851b','IFN + RBV','IFN + RBV','IFN + RBV',3,NULL,NULL,NULL,NULL,'36',NULL),('91efa85f-a793-11e8-8b48-00155d0a851b','IFN + RBV + DAA','IFN + RBV + DAA','IFN + RBV + DAA',4,NULL,NULL,NULL,NULL,'36',NULL),('91efe1ec-a793-11e8-8b48-00155d0a851b','Study medication','Study medication','Study medication',5,NULL,NULL,NULL,NULL,'36',NULL),('91f01c21-a793-11e8-8b48-00155d0a851b','Oral DAA','Oral DAA','Oral DAA',6,NULL,NULL,NULL,NULL,'36',NULL),('91f056cb-a793-11e8-8b48-00155d0a851b','Unknown','Unknown','Unknown',7,NULL,NULL,NULL,NULL,'36',NULL),('91f0929d-a793-11e8-8b48-00155d0a851b','Other','Other','Other',8,NULL,NULL,NULL,NULL,'36',NULL),('94672b81-9efa-11e9-9de9-00059a3c7a00','Musharaf Colony','Musharaf Colony','Musharaf Colony',22,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('94d78212-b5a6-11e8-ae48-00155d0a851b','BID','BID','BID',2,NULL,NULL,NULL,NULL,'56',NULL),('98044591-a9d1-11e8-8b48-00155d0a851b','SOF+RBV','SOF+RBV','SOF+RBV',1,NULL,NULL,NULL,NULL,'37',NULL),('980a7377-a9d1-11e8-8b48-00155d0a851b','SOF+DAC','SOF+DAC','SOF+DAC',2,NULL,NULL,NULL,NULL,'37',NULL),('980ad16c-a9d1-11e8-8b48-00155d0a851b','Epclusa','Epclusa','Epclusa',3,NULL,NULL,NULL,NULL,'37',NULL),('980b4e9d-a9d1-11e8-8b48-00155d0a851b','Zepatier','Zepatier','Zepatier',4,NULL,NULL,NULL,NULL,'37',NULL),('980bc86b-a9d1-11e8-8b48-00155d0a851b','Harvoni','Harvoni','Harvoni',5,NULL,NULL,NULL,NULL,'37',NULL),('980c42cf-a9d1-11e8-8b48-00155d0a851b','Mavyret','Mavyret','Mavyret',6,NULL,NULL,NULL,NULL,'37',NULL),('980cbbb7-a9d1-11e8-8b48-00155d0a851b','Vosevi','Vosevi','Vosevi',7,NULL,NULL,NULL,NULL,'37',NULL),('980d36eb-a9d1-11e8-8b48-00155d0a851b','Viekira Pak','Viekira Pak','Viekira Pak',8,NULL,NULL,NULL,NULL,'37',NULL),('980daa87-a9d1-11e8-8b48-00155d0a851b','Unknown','Unknown','Unknown',9,NULL,NULL,NULL,NULL,'37',NULL),('980e20dd-a9d1-11e8-8b48-00155d0a851b','Other','Other','Other',10,NULL,NULL,NULL,NULL,'37',NULL),('98b6016d-9e60-11e9-9de9-00059a3c7a00','Both','Both','Both',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','59',NULL),('9d707e52-b264-11e8-ae48-00155d0a851b','Detectable','Detectable','Detectable',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-07 11:39:57','42',NULL),('9d709b27-b264-11e8-ae48-00155d0a851b','Undetectable','Undetectable','Undetectable',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-07 11:39:57','42',NULL),('9d9d8d6f-b5a6-11e8-ae48-00155d0a851b','TID','TID','TID',3,NULL,NULL,NULL,NULL,'56',NULL),('9e82e75e-9e64-11e9-9de9-00059a3c7a00','Married','Married','Married',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','62',NULL),('9f082806-9e62-11e9-9de9-00059a3c7a00','No','No','No',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','61',NULL),('a0970e8e-9e60-11e9-9de9-00059a3c7a00','N/A','N/A','N/A',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','59',NULL),('a2d96e58-9ef7-11e9-9de9-00059a3c7a00','Muslim Colony Bari Imam','Muslim Colony Bari Imam','Muslim Colony Bari Imam',11,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('a45dfc74-5057-11e9-83a3-00059a3c7800','Male','Male','Male',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'19',NULL),('a64110be-b5a6-11e8-ae48-00155d0a851b','PRN','PRN','PRN',4,NULL,NULL,NULL,NULL,'56',NULL),('a8d41454-9ef6-11e9-9de9-00059a3c7a00','HRMP Sorain + Bokra Village','HRMP Sorain + Bokra Village','HRMP Sorain + Bokra Village',7,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('a9368362-ab5c-11e8-b3c7-00155d0a851b','Yes','Yes','Yes',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'40',NULL),('a938b761-ab5c-11e8-b3c7-00155d0a851b','No','No','No',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'40',NULL),('aa4f1536-9e62-11e9-9de9-00059a3c7a00','N/A','N/A','N/A',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','61',NULL),('ae73af67-b5a0-11e8-ae48-00155d0a851b','g','g','g',2,NULL,NULL,NULL,NULL,'55',NULL),('b1eda751-9e64-11e9-9de9-00059a3c7a00','Un Married','Un Married','Un Married',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','62',NULL),('b7312a55-a792-11e8-8b48-00155d0a851b','Responder (SVR)','Responder (SVR)','Responder (SVR)',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'34',NULL),('b73182cc-a792-11e8-8b48-00155d0a851b','Relapse','Relapse','Relapse',2,NULL,NULL,NULL,NULL,'34',NULL),('b731db1c-a792-11e8-8b48-00155d0a851b','Did not complete treatment','Did not complete treatment','Did not complete treatment',3,NULL,NULL,NULL,NULL,'34',NULL),('ba2b30e1-b5a6-11e8-ae48-00155d0a851b','Other','Other','Other',5,NULL,NULL,NULL,NULL,'56',NULL),('be5831f1-b591-11e8-ae48-00155d0a851b','F0','F0','F0',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'53',NULL),('be58561e-b591-11e8-ae48-00155d0a851b','F1','F1','F1',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'53',NULL),('be58596c-b591-11e8-ae48-00155d0a851b','F2','F2','F2',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'53',NULL),('be585c64-b591-11e8-ae48-00155d0a851b','F3','F3','F3',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'53',NULL),('be5864b7-b591-11e8-ae48-00155d0a851b','F4','F4','F4',8,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'53',NULL),('be9a6084-5057-11e9-83a3-00059a3c7800','Female','Female','Female',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'19',NULL),('c6886465-b591-11e8-ae48-00155d0a851b','IVDU','IVDU','IVDU',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'54',NULL),('c68c9eeb-b591-11e8-ae48-00155d0a851b','History of blood transfusion before 1992','History of blood transfusion before 1992','History of blood transfusion before 1992',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'54',NULL),('c68ca23d-b591-11e8-ae48-00155d0a851b','Multiple sexual partners','Multiple sexual partners','Multiple sexual partners',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'54',NULL),('c68ca536-b591-11e8-ae48-00155d0a851b','Tattoos','Tattoos','Tattoos',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'54',NULL),('c68ca7fd-b591-11e8-ae48-00155d0a851b','Snorting','Snorting','Snorting',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'54',NULL),('c68caabf-b591-11e8-ae48-00155d0a851b','Occupational','Occupational','Occupational',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'54',NULL),('c68cad78-b591-11e8-ae48-00155d0a851b','Unknown','Unknown','Unknown',7,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'54',NULL),('c94669f6-b4bf-11e8-ae48-00155d0a851b','>10 missed doses in last 4 weeks','>10 missed doses in last 4 weeks\r\n','>10 missed doses in last 4 weeks\r\n',4,NULL,NULL,NULL,NULL,'49',NULL),('c946c0fa-b4bf-11e8-ae48-00155d0a851b','Easy bleeding or bruising','Easy bleeding or bruising','Easy bleeding or bruising',1,NULL,NULL,NULL,NULL,'50',NULL),('c9471988-b4bf-11e8-ae48-00155d0a851b','Rashes or wounds','Rashes or wounds','Rashes or wounds',1,NULL,NULL,NULL,NULL,'51',NULL),('c9852acd-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',5,NULL,NULL,NULL,NULL,'31',NULL),('c985d292-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',8,NULL,NULL,NULL,NULL,'4',NULL),('c985d928-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',3,NULL,NULL,NULL,NULL,'44',NULL),('c985dc43-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',3,NULL,NULL,NULL,NULL,'45',NULL),('c985df67-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',3,NULL,NULL,NULL,NULL,'46',NULL),('c985e272-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',5,NULL,NULL,NULL,NULL,'47',NULL),('c985e56f-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',3,NULL,NULL,NULL,NULL,'48',NULL),('c985eb80-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',5,NULL,NULL,NULL,NULL,'5',NULL),('c985ee82-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',2,NULL,NULL,NULL,NULL,'50',NULL),('c985f177-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',2,NULL,NULL,NULL,NULL,'51',NULL),('c985f471-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',8,NULL,NULL,NULL,NULL,'54',NULL),('c985f77d-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',6,NULL,NULL,NULL,NULL,'56',NULL),('c985fa75-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',7,NULL,NULL,NULL,NULL,'6',NULL),('c985fd71-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',5,NULL,NULL,NULL,NULL,'7',NULL),('c986006f-bd96-11e8-88c1-00155d0a851b','N/A','N/A','N/A',11,NULL,NULL,NULL,NULL,'8',NULL),('cee08216-9ef4-11e9-9de9-00059a3c7a00','HRMP','HRMP','HRMP',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('d30545e1-9e62-11e9-9de9-00059a3c7a00','Dont Know','Dont Know','Dont Know',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','61',NULL),('d73e3590-9e60-11e9-9de9-00059a3c7a00','12 Years','12 Years','12 Years',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','60',NULL),('e391a65f-9ef8-11e9-9de9-00059a3c7a00','100 Quarters','100 Quarters','100 Quarters',12,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('e594db61-9e60-11e9-9de9-00059a3c7a00','20 Years','20 Years','20 Years',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','60',NULL),('ea0aa589-9ef4-11e9-9de9-00059a3c7a00','HRMP (Afghan)','HRMP (Afghan)','HRMP (Afghan)',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('ec77c9a0-9ef5-11e9-9de9-00059a3c7a00','HRMP (Afghan) Lala Muzafar Dera','HRMP (Afghan) Lala Muzafar Dera','HRMP (Afghan) Lala Muzafar Dera',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('ed2afed7-9ef8-11e9-9de9-00059a3c7a00','66 Quarters','66 Quarters','66 Quarters',13,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('ee289696-9ef9-11e9-9de9-00059a3c7a00','Shopper/Allama Iqbal Colony','Shopper/Allama Iqbal Colony','Shopper/Allama Iqbal Colony',17,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL),('f0cd2e77-a792-11e8-8b48-00155d0a851b','Grade I','Grade I','Grade I',1,NULL,NULL,NULL,NULL,'35',NULL),('f0cf0b93-a792-11e8-8b48-00155d0a851b','Grade II','Grade II','Grade II',2,NULL,NULL,NULL,NULL,'35',NULL),('f0cf7fc9-a792-11e8-8b48-00155d0a851b','Grade III','Grade III','Grade III',3,NULL,NULL,NULL,NULL,'35',NULL),('f0cfbade-a792-11e8-8b48-00155d0a851b','Grade IV','Grade IV','Grade IV',4,NULL,NULL,NULL,NULL,'35',NULL),('f84933e5-8428-11e8-9538-00155d0a851b','Yes','Yes','Yes',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','1',NULL),('f84934c8-8428-11e8-9538-00155d0a851b','No','No','No',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','1',NULL),('f849353d-8428-11e8-9538-00155d0a851b','Positive','Positive','Positive',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','2',NULL),('f84935aa-8428-11e8-9538-00155d0a851b','Negative','Negative','Negative',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','2',NULL),('f8493613-8428-11e8-9538-00155d0a851b','Yes','Yes','Yes',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','3',NULL),('f849367d-8428-11e8-9538-00155d0a851b','No','No','No',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','3',NULL),('f84936e8-8428-11e8-9538-00155d0a851b','1a','1a','Genotype 1a',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','4',NULL),('f8493832-8428-11e8-9538-00155d0a851b','1b','1b','Genotype 1b',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','4',NULL),('f84938aa-8428-11e8-9538-00155d0a851b','2','2','Genetype 2',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','4',NULL),('f8493917-8428-11e8-9538-00155d0a851b','3','3','Genetype 3',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','4',NULL),('f8493983-8428-11e8-9538-00155d0a851b','4','4','Genetype 4',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','4',NULL),('f84939ef-8428-11e8-9538-00155d0a851b','5','5','Genetype 5',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','4',NULL),('f8493a59-8428-11e8-9538-00155d0a851b','6','6','Genetype 6',7,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','4',NULL),('f8493ac4-8428-11e8-9538-00155d0a851b','Immune','Immune','Immune',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','5',NULL),('f8493b30-8428-11e8-9538-00155d0a851b','Non-immune','Non-immune','Non-immune',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','5',NULL),('f8493b9e-8428-11e8-9538-00155d0a851b','Vaccinated','Vaccinated','Vaccinated',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','5',NULL),('f8493c15-8428-11e8-9538-00155d0a851b','Unknown','Unknown','Unknown',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','5',NULL),('f8493c82-8428-11e8-9538-00155d0a851b','Immune','Immune','Immune',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','6',NULL),('f8493ced-8428-11e8-9538-00155d0a851b','Non-immune','Non-immune','Non-immune',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','6',NULL),('f8493d59-8428-11e8-9538-00155d0a851b','Co-Infection','Co-Infection','Co-Infection',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','6',NULL),('f8493dc2-8428-11e8-9538-00155d0a851b','On HBV Meds','On HBV Meds','On HBV Meds',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','6',NULL),('f8493e2d-8428-11e8-9538-00155d0a851b','Unknown','Unknown','Unknown',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','6',NULL),('f8493e99-8428-11e8-9538-00155d0a851b','No response to vaccine','No response to vaccine','No response to vaccine',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-21 00:00:00','6',NULL),('f8493f08-8428-11e8-9538-00155d0a851b','Positive','Positive','Positive',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'7',NULL),('f8493f73-8428-11e8-9538-00155d0a851b','Positive on ARV','Positive on ARV','Positive on ARV',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'7',NULL),('f8493fde-8428-11e8-9538-00155d0a851b','Negative','Negative','Negative',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'7',NULL),('f849404a-8428-11e8-9538-00155d0a851b','Unknown','Unknown','Unknown',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'7',NULL),('f84940b6-8428-11e8-9538-00155d0a851b','None','None','None',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'8',NULL),('f8494120-8428-11e8-9538-00155d0a851b','Liver biopsy','Liver biopsy','Liver biopsy',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'8',NULL),('f849418b-8428-11e8-9538-00155d0a851b','Liver US','Liver US','Liver US',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'8',NULL),('f84941f7-8428-11e8-9538-00155d0a851b','CT Abdomen','CT Abdomen','CT Abdomen',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'8',NULL),('f8494264-8428-11e8-9538-00155d0a851b','MRI Abdomen','MRI Abdomen','MRI Abdomen',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'8',NULL),('f84942ce-8428-11e8-9538-00155d0a851b','Fibrosure','Fibrosure','Fibrosure',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'8',NULL),('f849433c-8428-11e8-9538-00155d0a851b','Fibroscan','Fibroscan','Fibroscan',7,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'8',NULL),('f84943ab-8428-11e8-9538-00155d0a851b','Endoscopy','Endoscopy','Endoscopy',8,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'8',NULL),('f849441a-8428-11e8-9538-00155d0a851b','Colonoscopy','Colonoscopy','Colonoscopy',9,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'8',NULL),('f8494486-8428-11e8-9538-00155d0a851b','Other','Other','Other',10,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'8',NULL),('f84944f4-8428-11e8-9538-00155d0a851b','G1','G1','G1',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'9',NULL),('f8494563-8428-11e8-9538-00155d0a851b','G2','G2','G2',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'9',NULL),('f84945d2-8428-11e8-9538-00155d0a851b','G3','G3','G3',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'9',NULL),('f849464c-8428-11e8-9538-00155d0a851b','G4','G4','G4',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'9',NULL),('f84946bd-8428-11e8-9538-00155d0a851b','S1','S1','S1',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'10',NULL),('f849472b-8428-11e8-9538-00155d0a851b','S2','S2','S2',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'10',NULL),('f849479a-8428-11e8-9538-00155d0a851b','S3','S3','S3',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'10',NULL),('f8494806-8428-11e8-9538-00155d0a851b','S4','S4','S4',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'10',NULL),('f8494872-8428-11e8-9538-00155d0a851b','F1','F1','F1',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'11',NULL),('f84948e0-8428-11e8-9538-00155d0a851b','F2','F2','F2',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'11',NULL),('f849494f-8428-11e8-9538-00155d0a851b','F3','F3','F3',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'11',NULL),('f84949bb-8428-11e8-9538-00155d0a851b','F4','F4','F4',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'11',NULL),('f8494a28-8428-11e8-9538-00155d0a851b','F0','F0','F0',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'12',NULL),('f8494a95-8428-11e8-9538-00155d0a851b','F0-1','F0-1','F0-1',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'12',NULL),('f8494b03-8428-11e8-9538-00155d0a851b','F1-2','F1-2','F1-2',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'12',NULL),('f8494b73-8428-11e8-9538-00155d0a851b','F2','F2','F2',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'12',NULL),('f8494be3-8428-11e8-9538-00155d0a851b','F2-3','F2-3','F2-3',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'12',NULL),('f8494c52-8428-11e8-9538-00155d0a851b','F3','F3','F3',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'12',NULL),('f8494cc1-8428-11e8-9538-00155d0a851b','F3-4','F3-4','F3-4',7,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'12',NULL),('f8494d2d-8428-11e8-9538-00155d0a851b','F4','F4','F4',8,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'12',NULL),('f8494d9c-8428-11e8-9538-00155d0a851b','No varices','No varices','No varices',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'13',NULL),('f8494e0a-8428-11e8-9538-00155d0a851b','Varices','Varices','Varices',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'13',NULL),('f8494e79-8428-11e8-9538-00155d0a851b','Normal','Normal','Normal',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'14',NULL),('f8494ee6-8428-11e8-9538-00155d0a851b','Abnormal','Abnormal','Abnormal',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'14',NULL),('f8494f55-8428-11e8-9538-00155d0a851b','None','None','None',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'15',NULL),('f8494fc4-8428-11e8-9538-00155d0a851b','IFN only','IFN only','IFN only',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'15',NULL),('f8495033-8428-11e8-9538-00155d0a851b','IFN + RBV','IFN + RBV','IFN + RBV',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'15',NULL),('f849509f-8428-11e8-9538-00155d0a851b','IFN + RBV + DAA','IFN + RBV + DAA','IFN + RBV + DAA',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'15',NULL),('f849510e-8428-11e8-9538-00155d0a851b','Study medication','Study medication','Study medication',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'15',NULL),('f849517c-8428-11e8-9538-00155d0a851b','Oral DAA','Oral DAA','Oral DAA',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'15',NULL),('f84951ec-8428-11e8-9538-00155d0a851b','Unknown','Unknown','Unknown',7,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'15',NULL),('f849525b-8428-11e8-9538-00155d0a851b','Other','Other','Other',8,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'15',NULL),('f84952c8-8428-11e8-9538-00155d0a851b','Responder (SVR)','Responder (SVR)','Responder (SVR)',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'16',NULL),('f8495337-8428-11e8-9538-00155d0a851b','Relapse','Relapse','Relapse',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'16',NULL),('f84953a6-8428-11e8-9538-00155d0a851b','Did not complete treatment','Did not complete treatment','Did not complete treatment',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'16',NULL),('f8495411-8428-11e8-9538-00155d0a851b','No cirrhosis','No cirrhosis','No cirrhosis',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f849547e-8428-11e8-9538-00155d0a851b','Cirrhosis compensated','Cirrhosis compensated','Cirrhosis compensated',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f84954eb-8428-11e8-9538-00155d0a851b','Cirrhosis decompensated','Cirrhosis decompensated','Cirrhosis decompensated',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f849555a-8428-11e8-9538-00155d0a851b','Hepatocellular Carcinoma','Hepatocellular Carcinoma','Hepatocellular Carcinoma',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f84955c5-8428-11e8-9538-00155d0a851b','Child-Pugh Class A','Child-Pugh Class A','Child-Pugh Class A',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f8495632-8428-11e8-9538-00155d0a851b','Child-Pugh Class B','Child-Pugh Class B','Child-Pugh Class B',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f84956a0-8428-11e8-9538-00155d0a851b','Child-Pugh Class C','Child-Pugh Class C','Child-Pugh Class C',7,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f849570e-8428-11e8-9538-00155d0a851b','MELD score','MELD score','MELD score',8,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f849577b-8428-11e8-9538-00155d0a851b','APRI score','APRI score','APRI score',9,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f84957e8-8428-11e8-9538-00155d0a851b','FIB-4 score','FIB-4 score','FIB-4 score',10,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f8495856-8428-11e8-9538-00155d0a851b','Liver transplant','Liver transplant','Liver transplant',11,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f84958c4-8428-11e8-9538-00155d0a851b','Other','Other','Other',12,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'17',NULL),('f8495930-8428-11e8-9538-00155d0a851b','Hep A','Hep A','Hep A',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'18',NULL),('f849599d-8428-11e8-9538-00155d0a851b','Hep B','Hep B','Hep B',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'18',NULL),('f8495a0a-8428-11e8-9538-00155d0a851b','Hep A + B','Hep A + B','Hep A + B',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'18',NULL),('f8495f9f-8428-11e8-9538-00155d0a851b','Own','Own','Own',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'22',NULL),('f8496014-8428-11e8-9538-00155d0a851b','Rent','Rent','Rent',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'22',NULL),('f8496083-8428-11e8-9538-00155d0a851b','Homeless','Homeless','Homeless',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'22',NULL),('f84960f3-8428-11e8-9538-00155d0a851b','Other','Other','Other',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'22',NULL),('f8496160-8428-11e8-9538-00155d0a851b','Steady income','Steady income','Steady income',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'23',NULL),('f84961cf-8428-11e8-9538-00155d0a851b','Daily wage','Daily wage','Daily wage',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'23',NULL),('f849623e-8428-11e8-9538-00155d0a851b','Unemployed','Unemployed','Unemployed',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'23',NULL),('f84962ae-8428-11e8-9538-00155d0a851b','Other','Other','Other',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'23',NULL),('f849631b-8428-11e8-9538-00155d0a851b','Owner of the house','Owner of the house','Owner of the house',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'24',NULL),('f8496389-8428-11e8-9538-00155d0a851b','Renter','Renter','Renter',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'24',NULL),('f84963f7-8428-11e8-9538-00155d0a851b','Provided by employer','Provided by employer','Provided by employer',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'24',NULL),('f8496465-8428-11e8-9538-00155d0a851b','User not paying rent','User not paying rent','User not paying rent',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'24',NULL),('f84964dc-8428-11e8-9538-00155d0a851b','Do not know','Do not know','Do not know',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'24',NULL),('f849654a-8428-11e8-9538-00155d0a851b','Other','Other','Other',6,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'24',NULL),('f84965b9-8428-11e8-9538-00155d0a851b','Present','Present','Present',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'25',NULL),('f8496628-8428-11e8-9538-00155d0a851b','Former','Former','Former',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'25',NULL),('f8496699-8428-11e8-9538-00155d0a851b','Never','Never','Never',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'25',NULL),('f8496707-8428-11e8-9538-00155d0a851b','Present','Present','Present',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'26',NULL),('f8496775-8428-11e8-9538-00155d0a851b','Former','Former','Former',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'26',NULL),('f84967e2-8428-11e8-9538-00155d0a851b','Never','Never','Never',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'26',NULL),('f849684d-8428-11e8-9538-00155d0a851b','Present','Present','Present',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'27',NULL),('f84968b9-8428-11e8-9538-00155d0a851b','Former','Former','Former',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'27',NULL),('f8496926-8428-11e8-9538-00155d0a851b','Never','Never','Never',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'27',NULL),('f8496994-8428-11e8-9538-00155d0a851b','Present','Present','Present',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'28',NULL),('f8496a00-8428-11e8-9538-00155d0a851b','Former','Former','Former',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'28',NULL),('f8496a6e-8428-11e8-9538-00155d0a851b','Never','Never','Never',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'28',NULL),('f8496adb-8428-11e8-9538-00155d0a851b','Present','Present','Present',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'29',NULL),('f8496b47-8428-11e8-9538-00155d0a851b','Former','Former','Former',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'29',NULL),('f8496bb3-8428-11e8-9538-00155d0a851b','Never','Never','Never',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'29',NULL),('f8496c1e-8428-11e8-9538-00155d0a851b','Own','Own','Own',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'30',NULL),('f8496c8b-8428-11e8-9538-00155d0a851b','Rent','Rent','Rent',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'30',NULL),('f8496d00-8428-11e8-9538-00155d0a851b','Homeless','Homeless','Homeless',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'30',NULL),('f8496d6c-8428-11e8-9538-00155d0a851b','Other','Other','Other',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'30',NULL),('f8496dd8-8428-11e8-9538-00155d0a851b','Steady income','Steady income','Steady income',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'31',NULL),('f8496e45-8428-11e8-9538-00155d0a851b','Daily wage','Daily wage','Daily wage',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'31',NULL),('f8496fd4-8428-11e8-9538-00155d0a851b','Unemployed','Unemployed','Unemployed',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'31',NULL),('f849705f-8428-11e8-9538-00155d0a851b','Other','Other','Other',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'31',NULL),('f84970cf-8428-11e8-9538-00155d0a851b','Married','Married','Married',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'32',NULL),('f849714a-8428-11e8-9538-00155d0a851b','Widowed','Widowed','Widowed',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'32',NULL),('f84971b1-8428-11e8-9538-00155d0a851b','Separated','Separated','Separated',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'32',NULL),('f8497211-8428-11e8-9538-00155d0a851b','Divorced','Divorced','Divorced',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'32',NULL),('f8497270-8428-11e8-9538-00155d0a851b','Single','Single','Single',5,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'32',NULL),('f84972cf-8428-11e8-9538-00155d0a851b','Associate Degrees','Associate Degrees','Associate Degrees',1,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'33',NULL),('f849732f-8428-11e8-9538-00155d0a851b','Bachelor’s Degrees','Bachelor’s Degrees','Bachelor’s Degrees',2,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'33',NULL),('f849738d-8428-11e8-9538-00155d0a851b','Master’s Degrees','Master’s Degrees','Master’s Degrees',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'33',NULL),('f84973ec-8428-11e8-9538-00155d0a851b','Doctoral Degrees','Doctoral Degrees','Doctoral Degrees',4,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,'33',NULL),('fb2a074e-9e60-11e9-9de9-00059a3c7a00','N/A','N/A','N/A',3,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','60',NULL),('fee23b36-9ef8-11e9-9de9-00059a3c7a00','48 Quarters','48 Quarters','48 Quarters',14,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 20:46:32','63',NULL);

/*Table structure for table `crf_library` */

DROP TABLE IF EXISTS `crf_library`;

CREATE TABLE `crf_library` (
  `CRF_ID` varchar(36) NOT NULL,
  `CRF_SHORT_CODE` varchar(45) NOT NULL,
  `CRF_LONG_NAME` varchar(100) DEFAULT NULL,
  `CRF_DESCRIPTION_TEXT` varchar(200) DEFAULT NULL,
  `CRF_PUBLISHED_DT` date DEFAULT NULL,
  `CRF_VERSION_NUMBER` varchar(10) DEFAULT NULL,
  `CRF_START_DT` date DEFAULT NULL,
  `CRF_END_DT` date DEFAULT NULL,
  `CRF_REQUIRED_REGISTRATION` varchar(3) DEFAULT NULL,
  `CRF_DISPLAY_TYPE` varchar(20) DEFAULT NULL,
  `CRF_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `CRF_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CRF_STU_ID` varchar(36) DEFAULT NULL,
  `CRF_TNT_ID` varchar(36) DEFAULT NULL,
  `CRF_BTN_TEXT` varchar(100) NOT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`CRF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `crf_library` */

insert  into `crf_library`(`CRF_ID`,`CRF_SHORT_CODE`,`CRF_LONG_NAME`,`CRF_DESCRIPTION_TEXT`,`CRF_PUBLISHED_DT`,`CRF_VERSION_NUMBER`,`CRF_START_DT`,`CRF_END_DT`,`CRF_REQUIRED_REGISTRATION`,`CRF_DISPLAY_TYPE`,`CRF_LAST_USR_ID`,`CRF_LAST_CHANGE_DT`,`CRF_STU_ID`,`CRF_TNT_ID`,`CRF_BTN_TEXT`,`record_status`) values ('15500a38-b59f-11e8-ae48-00155d0a851b','MED_HIS','Medication History','Medication History','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-09-11 14:23:45','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Medication History',NULL),('1bb6d3d9-5062-11e9-83a3-00059a3c7800','DR_BLO_NOW','Draw blood now','Draw blood now','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2019-03-27 13:00:54','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete & Submit',NULL),('2342e052-8b54-11e8-b999-00155d0a851b','PHY_EX','Physical Exam','Physical Exam','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2019-05-14 17:31:39','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Physical Exam',NULL),('2c4b9c4b-8c0f-11e9-bad0-00059a3c7a00','DSCHG_4','Discharge','Discharge','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:41:29','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete',NULL),('5c76728b-b747-11e8-ae48-00155d0a851b','TRT_RES','Treatment Response','Treatment Response','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Treatment Response',NULL),('8bc440d4-8c0f-11e9-bad0-00059a3c7a00','DSCHG_8','Discharge','Discharge','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:41:29','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Discharge',NULL),('97def5a1-8c0f-11e9-bad0-00059a3c7a00','DSCHG_12','Discharge','Discharge','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:41:29','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Discharge',NULL),('a1adf66b-8429-11e8-9538-00155d0a851b','ELIG','Eligibility Questionnaire','Eligibility Questionnaire','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Register Patient',NULL),('a1adf74e-8429-11e8-9538-00155d0a851b','DEM','Demographics Information','Demographics Information','2018-05-01','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Demographics',NULL),('a1adf7c9-8429-11e8-9538-00155d0a851b','DIS_CHA','Disease Characteristics','Disease Characteristics','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Disease Characteristics',NULL),('a1adf83c-8429-11e8-9538-00155d0a851b','SOC_FAC','Social Factors','Social Factors','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Social factors',NULL),('a1adf8ab-8429-11e8-9538-00155d0a851b','RIS_FAC','Risk Factors','Risk Factors','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 16:37:25','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Risk Factor',NULL),('a1adf91b-8429-11e8-9538-00155d0a851b','DIS_HIS','Hep C History','Hep C History','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Hep C History',NULL),('a1adf98a-8429-11e8-9538-00155d0a851b','COMORB','Co-morbidities','Co-morbidities','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Co-morbidities',NULL),('a1adf9fa-8429-11e8-9538-00155d0a851b','PRO_HIS','Procedure History','Procedure History','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Procedure History',NULL),('a1adfa77-8429-11e8-9538-00155d0a851b','SYS_REV','Review of Systems','Review of Systems','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Review of Systems',NULL),('a1adfaea-8429-11e8-9538-00155d0a851b','CLI_IMP','Clinical Impression','Clinical Impression','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete Clinical Impression',NULL),('ab07ba18-8c0f-11e9-bad0-00059a3c7a00','DSCHG_16','Discharge','Discharge','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:41:29','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Discharge',NULL),('c49c456c-8c0f-11e9-bad0-00059a3c7a00','DSCHG_20','Discharge','Discharge','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:41:29','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Discharge',NULL),('ccb0c405-8c0f-11e9-bad0-00059a3c7a00','DSCHG_24','Discharge','Discharge','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:41:29','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Discharge',NULL),('d2488efe-bbe7-11e8-88c1-00155d0a851b','ENROLL','Enrollment','Enrollment','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete',NULL),('d4abfd9f-8c0f-11e9-bad0-00059a3c7a00','DSCHG_36','Discharge','Discharge','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:41:29','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Discharge',NULL),('d7f132be-bbe7-11e8-88c1-00155d0a851b','ORD','Orders','Orders','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete',NULL),('df262841-bbe7-11e8-88c1-00155d0a851b','DSCHG','Discharge','Discharge','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete',NULL),('e395bf1b-bbe7-11e8-88c1-00155d0a851b','VIT','Vital','Vital','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete',NULL),('efb5db1e-bbe7-11e8-88c1-00155d0a851b','MED','Medications','Medications','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-10-01 16:01:25','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete',NULL),('f359eb15-bbe7-11e8-88c1-00155d0a851b','SCN_ENC','Register Patient','Register Patient','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete',NULL),('f71b07e1-bbe7-11e8-88c1-00155d0a851b','ENC','Encounter Information','Encounter Information','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete',NULL),('fb17b79e-bbe7-11e8-88c1-00155d0a851b','LAB','Lab results','Lab results','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete',NULL),('ffaca702-bbe7-11e8-88c1-00155d0a851b','REF','Referrals','Referrals','2018-05-21','1.0',NULL,NULL,NULL,'Complete','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:05:09','654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Complete',NULL);

/*Table structure for table `crf_questions` */

DROP TABLE IF EXISTS `crf_questions`;

CREATE TABLE `crf_questions` (
  `CRQ_ID` varchar(36) NOT NULL,
  `CRQ_CRS_ID` varchar(36) DEFAULT NULL,
  `CRQ_QUESTION_TEXT` varchar(2000) NOT NULL,
  `CRQ_QUESTION_TOOLTIP` varchar(2000) DEFAULT NULL,
  `CRQ_DISPLAY_TYPE` varchar(20) DEFAULT NULL COMMENT 'LIST / FREE TEXT/ DATE / CHECK BOX\\\\n',
  `CRQ_CQR_ID` varchar(36) DEFAULT NULL,
  `CRQ_QUESTION_CODE` varchar(45) DEFAULT NULL COMMENT 'Each question will have unique question code; This will help to map with other system integration whenever required.',
  `CRQ_DISPLAY_ORDER` int(11) DEFAULT NULL,
  `CRQ_IS_MANDATORY` varchar(3) DEFAULT NULL,
  `CRQ_MIN_VALUE` varchar(20) DEFAULT NULL,
  `CRQ_MAX_VALUE` varchar(45) DEFAULT NULL,
  `CRQ_MAX_LENGTH` int(11) DEFAULT NULL,
  `CRQ_CRQ_ID` varchar(36) DEFAULT NULL,
  `CRQ_DEPENDENCY_CONDITION` varchar(200) DEFAULT NULL,
  `CRQ_QUESTION_WEIGHTAGE` int(11) DEFAULT NULL,
  `CRQ_DISPLAY_DATATYPE` varchar(20) DEFAULT NULL COMMENT 'Available values will be number, text, date, datetime, file',
  `CRQ_UOM_ID` varchar(36) DEFAULT NULL,
  `CRQ_RESPONSE_STYLE` varchar(45) DEFAULT NULL COMMENT 'THIS WILL INDICATE WHETHER THE QUESTION AND RESPONSE WILL BE IN INLINE (WITHIN THE SAME ROW OR IT WILL BE IN DIFFERENT ROW OF TABLE)\\\\n',
  `CRQ_VALIDATION_MESSAGE` varchar(2000) DEFAULT NULL,
  `CRQ_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `CRQ_LAST_CHANGE_DT` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CRQ_RELATED` json DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`CRQ_ID`),
  KEY `fk_crs_id_idx` (`CRQ_CRS_ID`),
  CONSTRAINT `fk_crs_id` FOREIGN KEY (`CRQ_CRS_ID`) REFERENCES `crf_sections` (`crs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `crf_questions` */

insert  into `crf_questions`(`CRQ_ID`,`CRQ_CRS_ID`,`CRQ_QUESTION_TEXT`,`CRQ_QUESTION_TOOLTIP`,`CRQ_DISPLAY_TYPE`,`CRQ_CQR_ID`,`CRQ_QUESTION_CODE`,`CRQ_DISPLAY_ORDER`,`CRQ_IS_MANDATORY`,`CRQ_MIN_VALUE`,`CRQ_MAX_VALUE`,`CRQ_MAX_LENGTH`,`CRQ_CRQ_ID`,`CRQ_DEPENDENCY_CONDITION`,`CRQ_QUESTION_WEIGHTAGE`,`CRQ_DISPLAY_DATATYPE`,`CRQ_UOM_ID`,`CRQ_RESPONSE_STYLE`,`CRQ_VALIDATION_MESSAGE`,`CRQ_LAST_USR_ID`,`CRQ_LAST_CHANGE_DT`,`CRQ_RELATED`,`record_status`) values ('002444ff-8c1a-11e9-bad0-00059a3c7a00','9d7d0a58-8c15-11e9-bad0-00059a3c7a00','Dispense 24 weeks treatment now',NULL,'radio','3','DSCHG_20_2',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-06-25 12:52:59',NULL,NULL),('00682ba2-b80b-11e8-89ed-00155d0a851b','32bf9345-aa8a-11e8-b3c7-00155d0a851b','Reviewed and negative for all\nof the above',NULL,'chk','56','ROS_10',10,'No',NULL,NULL,NULL,NULL,NULL,NULL,'txt',NULL,'inline',NULL,NULL,'2018-09-10 11:44:29',NULL,NULL),('033fdc77-b4bd-11e8-ae48-00155d0a851b','9db95a18-b747-11e8-ae48-00155d0a851b','Clinical Adverse Events?',NULL,'chk','43','TRT_1',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'txt',NULL,'inline','','','2019-06-13 15:25:11',NULL,NULL),('0343564a-b4bd-11e8-ae48-00155d0a851b','32bf9345-aa8a-11e8-b3c7-00155d0a851b','HEENT',NULL,'chk','44','ROS_2',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'txt',NULL,'inline',NULL,'','2018-09-10 11:44:29',NULL,NULL),('0345bafd-b4bd-11e8-ae48-00155d0a851b','32bf9345-aa8a-11e8-b3c7-00155d0a851b','Cardiovascular',NULL,'chk','45','ROS_3',3,'No',NULL,NULL,NULL,NULL,NULL,NULL,'txt',NULL,'inline',NULL,NULL,'2018-09-10 11:44:29',NULL,NULL),('034638a9-b4bd-11e8-ae48-00155d0a851b','32bf9345-aa8a-11e8-b3c7-00155d0a851b','Chest',NULL,'chk','46','ROS_4',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'txt',NULL,'inline',NULL,NULL,'2018-09-10 11:44:29',NULL,NULL),('0346b302-b4bd-11e8-ae48-00155d0a851b','32bf9345-aa8a-11e8-b3c7-00155d0a851b','Abdomen',NULL,'chk','47','ROS_5',5,'No',NULL,NULL,NULL,NULL,NULL,NULL,'txt',NULL,'inline',NULL,NULL,'2018-09-10 11:44:29',NULL,NULL),('03472cf7-b4bd-11e8-ae48-00155d0a851b','32bf9345-aa8a-11e8-b3c7-00155d0a851b','Musculoskeletal',NULL,'chk','48','ROS_6',6,'No',NULL,NULL,NULL,NULL,NULL,NULL,'txt',NULL,'inline',NULL,NULL,'2018-09-10 11:44:29',NULL,NULL),('0347a787-b4bd-11e8-ae48-00155d0a851b','9db95a18-b747-11e8-ae48-00155d0a851b','Adherence?\r\n',NULL,'chk','49','TRT_2',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'txt',NULL,'inline',NULL,NULL,'2019-06-13 15:25:08',NULL,NULL),('03482117-b4bd-11e8-ae48-00155d0a851b','32bf9345-aa8a-11e8-b3c7-00155d0a851b','Hematologic',NULL,'chk','50','ROS_8',8,'No',NULL,NULL,NULL,NULL,NULL,NULL,'txt',NULL,'inline',NULL,NULL,'2018-09-10 11:44:29',NULL,NULL),('03489cae-b4bd-11e8-ae48-00155d0a851b','32bf9345-aa8a-11e8-b3c7-00155d0a851b','Skin',NULL,'chk','51','ROS_9',9,'No',NULL,NULL,NULL,NULL,NULL,NULL,'txt',NULL,'inline',NULL,NULL,'2018-09-10 11:44:29',NULL,NULL),('07366a06-b4c5-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Enter Name of Meds',NULL,'txt',NULL,'DIS_HIS_7',7,'No',NULL,NULL,NULL,'b6e7c894-b4c1-11e8-ae48-00155d0a851b','#val#~=~Positive on ARV',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('073b4e9b-b4c5-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Date of last HIV Test',NULL,'txt',NULL,'DIS_HIS_8',8,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Date',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 12:21:49',NULL,NULL),('073b53ca-b4c5-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Prior Liver Studies',NULL,'chk','8','DIS_HIS_9',9,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 12:21:49',NULL,NULL),('108b9e85-ab67-11e8-b3c7-00155d0a851b','36d049d3-a779-11e8-8b48-00155d0a851b','Abdominal Ascites present',NULL,'radio','40','PHY_EX_6',11,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-26 13:02:04',NULL,NULL),('20cbecbf-b4bc-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Date of diagnosis (year)',NULL,'txt',NULL,'DIS_HIS_1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Date',NULL,'inline',NULL,NULL,'2018-09-21 17:36:34',NULL,NULL),('20d6bdf5-842a-11e8-9538-00155d0a851b','fcabf984-842a-11e8-9538-00155d0a851b','Do you have a history of chronic kidney disease?',NULL,'radio','1','ELI_1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline','PLease Select value for Have you been tested for HCV Ab?','79edc223-843a-11e8-9538-00155d0a851b','2019-03-25 15:28:02',NULL,NULL),('20d6bee2-842a-11e8-9538-00155d0a851b','fcabf984-842a-11e8-9538-00155d0a851b','If Others, Please Specify',NULL,'txt',NULL,'ELI_2.1',3,'No',NULL,NULL,NULL,'20d6bf60-842a-11e8-9538-00155d0a851b','#val#~=~Other',NULL,'Text',NULL,'inline','Please Enter valid date for test','79edc223-843a-11e8-9538-00155d0a851b','2019-04-03 11:21:53',NULL,NULL),('20d6bf60-842a-11e8-9538-00155d0a851b','fcabf984-842a-11e8-9538-00155d0a851b','Perform rapid test now',NULL,'radio','2','ELI_2.2',2,'No',NULL,NULL,NULL,'20d6bdf5-842a-11e8-9538-00155d0a851b','#val#~=~Yes',NULL,'Text',NULL,'inline','Please select your test result','79edc223-843a-11e8-9538-00155d0a851b','2019-03-27 11:31:21',NULL,NULL),('20d6bfd8-842a-11e8-9538-00155d0a851b','fcabf984-842a-11e8-9538-00155d0a851b','Do you currently inject drugs?',NULL,'radio','3','ELI_3',5,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline','Please select your answer','79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6c04d-842a-11e8-9538-00155d0a851b','fcabf984-842a-11e8-9538-00155d0a851b','Have you ever injected drugs?',NULL,'radio','3','ELI_4',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline','Please select your answer','79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6c0c2-842a-11e8-9538-00155d0a851b','fcabf984-842a-11e8-9538-00155d0a851b','Do you have HIV?',NULL,'radio','3','ELI_5',6,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline','Please Select your answer','79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6c2a9-842a-11e8-9538-00155d0a851b','fcabfbb3-842a-11e8-9538-00155d0a851b','Gender',NULL,'radio','19','DEM 1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline','Please select your gender at birth','79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 19:40:06',NULL,NULL),('20d6c5fa-842a-11e8-9538-00155d0a851b','fcabfbb3-842a-11e8-9538-00155d0a851b','Slum',NULL,'lst','63','DEM 2',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline','Please select your region','79edc223-843a-11e8-9538-00155d0a851b','2019-07-05 12:28:07',NULL,NULL),('20d6ca2d-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Date (Year) of diagnosis',NULL,'txt',NULL,'DSC_DT',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Date',NULL,'inline','Please enter Date (Year) of diagnosis?','79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6caab-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Genotype, if known',NULL,'chk','4','DSC_GEN',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6cb2a-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Hep A Status',NULL,'chk','5','DSC_HEPA',3,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6cba9-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Hep B Status',NULL,'chk','6','DSC_HEPB',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6cc27-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','HIV',NULL,'chk','7','DSC_HIV',5,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6cca6-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','If HIV negative, Date of last test?',NULL,'txt',NULL,'DSC_HIV_DT',6,'No',NULL,NULL,NULL,'20d6cc27-842a-11e8-9538-00155d0a851b','#val#~=~Negative',NULL,'Date',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6cd23-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Prior liver studies completed',NULL,'chk','8','DSC_PR_LIVER',7,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6cda3-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Grade',NULL,'radio','9','DSC_GRADE',8,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6ce22-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Stage',NULL,'radio','10','DSC_STAGE',9,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6ce9f-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Date of liver biopsy',NULL,'txt',NULL,'DSC_BIOPSY_DT',10,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Date',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6cf21-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','If Fibrosure',NULL,'radio','11','DSC_FIB',11,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6cfa4-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','If Fibroscan',NULL,'radio','12','DSC_FSC',12,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d028-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','If endoscopy',NULL,'radio','13','DSC_END',13,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d0a9-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Date of endoscopy',NULL,'txt',NULL,'DSC_EN_DT',14,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Date',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d12c-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','If colonoscopy',NULL,'radio','14','DSC_COL',15,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d1af-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Date of colonoscopy',NULL,'txt',NULL,'DSC_COL_DT',16,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Date',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d234-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Prior treatment',NULL,'radio','15','DSC_TRT',17,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d2b5-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Treatment outcome',NULL,'radio','16','DSC_TRT_OUT',18,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d336-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Current Assessment',NULL,'radio','17','DSC_ASSES',19,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d3b9-842a-11e8-9538-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','Immunization',NULL,'radio','18','DSC_IMMU',20,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d43d-842a-11e8-9538-00155d0a851b','fcac007f-842a-11e8-9538-00155d0a851b','Source of Shaving',NULL,'radio','59','RIS_FAC_1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 19:09:21',NULL,NULL),('20d6d4be-842a-11e8-9538-00155d0a851b','fcac007f-842a-11e8-9538-00155d0a851b','Sharing of Blade',NULL,'radio','58','RIS_FAC_2',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 19:02:06',NULL,NULL),('20d6d541-842a-11e8-9538-00155d0a851b','fcac007f-842a-11e8-9538-00155d0a851b','Sharing of Toothbrush',NULL,'radio','3','RIS_FAC_3',3,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 18:02:35',NULL,NULL),('20d6d5c3-842a-11e8-9538-00155d0a851b','fcac007f-842a-11e8-9538-00155d0a851b','History of Surgery',NULL,'radio','3','RIS_FAC_4',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 18:02:40',NULL,NULL),('20d6d646-842a-11e8-9538-00155d0a851b','fcac007f-842a-11e8-9538-00155d0a851b','History of Blood Transmission',NULL,'radio','3','RIS_FAC_5',5,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 18:03:19',NULL,NULL),('20d6d6c8-842a-11e8-9538-00155d0a851b','fcabfeef-842a-11e8-9538-00155d0a851b','Housing status',NULL,'radio','30','SOC_FAC_1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d74a-842a-11e8-9538-00155d0a851b','fcabfeef-842a-11e8-9538-00155d0a851b','Employment status',NULL,'chk','31','SOC_FAC_2',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d7cd-842a-11e8-9538-00155d0a851b','fcabfeef-842a-11e8-9538-00155d0a851b','Marital Status',NULL,'radio','32','SOC_FAC_3',3,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('20d6d852-842a-11e8-9538-00155d0a851b','fcabfeef-842a-11e8-9538-00155d0a851b','Education Level',NULL,'radio','33','SOC_FAC_4',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-10-08 11:11:21',NULL,NULL),('20d6d8d7-842a-11e8-9538-00155d0a851b','fcabfeef-842a-11e8-9538-00155d0a851b','Incarceration history',NULL,'txt',NULL,'SOC_FAC_5',5,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('257d7977-8c1b-11e9-bad0-00059a3c7a00','a6591bb1-8c15-11e9-bad0-00059a3c7a00','Discharge Instructions / notes?',NULL,'txt',NULL,'DSCHG_24_1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-05-15 16:33:33',NULL,NULL),('258a8540-8c22-11e9-bad0-00059a3c7a00','78f33abb-8c15-11e9-bad0-00059a3c7a00','If Yes, Enter Date?',NULL,'txt','','DSCHG_8_4',4,NULL,NULL,NULL,NULL,'aecbebfb-8c1f-11e9-bad0-00059a3c7a00','#val#~=~Yes',NULL,'Date',NULL,NULL,'Please select date',NULL,'2019-06-11 14:52:03',NULL,NULL),('2645733c-9e65-11e9-9de9-00059a3c7a00','fcabfbb3-842a-11e8-9538-00155d0a851b','Marital Status',NULL,'radio','62','DEM 3',3,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-07-04 19:40:10',NULL,NULL),('27856391-5064-11e9-83a3-00059a3c7800','9fb22d6c-5063-11e9-83a3-00059a3c7800','Did participant allow to draw blood now?',NULL,'radio','3','DBN_1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline','Please Enter your Name','79edc223-843a-11e8-9538-00155d0a851b','2019-06-13 19:33:00',NULL,NULL),('27f563f5-8c1b-11e9-bad0-00059a3c7a00','a6591bb1-8c15-11e9-bad0-00059a3c7a00','Dispense 36 weeks treatment now',NULL,'radio','3','DSCHG_24_2',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-06-25 12:53:37',NULL,NULL),('291e25c4-9e56-11e9-9de9-00059a3c7a00','fcac007f-842a-11e8-9538-00155d0a851b','IF Yes then Since when?',NULL,'radio','60','RIS_FAC_10',10,'No',NULL,NULL,NULL,'fc9a388e-b737-11e8-ae48-00155d0a851b','#val#~=~Yes',NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-07-04 19:09:35',NULL,NULL),('2da22b28-9e56-11e9-9de9-00059a3c7a00','fcac007f-842a-11e8-9538-00155d0a851b','Hypatitus B Vaccination',NULL,'radio','3','RIS_FAC_11',11,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-07-04 18:04:04',NULL,NULL),('3166bbb4-9e56-11e9-9de9-00059a3c7a00','fcac007f-842a-11e8-9538-00155d0a851b','If Yes then Doses?',NULL,'radio','61','RIS_FAC_12',12,'No',NULL,NULL,NULL,'2da22b28-9e56-11e9-9de9-00059a3c7a00','#val#~=~Yes',NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-07-05 12:23:19',NULL,NULL),('35384c01-8c19-11e9-bad0-00059a3c7a00','6d0e57f1-8c15-11e9-bad0-00059a3c7a00','Discharge Instructions / notes?',NULL,'txt',NULL,'DSCHG_4_1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-05-15 16:33:33',NULL,NULL),('361d733c-9e56-11e9-9de9-00059a3c7a00','fcac007f-842a-11e8-9538-00155d0a851b','Job in Hospital & Dispensary ',NULL,'radio','3','RIS_FAC_13',13,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-07-04 18:04:18',NULL,NULL),('39516ae3-9e56-11e9-9de9-00059a3c7a00','fcac007f-842a-11e8-9538-00155d0a851b','Cough History',NULL,'radio','3','RIS_FAC_14',14,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-07-04 18:04:24',NULL,NULL),('3bbd3cb0-8c19-11e9-bad0-00059a3c7a00','6d0e57f1-8c15-11e9-bad0-00059a3c7a00','Dispense 8 weeks treatment now',NULL,'radio','3','DSCHG_4_2',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-06-25 12:53:44',NULL,NULL),('3c56fdd3-9e56-11e9-9de9-00059a3c7a00','fcac007f-842a-11e8-9538-00155d0a851b','TB History',NULL,'radio','3','RIS_FAC_15',15,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-07-04 18:04:38',NULL,NULL),('3cb52bc8-9e65-11e9-9de9-00059a3c7a00','fcabfbb3-842a-11e8-9538-00155d0a851b','Profession',NULL,'txt',NULL,'DEM 4',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-07-04 19:40:11',NULL,NULL),('3d829254-bd8e-11e8-88c1-00155d0a851b','51735afd-a9c4-11e8-8b48-00155d0a851b','if Yes,',NULL,'txt',NULL,'CLI_7',7,'No',NULL,NULL,NULL,'e1472398-a9f1-11e8-b3c7-00155d0a851b','#val#~=~Yes',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('473d44c8-9e65-11e9-9de9-00059a3c7a00','fcabfbb3-842a-11e8-9538-00155d0a851b','Education',NULL,'txt',NULL,'DEM 5',5,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-07-04 19:40:15',NULL,NULL),('4883ca3a-8c22-11e9-bad0-00059a3c7a00','60e4ac47-8c15-11e9-bad0-00059a3c7a00','If Yes, Enter Date?',NULL,'txt','','TRT_3',4,NULL,NULL,NULL,NULL,'6a6a62da-8c20-11e9-bad0-00059a3c7a00','#val#~=~Yes',NULL,'Date',NULL,NULL,'Please select date',NULL,'2019-05-14 15:20:10',NULL,NULL),('4b836ebb-8c1b-11e9-bad0-00059a3c7a00','b254a686-8c15-11e9-bad0-00059a3c7a00','Discharge Instructions / notes?',NULL,'txt',NULL,'DSCHG_36_1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-05-15 16:33:33',NULL,NULL),('4d8679a5-8c1b-11e9-bad0-00059a3c7a00','b254a686-8c15-11e9-bad0-00059a3c7a00','Dispense 36 weeks treatment now',NULL,'radio','3','DSCHG_36_2',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-06-25 12:53:59',NULL,NULL),('6377f7a3-8c19-11e9-bad0-00059a3c7a00','78f33abb-8c15-11e9-bad0-00059a3c7a00','Discharge Instructions / notes?',NULL,'txt',NULL,'DSCHG_8_1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-05-15 16:33:33',NULL,NULL),('66efa9c7-8c19-11e9-bad0-00059a3c7a00','78f33abb-8c15-11e9-bad0-00059a3c7a00','Dispense 12 weeks treatment now',NULL,'radio','3','DSCHG_8_2',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-06-25 12:54:11',NULL,NULL),('682ec727-97dd-11e9-9803-94de801a2d16','36d049d3-a779-11e8-8b48-00155d0a851b','If abnormal, provide details',NULL,'txt',NULL,'PHY_EX_5.1',9,'No',NULL,NULL,NULL,'9f33e57d-9758-11e9-9803-94de801a2d16','#val#~=~Abnormal',NULL,'Text',NULL,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-26 13:01:03',NULL,NULL),('6a6a62da-8c20-11e9-bad0-00059a3c7a00','60e4ac47-8c15-11e9-bad0-00059a3c7a00','Is HBV vaccine first dose given ?',NULL,'radio','3','DSCHG',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the value',NULL,'2019-06-25 12:50:15',NULL,NULL),('6c3f5045-a77b-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','HIV',NULL,'radio','3','COM_1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('72c4f777-b5a7-11e8-ae48-00155d0a851b','6a280714-b59f-11e8-ae48-00155d0a851b','Frequency In',NULL,'txt',NULL,'MED_HIS_5',5,'No',NULL,NULL,NULL,'f1b3bb7e-b5a6-11e8-ae48-00155d0a851b','#val#~=~Other',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-11 15:22:38',NULL,NULL),('7b7572b7-9758-11e9-9803-94de801a2d16','36d049d3-a779-11e8-8b48-00155d0a851b','Lung',NULL,'radio','41','PHY_EX_3',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-26 12:59:16',NULL,NULL),('863b5591-ab60-11e8-b3c7-00155d0a851b','36d049d3-a779-11e8-8b48-00155d0a851b','If abnormal, provide details',NULL,'txt',NULL,'PHY_EX_2.1',3,'No',NULL,NULL,NULL,'e8cd51c4-ab5e-11e8-b3c7-00155d0a851b','#val#~=~Abnormal',NULL,'Text',NULL,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-26 12:59:12',NULL,NULL),('89302233-9758-11e9-9803-94de801a2d16','36d049d3-a779-11e8-8b48-00155d0a851b','Abdominal',NULL,'radio','41','PHY_EX_4',6,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-26 12:59:52',NULL,NULL),('8c07ce5f-5065-11e9-83a3-00059a3c7800','9fb22d6c-5063-11e9-83a3-00059a3c7800','If Yes, Enter Date?',NULL,'txt',NULL,'DBN_2',2,'No',NULL,NULL,NULL,'27856391-5064-11e9-83a3-00059a3c7800','#val#~=~Yes',NULL,'Date',NULL,'inline','Please Enter your Name','79edc223-843a-11e8-9538-00155d0a851b','2019-06-13 19:33:30',NULL,NULL),('8c3e808e-8c17-11e9-bad0-00059a3c7a00','60e4ac47-8c15-11e9-bad0-00059a3c7a00','Discharge Instructions / notes?',NULL,'txt',NULL,'TRT_2',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-06-11 13:43:41',NULL,NULL),('902907e6-8c17-11e9-bad0-00059a3c7a00','60e4ac47-8c15-11e9-bad0-00059a3c7a00','Dispense 4 weeks treatment now',NULL,'radio','3','TRT_2',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-06-25 12:54:16',NULL,NULL),('94cd6b2c-97dd-11e9-9803-94de801a2d16','36d049d3-a779-11e8-8b48-00155d0a851b','If abnormal, provide details',NULL,'txt',NULL,'PHY_EX_4.1',7,'No',NULL,NULL,NULL,'89302233-9758-11e9-9803-94de801a2d16','#val#~=~Abnormal',NULL,'Text',NULL,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-26 12:59:58',NULL,NULL),('96173cb8-8c19-11e9-bad0-00059a3c7a00','81c2efd1-8c15-11e9-bad0-00059a3c7a00','Discharge Instructions / notes?',NULL,'txt',NULL,'DSCHG_12_1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-05-15 16:33:33',NULL,NULL),('967423fe-b58f-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Date',NULL,'txt',NULL,'DIS_HIS_10',10,'No',NULL,NULL,NULL,'073b53ca-b4c5-11e8-ae48-00155d0a851b','#val#~=~Liver biopsy',NULL,'Date',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('967dfa97-b58f-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Grade',NULL,'radio','9','DIS_HIS_11',11,'No',NULL,NULL,NULL,'073b53ca-b4c5-11e8-ae48-00155d0a851b','#val#~=~Liver biopsy',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('967ff6a4-b58f-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Stage',NULL,'radio','10','DIS_HIS_12',12,'No',NULL,NULL,NULL,'073b53ca-b4c5-11e8-ae48-00155d0a851b','#val#~=~Liver biopsy',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('967ffbac-b58f-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Select One',NULL,'radio','52','DIS_HIS_13',13,'No',NULL,NULL,NULL,'073b53ca-b4c5-11e8-ae48-00155d0a851b','#val#~=~Fibrosure',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('9680009a-b58f-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Select One',NULL,'radio','53','DIS_HIS_14',14,'No',NULL,NULL,NULL,'073b53ca-b4c5-11e8-ae48-00155d0a851b','#val#~=~Fibroscan',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('96800882-b58f-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Date',NULL,'txt',NULL,'DIS_HIS_15',15,'No',NULL,NULL,NULL,'073b53ca-b4c5-11e8-ae48-00155d0a851b','#val#~=~Endoscopy',NULL,'Date',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('96803eb7-b58f-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Select One',NULL,'radio','13','DIS_HIS_16',16,'No',NULL,NULL,NULL,'073b53ca-b4c5-11e8-ae48-00155d0a851b','#val#~=~Endoscopy',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('968043c4-b58f-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Date',NULL,'txt',NULL,'DIS_HIS_17',17,'No',NULL,NULL,NULL,'073b53ca-b4c5-11e8-ae48-00155d0a851b','#val#~=~Colonscopy',NULL,'Date',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('9680488d-b58f-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Select One',NULL,'radio','14','DIS_HIS_18',18,'No',NULL,NULL,NULL,'073b53ca-b4c5-11e8-ae48-00155d0a851b','#val#~=~Colonscopy',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('98226f5d-8c19-11e9-bad0-00059a3c7a00','81c2efd1-8c15-11e9-bad0-00059a3c7a00','Dispense 16 weeks treatment now',NULL,'radio','3','DSCHG_12_2',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-06-25 12:54:23',NULL,NULL),('99375704-ba4c-11e8-89ed-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','If Other,','Enter If Other','txt',NULL,'99374fa3-ba4c-11e8-89ed-00155d0a851b',7,'No',NULL,NULL,NULL,'20d6cd23-842a-11e8-9538-00155d0a851b','#val#~=~Other',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-17 00:00:00',NULL,NULL),('993f0afa-ba4c-11e8-89ed-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','If Other,','Enter If Other','txt',NULL,'99375082-ba4c-11e8-89ed-00155d0a851b',17,'No',NULL,NULL,NULL,'20d6d234-842a-11e8-9538-00155d0a851b','#val#~=~Other',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-17 00:00:00',NULL,NULL),('993f10b2-ba4c-11e8-89ed-00155d0a851b','fcabfd54-842a-11e8-9538-00155d0a851b','If Other,','Enter If Other','txt',NULL,'99375119-ba4c-11e8-89ed-00155d0a851b',19,'No',NULL,NULL,NULL,'20d6d336-842a-11e8-9538-00155d0a851b','#val#~=~Other',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-17 00:00:00',NULL,NULL),('993f1770-ba4c-11e8-89ed-00155d0a851b','fcabfeef-842a-11e8-9538-00155d0a851b','If Other,','Enter If Other','txt',NULL,'993751ab-ba4c-11e8-89ed-00155d0a851b',1,'No',NULL,NULL,NULL,'20d6d6c8-842a-11e8-9538-00155d0a851b','#val#~=~Other',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-17 00:00:00',NULL,NULL),('993f1cca-ba4c-11e8-89ed-00155d0a851b','fcabfeef-842a-11e8-9538-00155d0a851b','If Other,','Enter If Other','txt',NULL,'99375316-ba4c-11e8-89ed-00155d0a851b',2,'No',NULL,NULL,NULL,'20d6d74a-842a-11e8-9538-00155d0a851b','#val#~=~Other',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-17 00:00:00',NULL,NULL),('993f2208-ba4c-11e8-89ed-00155d0a851b','51735afd-a9c4-11e8-8b48-00155d0a851b','If Other,','Enter If Other','txt',NULL,'993753e3-ba4c-11e8-89ed-00155d0a851b',1,'No',NULL,NULL,NULL,'f25f13ee-a9e0-11e8-91c5-00155d0a851b','#val#~=~Other',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('993f2724-ba4c-11e8-89ed-00155d0a851b','51735afd-a9c4-11e8-8b48-00155d0a851b','If Other,','Enter If Other','txt',NULL,'99375473-ba4c-11e8-89ed-00155d0a851b',2,'No',NULL,NULL,NULL,'f266b063-a9e0-11e8-91c5-00155d0a851b','#val#~=~Other',NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('9f33e57d-9758-11e9-9803-94de801a2d16','36d049d3-a779-11e8-8b48-00155d0a851b','Extremities',NULL,'radio','41','PHY_EX_5',8,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-26 13:00:01',NULL,NULL),('a0ec0e20-a798-11e8-8b48-00155d0a851b','38c00c12-a798-11e8-8b48-00155d0a851b','Procedure',NULL,'txt','','PRO_1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('a6f06932-97dd-11e9-9803-94de801a2d16','36d049d3-a779-11e8-8b48-00155d0a851b','If abnormal, provide details',NULL,'txt',NULL,'PHY_EX_3.1',5,'No',NULL,NULL,NULL,'7b7572b7-9758-11e9-9803-94de801a2d16','#val#~=~Abnormal',NULL,'Text',NULL,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-26 12:59:49',NULL,NULL),('aba659a6-8c1f-11e9-bad0-00059a3c7a00','6d0e57f1-8c15-11e9-bad0-00059a3c7a00','Is HBV vaccine first dose given ?',NULL,'radio','3','DSCHG_4_3',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the value',NULL,'2019-06-25 12:50:18',NULL,NULL),('aecbebfb-8c1f-11e9-bad0-00059a3c7a00','78f33abb-8c15-11e9-bad0-00059a3c7a00','Is HBV vaccine first dose given ?',NULL,'radio','3','DSCHG_8_3',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the value',NULL,'2019-06-25 12:50:23',NULL,NULL),('b4b255df-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Hepatitis B',NULL,'radio','3','COM_2',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4c917b7-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Coronary artery disease or Congestive Heart Failure',NULL,'radio','3','COM_3',3,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4cb60d5-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Diabetes Mellitus',NULL,'radio','3','COM_4',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4cdb840-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Stroke',NULL,'radio','3','COM_5',5,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4d01cdd-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Hyperlipidemia',NULL,'radio','3','COM_6',6,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4d2721f-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Cancer',NULL,'radio','3','COM_7',7,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4d4d924-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Asthma',NULL,'radio','3','COM_8',8,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4d8f42b-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','COPD',NULL,'radio','3','COM_9',9,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4deaefc-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Chronic renal failure',NULL,'radio','3','COM_10',10,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4e3612c-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Hypertension',NULL,'radio','3','COM_11',11,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4e58eed-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Neuropathy',NULL,'radio','3','COM_12',12,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4e7fbc9-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Psychiatric disease',NULL,'radio','3','COM_13',13,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b4f346d8-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Auto-immune disorder',NULL,'radio','3','COM_14',14,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('b6e5e71f-b4c1-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Genotype',NULL,'radio','4','DIS_HIS_2',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-10-08 11:11:21',NULL,NULL),('b6e7b99c-b4c1-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Risk Factors',NULL,'chk','54','DIS_HIS_3',3,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('b6e7bef1-b4c1-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Hep A status',NULL,'radio','5','DIS_HIS_4',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('b6e7c3ca-b4c1-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','Hep B status',NULL,'radio','6','DIS_HIS_5',5,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('b6e7c894-b4c1-11e8-ae48-00155d0a851b','1d09ca33-b4ba-11e8-ae48-00155d0a851b','HIV',NULL,'radio','7','DIS_HIS_6',6,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('cd48f065-ab66-11e8-b3c7-00155d0a851b','36d049d3-a779-11e8-8b48-00155d0a851b','Abdominal Distended',NULL,'radio','40','PHY_EX_5',10,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-26 13:02:02',NULL,NULL),('d8c2aae5-8c19-11e9-bad0-00059a3c7a00','94beec91-8c15-11e9-bad0-00059a3c7a00','Discharge Instructions / notes?',NULL,'txt',NULL,'DSCHG_16_1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-05-15 16:33:33',NULL,NULL),('db458ba6-8c19-11e9-bad0-00059a3c7a00','94beec91-8c15-11e9-bad0-00059a3c7a00','Dispense 20 weeks treatment now',NULL,'radio','3','DSCHG_16_2',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-06-25 12:54:39',NULL,NULL),('de790e27-a799-11e8-8b48-00155d0a851b','38c00c12-a798-11e8-8b48-00155d0a851b','Procedure Date',NULL,'txt',NULL,'PRO_2',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Date',NULL,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('de7965de-a799-11e8-8b48-00155d0a851b','38c00c12-a798-11e8-8b48-00155d0a851b','Result',NULL,'txt',NULL,'PRO_3',3,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('de79a2ae-a799-11e8-8b48-00155d0a851b','38c00c12-a798-11e8-8b48-00155d0a851b','Description of Result',NULL,'txt',NULL,'PRO_4',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-29 13:11:19',NULL,NULL),('e1462d2c-a9f1-11e8-b3c7-00155d0a851b','6f76ac68-b747-11e8-ae48-00155d0a851b','Adherence',NULL,'radio','39','CLI_4',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('e146aa0a-a9f1-11e8-b3c7-00155d0a851b','6f76ac68-b747-11e8-ae48-00155d0a851b','HCV Current Treatment Response ',NULL,'radio','40','CLI_5',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('e1472398-a9f1-11e8-b3c7-00155d0a851b','51735afd-a9c4-11e8-8b48-00155d0a851b','Referrals',NULL,'radio','3','CLI_6',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 16:47:19',NULL,NULL),('e256b896-a791-11e8-8b48-00155d0a851b','4a7afae7-8b54-11e8-b999-00155d0a851b','Osteoporosis ',NULL,'radio','3','COM_15',15,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:38',NULL,NULL),('e8cd51c4-ab5e-11e8-b3c7-00155d0a851b','36d049d3-a779-11e8-8b48-00155d0a851b','Heart',NULL,'radio','41','PHY_EX_2',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-26 12:46:57',NULL,NULL),('eb3bc9a4-ab5c-11e8-b3c7-00155d0a851b','36d049d3-a779-11e8-8b48-00155d0a851b','General/Constitutional Jaundice',NULL,'radio','40','PHY_EX_1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('f1b24d74-b5a6-11e8-ae48-00155d0a851b','6a280714-b59f-11e8-ae48-00155d0a851b','Medication',NULL,'txt',NULL,'MED_HIS_1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-11 15:19:01',NULL,NULL),('f1b3b128-b5a6-11e8-ae48-00155d0a851b','6a280714-b59f-11e8-ae48-00155d0a851b','Dose',NULL,'txt',NULL,'MED_HIS_2',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Number',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-11 15:19:01',NULL,NULL),('f1b3b67f-b5a6-11e8-ae48-00155d0a851b','6a280714-b59f-11e8-ae48-00155d0a851b','Units',NULL,'radio','55','MED_HIS_3',3,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-10-08 11:11:21',NULL,NULL),('f1b3bb7e-b5a6-11e8-ae48-00155d0a851b','6a280714-b59f-11e8-ae48-00155d0a851b','Frequency',NULL,'radio','56','MED_HIS_4',4,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-10-08 11:11:21',NULL,NULL),('f25f13ee-a9e0-11e8-91c5-00155d0a851b','51735afd-a9c4-11e8-8b48-00155d0a851b','Medication',NULL,'radio','37','CLI_1',1,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('f266b063-a9e0-11e8-91c5-00155d0a851b','51735afd-a9c4-11e8-8b48-00155d0a851b','Liver staging',NULL,'radio','17','CLI 2',2,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-21 17:36:34',NULL,NULL),('f478f9c2-8c21-11e9-bad0-00059a3c7a00','6d0e57f1-8c15-11e9-bad0-00059a3c7a00','If Yes, Enter Date?',NULL,'txt','','DSCHG_4_4',4,NULL,NULL,NULL,NULL,'aba659a6-8c1f-11e9-bad0-00059a3c7a00','#val#~=~Yes',NULL,'Date',NULL,NULL,'Please select date',NULL,'2019-06-11 14:50:57',NULL,NULL),('fc7d2310-b737-11e8-ae48-00155d0a851b','fcac007f-842a-11e8-9538-00155d0a851b','History of Injection',NULL,'radio','3','RIS_FAC_6',6,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 18:03:07',NULL,NULL),('fc97d96e-b737-11e8-ae48-00155d0a851b','fcac007f-842a-11e8-9538-00155d0a851b','History of Hospital',NULL,'radio','3','RIS_FAC_8',8,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 18:03:40',NULL,NULL),('fc9a388e-b737-11e8-ae48-00155d0a851b','fcac007f-842a-11e8-9538-00155d0a851b','History of Drug Abuse',NULL,'radio','58','RIS_FAC_9',9,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 19:01:38',NULL,NULL),('fcac007f-842a-11e8-9538-00155d0a851b','fcac007f-842a-11e8-9538-00155d0a851b','History of Dental',NULL,'radio','3','RIS_FAC_7',7,'No',NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,'inline',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 18:03:14',NULL,NULL),('fd81128a-8c19-11e9-bad0-00059a3c7a00','9d7d0a58-8c15-11e9-bad0-00059a3c7a00','Discharge Instructions / notes?',NULL,'txt',NULL,'DSCHG_20_1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Please select the answer',NULL,'2019-05-15 16:33:33',NULL,NULL);

/*Table structure for table `crf_sections` */

DROP TABLE IF EXISTS `crf_sections`;

CREATE TABLE `crf_sections` (
  `CRS_ID` varchar(36) NOT NULL DEFAULT 'uuid()',
  `CRS_CRF_ID` varchar(36) DEFAULT NULL,
  `CRS_SECTION_TITLE` varchar(255) DEFAULT NULL,
  `CRS_SECTION_DESCRIPTION` varchar(2000) DEFAULT NULL,
  `CRS_HEADER_TEXT` varchar(2000) DEFAULT NULL,
  `CRS_FOOTER_TEXT` varchar(2000) DEFAULT NULL,
  `CRS_DISPLAY_ORDER` int(11) DEFAULT NULL COMMENT 'Displaying an order of the section while rendering the form',
  `CRS_IS_MANDATORY` bit(1) DEFAULT NULL,
  `CRS_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `CRS_LAST_CHANGED_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`CRS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `crf_sections` */

insert  into `crf_sections`(`CRS_ID`,`CRS_CRF_ID`,`CRS_SECTION_TITLE`,`CRS_SECTION_DESCRIPTION`,`CRS_HEADER_TEXT`,`CRS_FOOTER_TEXT`,`CRS_DISPLAY_ORDER`,`CRS_IS_MANDATORY`,`CRS_LAST_USR_ID`,`CRS_LAST_CHANGED_DT`,`record_status`) values ('1d09ca33-b4ba-11e8-ae48-00155d0a851b','a1adf91b-8429-11e8-9538-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 11:11:58',NULL),('32bf9345-aa8a-11e8-b3c7-00155d0a851b','a1adfa77-8429-11e8-9538-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-29 13:03:44',NULL),('36d049d3-a779-11e8-8b48-00155d0a851b','2342e052-8b54-11e8-b999-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-24 17:36:19',NULL),('38c00c12-a798-11e8-8b48-00155d0a851b','a1adf9fa-8429-11e8-9538-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-24 17:51:39',NULL),('4a7afae7-8b54-11e8-b999-00155d0a851b','a1adf98a-8429-11e8-9538-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-24 14:09:30',NULL),('51735afd-a9c4-11e8-8b48-00155d0a851b','a1adfaea-8429-11e8-9538-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-29 13:03:44',NULL),('60e4ac47-8c15-11e9-bad0-00059a3c7a00','df262841-bbe7-11e8-88c1-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 11:11:58',NULL),('6a280714-b59f-11e8-ae48-00155d0a851b','15500a38-b59f-11e8-ae48-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-11 14:27:05',NULL),('6d0e57f1-8c15-11e9-bad0-00059a3c7a00','2c4b9c4b-8c0f-11e9-bad0-00059a3c7a00','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 11:11:58',NULL),('78f33abb-8c15-11e9-bad0-00059a3c7a00','8bc440d4-8c0f-11e9-bad0-00059a3c7a00','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 11:11:58',NULL),('81c2efd1-8c15-11e9-bad0-00059a3c7a00','97def5a1-8c0f-11e9-bad0-00059a3c7a00','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 11:11:58',NULL),('94beec91-8c15-11e9-bad0-00059a3c7a00','ab07ba18-8c0f-11e9-bad0-00059a3c7a00','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 11:11:58',NULL),('9d7d0a58-8c15-11e9-bad0-00059a3c7a00','c49c456c-8c0f-11e9-bad0-00059a3c7a00','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 11:11:58',NULL),('9db95a18-b747-11e8-ae48-00155d0a851b','5c76728b-b747-11e8-ae48-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-29 13:03:44',NULL),('9fb22d6c-5063-11e9-83a3-00059a3c7800','1bb6d3d9-5062-11e9-83a3-00059a3c7800','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-03-27 13:10:31',NULL),('a6591bb1-8c15-11e9-bad0-00059a3c7a00','ccb0c405-8c0f-11e9-bad0-00059a3c7a00','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 11:11:58',NULL),('b254a686-8c15-11e9-bad0-00059a3c7a00','d4abfd9f-8c0f-11e9-bad0-00059a3c7a00','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-09-10 11:11:58',NULL),('fcabf984-842a-11e8-9538-00155d0a851b','a1adf66b-8429-11e8-9538-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 16:02:24',NULL),('fcabfbb3-842a-11e8-9538-00155d0a851b','a1adf74e-8429-11e8-9538-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 16:02:21',NULL),('fcabfd54-842a-11e8-9538-00155d0a851b','a1adf7c9-8429-11e8-9538-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',NULL),('fcabfeef-842a-11e8-9538-00155d0a851b','a1adf83c-8429-11e8-9538-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',NULL),('fcac007f-842a-11e8-9538-00155d0a851b','a1adf8ab-8429-11e8-9538-00155d0a851b','Default',NULL,NULL,NULL,1,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',NULL),('uuid()',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-06-11 14:22:50',NULL);

/*Table structure for table `data_capture_steps` */

DROP TABLE IF EXISTS `data_capture_steps`;

CREATE TABLE `data_capture_steps` (
  `DCS_ID` varchar(36) NOT NULL,
  `DCS_STEP_CD` varchar(20) NOT NULL,
  `DCS_DISPLAY_NAME` varchar(50) NOT NULL,
  `DCS_DESC` varchar(500) NOT NULL,
  `DCS_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `DCS_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DCS_DISPLAY_ORDER` int(11) DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`DCS_ID`),
  UNIQUE KEY `DCS_STEP_CD` (`DCS_STEP_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `data_capture_steps` */

insert  into `data_capture_steps`(`DCS_ID`,`DCS_STEP_CD`,`DCS_DISPLAY_NAME`,`DCS_DESC`,`DCS_LAST_USR_ID`,`DCS_LAST_CHANGE_DT`,`DCS_DISPLAY_ORDER`,`record_status`) values ('5c50cde9-842b-11e8-9538-00155d0a851b','SCN_ENC','Register Patient','Screening Encounter Information','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',1,NULL),('5c50cec6-842b-11e8-9538-00155d0a851b','ELIG','Eligibility','Elibility','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',2,NULL),('5c50cf37-842b-11e8-9538-00155d0a851b','ENROLL','Enrollment','Enrollment decision','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',3,NULL),('5c50cfa1-842b-11e8-9538-00155d0a851b','ENC','Encounter Information','Encounter Information','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',1,NULL),('5c50d008-842b-11e8-9538-00155d0a851b','DEM','Demographics','Patient Demographics','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',3,NULL),('5c50d070-842b-11e8-9538-00155d0a851b','DIS_CHA','Disease Characteristics','Disease Characteristics','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',4,NULL),('5c50d0d8-842b-11e8-9538-00155d0a851b','SOC_FAC','Social Factors','Social Factors','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',5,NULL),('5c50d141-842b-11e8-9538-00155d0a851b','RIS_FAC','Risk Factors','Risk Factors','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',6,NULL),('5c50d1b5-842b-11e8-9538-00155d0a851b','DIS_HIS','Hep C History','Hep C History','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',7,NULL),('5c50d21d-842b-11e8-9538-00155d0a851b','COMORB','Co-morbidities','Co-morbidities','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',8,NULL),('5c50d284-842b-11e8-9538-00155d0a851b','MED_HIS','Medication History','Medication History','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',9,NULL),('5c50d2eb-842b-11e8-9538-00155d0a851b','PRO_HIS','Procedure History','Procedure History','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',10,NULL),('5c50d350-842b-11e8-9538-00155d0a851b','SYS_REV','Review of Systems','Review of Systems','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',11,NULL),('5c50d3b7-842b-11e8-9538-00155d0a851b','CLI_IMP','Clinical Impression','Clinical Impression','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',12,NULL),('5c50d41e-842b-11e8-9538-00155d0a851b','LAB','Lab results','Lab results','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',13,NULL),('5c50d486-842b-11e8-9538-00155d0a851b','TRT_RES','Treatment Response','Treatment Response','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',NULL,NULL),('5c50d4f5-842b-11e8-9538-00155d0a851b','VIT','Vitals','Vitals','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',14,NULL),('5c50d55d-842b-11e8-9538-00155d0a851b','PHY_EX','Physical Exam','Physical Exam','79edc223-843a-11e8-9538-00155d0a851b','2019-05-14 17:31:14',15,NULL),('5c50d5c4-842b-11e8-9538-00155d0a851b','ORD','Orders','Order tests','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',16,NULL),('5c50d62c-842b-11e8-9538-00155d0a851b','DSCHG','Discharge','Discharge','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:46',17,NULL),('5c50d695-842b-11e8-9538-00155d0a851b','PP','Patient Profile','Patient Profile','0','2018-07-10 15:54:30',1,NULL),('792d9ded-505f-11e9-83a3-00059a3c7800','DR_BLO_NOW','Draw blood now','Draw blood now','79edc223-843a-11e8-9538-00155d0a851b','2019-03-27 12:40:48',20,NULL),('7ed2e95d-8c10-11e9-bad0-00059a3c7a00','DSCHG_4','Discharge','Discharge','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:54:58',17,NULL),('848f6a13-8c10-11e9-bad0-00059a3c7a00','DSCHG_8','Discharge','Discharge','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:54:58',17,NULL),('89c1948a-8c10-11e9-bad0-00059a3c7a00','DSCHG_12','Discharge','Discharge','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:54:58',17,NULL),('8f0752d7-8c10-11e9-bad0-00059a3c7a00','DSCHG_16','Discharge','Discharge','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:54:58',17,NULL),('95c821c6-8c10-11e9-bad0-00059a3c7a00','DSCHG_20','Discharge','Discharge','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:54:58',17,NULL),('9ad0d165-8c10-11e9-bad0-00059a3c7a00','DSCHG_24','Discharge','Discharge','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:54:58',17,NULL),('a0bd3884-8c10-11e9-bad0-00059a3c7a00','DSCHG_36','Discharge','Discharge','79edc223-843a-11e8-9538-00155d0a851b','2019-05-15 15:54:58',17,NULL),('b3b4b432-b7f0-11e8-ae48-00155d0a851b','MED','Medications','Medications','79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 15:54:30',18,NULL),('b86c125f-b7f0-11e8-ae48-00155d0a851b','REF','Referrals','Referrals','79edc223-843a-11e8-9538-00155d0a851b','2018-07-10 15:54:30',19,NULL);

/*Table structure for table `document_library` */

DROP TABLE IF EXISTS `document_library`;

CREATE TABLE `document_library` (
  `DOC_ID` varchar(36) NOT NULL,
  `DOC_STU_ID` varchar(36) NOT NULL,
  `DOC_SIT_ID` varchar(45) NOT NULL,
  `DOC_FIELDNAME` varchar(50) NOT NULL,
  `DOC_ORIGINALNAME` varchar(100) DEFAULT NULL,
  `DOC_FILENAME` varchar(100) NOT NULL,
  `DOC_UPLOAD_DATE` date DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`DOC_ID`),
  KEY `DOC_STU_ID_idx` (`DOC_STU_ID`),
  KEY `DOC_SIT_ID_idx` (`DOC_SIT_ID`),
  CONSTRAINT `DOC_SIT_ID` FOREIGN KEY (`DOC_SIT_ID`) REFERENCES `sites` (`sit_id`),
  CONSTRAINT `DOC_STU_ID` FOREIGN KEY (`DOC_STU_ID`) REFERENCES `studies` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `document_library` */

insert  into `document_library`(`DOC_ID`,`DOC_STU_ID`,`DOC_SIT_ID`,`DOC_FIELDNAME`,`DOC_ORIGINALNAME`,`DOC_FILENAME`,`DOC_UPLOAD_DATE`,`record_status`) values ('2f59b22c-996c-11e9-b2c2-94de801a2d16','654ec9a2-8434-11e8-9538-00155d0a851b','2bed6776-8434-11e8-9538-00155d0a851b','protocolFiles','Islamabad1.xlsx','1561702558777_Islamabad1.xlsx','2019-06-28',NULL),('69bd7605-996c-11e9-b2c2-94de801a2d16','654ec9a2-8434-11e8-9538-00155d0a851b','2bed6776-8434-11e8-9538-00155d0a851b','informedFiles','ISL_Test_ Cases (1).xlsx','1561702656665_ISL_Test__Cases_(1).xlsx','2019-06-28',NULL),('6de33fcc-996c-11e9-b2c2-94de801a2d16','654ec9a2-8434-11e8-9538-00155d0a851b','2bed6776-8434-11e8-9538-00155d0a851b','protocolFiles','Islamabad.xlsx','1561702663645_Islamabad.xlsx','2019-06-28',NULL),('72bc6ce3-996c-11e9-b2c2-94de801a2d16','654ec9a2-8434-11e8-9538-00155d0a851b','2bed6776-8434-11e8-9538-00155d0a851b','othersFiles','Islamabad1.xlsx','1561702671799_Islamabad1.xlsx','2019-06-28',NULL);

/*Table structure for table `encounter_data_details` */

DROP TABLE IF EXISTS `encounter_data_details`;

CREATE TABLE `encounter_data_details` (
  `EDD_ID` varchar(36) NOT NULL,
  `EDD_STEP_CD` varchar(20) NOT NULL,
  `EDD_ISSUES_CNT` int(11) NOT NULL,
  `EDD_STEP_STATUS` varchar(20) NOT NULL,
  `EDD_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EDD_EDS_PEN_ID` varchar(36) DEFAULT NULL,
  `EDD_ISSUE_DESC` varchar(50) DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`EDD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `encounter_data_details` */

/*Table structure for table `encounter_data_summary` */

DROP TABLE IF EXISTS `encounter_data_summary`;

CREATE TABLE `encounter_data_summary` (
  `EDS_PEN_ID` varchar(36) NOT NULL,
  `EDS_ISSUES_CNT` int(11) NOT NULL,
  `EDS_STATUS` varchar(20) NOT NULL,
  `EDS_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`EDS_PEN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `encounter_data_summary` */

/*Table structure for table `encounter_lab_result` */

DROP TABLE IF EXISTS `encounter_lab_result`;

CREATE TABLE `encounter_lab_result` (
  `ELR_ID` varchar(36) NOT NULL,
  `ELR_PEN_ID` varchar(36) DEFAULT NULL,
  `ELR_LBT_CODE` varchar(45) DEFAULT NULL COMMENT 'This will be in reference of Lab Tests table with Lab Code',
  `ELR_RESULT_VALUE` varchar(2000) DEFAULT NULL COMMENT 'This field will capture the response of the lab test result',
  `ELR_RESULT_DT` datetime DEFAULT NULL COMMENT 'this will be the date and time of the result performed. ',
  `ELR_UOM` varchar(36) DEFAULT NULL COMMENT 'Unit of measurement for the lab test',
  `ELR_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `ELR_LAST_CHANGED_DT` datetime DEFAULT NULL,
  `ELR_LBT_TEST_DATE` varchar(36) DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  `encounter_group_id` varchar(36) DEFAULT NULL,
  `ELR_CRITICAL_VALUE` varchar(30) DEFAULT NULL,
  `ELR_RESULT_RANGE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `encounter_lab_result` */

/*Table structure for table `encounter_lab_tests` */

DROP TABLE IF EXISTS `encounter_lab_tests`;

CREATE TABLE `encounter_lab_tests` (
  `ELT_ID` varchar(36) NOT NULL,
  `ELT_SEV_ID` varchar(36) DEFAULT NULL,
  `ELT_LBT_ID` varchar(36) DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  `ELT_LAST_CHANGE_DT` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ELT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `encounter_lab_tests` */

insert  into `encounter_lab_tests`(`ELT_ID`,`ELT_SEV_ID`,`ELT_LBT_ID`,`record_status`,`ELT_LAST_CHANGE_DT`) values ('683f5be8-788c-11e9-80f5-00059a3c7a00','7e3b6951-8435-11e8-9538-00155d0a851b','b7fa00a2-842d-11e8-9538-00155d0a851b',NULL,'2019-05-17 15:43:06'),('6e92a778-788c-11e9-80f5-00059a3c7a00','7e3b6951-8435-11e8-9538-00155d0a851b','178e3e84-a695-11e8-bce8-00155d0a851b',NULL,'2019-05-17 15:43:17'),('73823422-788c-11e9-80f5-00059a3c7a00','7e3b6951-8435-11e8-9538-00155d0a851b','1790addc-a695-11e8-bce8-00155d0a851b',NULL,'2019-05-17 15:43:25'),('788ffa66-788c-11e9-80f5-00059a3c7a00','7e3b6951-8435-11e8-9538-00155d0a851b','b7f9fbfb-842d-11e8-9538-00155d0a851b',NULL,'2019-05-17 15:43:33'),('7c87a26b-a6a1-11e8-bce8-00155d0a851b','7e3b6c02-8435-11e8-9538-00155d0a851b','01baed7e-788c-11e9-80f5-00059a3c7a00',NULL,'2019-05-17 16:08:07'),('7c892b9a-a6a1-11e8-bce8-00155d0a851b','7e3b6c02-8435-11e8-9538-00155d0a851b','b7f9fa97-842d-11e8-9538-00155d0a851b',NULL,'2019-05-17 16:08:07'),('7c892d65-a6a1-11e8-bce8-00155d0a851b','7e3b6c02-8435-11e8-9538-00155d0a851b','db5c8cbd-a694-11e8-bce8-00155d0a851b',NULL,'2019-05-17 16:08:07'),('7c892e88-a6a1-11e8-bce8-00155d0a851b','7e3b6c02-8435-11e8-9538-00155d0a851b','b7fa00a2-842d-11e8-9538-00155d0a851b',NULL,'2019-05-17 16:08:07'),('7c892f8d-a6a1-11e8-bce8-00155d0a851b','7e3b6951-8435-11e8-9538-00155d0a851b','01baed7e-788c-11e9-80f5-00059a3c7a00','','2019-05-17 15:42:54'),('7c89308a-a6a1-11e8-bce8-00155d0a851b','7e3b6c02-8435-11e8-9538-00155d0a851b','178e3e84-a695-11e8-bce8-00155d0a851b',NULL,'2019-05-17 16:08:07'),('7c893187-a6a1-11e8-bce8-00155d0a851b','7e3b6c02-8435-11e8-9538-00155d0a851b','1790addc-a695-11e8-bce8-00155d0a851b',NULL,'2019-05-17 16:08:07'),('7c893276-a6a1-11e8-bce8-00155d0a851b','7e3b6c02-8435-11e8-9538-00155d0a851b','b7f9fbfb-842d-11e8-9538-00155d0a851b',NULL,'2019-05-17 16:08:07'),('7c893383-a6a1-11e8-bce8-00155d0a851b','5b2c539b-40e3-11e9-b27b-94de801a2d16','01baed7e-788c-11e9-80f5-00059a3c7a00',NULL,'2019-06-14 15:55:28'),('7c893472-a6a1-11e8-bce8-00155d0a851b','5b2c539b-40e3-11e9-b27b-94de801a2d16','b7f9fa97-842d-11e8-9538-00155d0a851b',NULL,'2019-06-14 15:55:29'),('7c893578-a6a1-11e8-bce8-00155d0a851b','5b2c539b-40e3-11e9-b27b-94de801a2d16','b7f9fbfb-842d-11e8-9538-00155d0a851b',NULL,'2019-06-14 15:55:30'),('7c893676-a6a1-11e8-bce8-00155d0a851b','5b2c539b-40e3-11e9-b27b-94de801a2d16','db5c8cbd-a694-11e8-bce8-00155d0a851b',NULL,'2019-06-14 15:55:30'),('7c893767-a6a1-11e8-bce8-00155d0a851b','5b2c539b-40e3-11e9-b27b-94de801a2d16','b7fa00a2-842d-11e8-9538-00155d0a851b',NULL,'2019-06-14 15:55:31'),('7c89386e-a6a1-11e8-bce8-00155d0a851b','5b2c539b-40e3-11e9-b27b-94de801a2d16','178e3e84-a695-11e8-bce8-00155d0a851b',NULL,'2019-06-14 15:55:32'),('7c89396d-a6a1-11e8-bce8-00155d0a851b','5b2c539b-40e3-11e9-b27b-94de801a2d16','1790addc-a695-11e8-bce8-00155d0a851b',NULL,'2019-06-14 15:55:35'),('7c893b54-a6a1-11e8-bce8-00155d0a851b','10535a80-416f-11e9-b27b-94de801a2d16','01baed7e-788c-11e9-80f5-00059a3c7a00',NULL,'2019-06-14 15:59:58'),('7c893c51-a6a1-11e8-bce8-00155d0a851b','10535a80-416f-11e9-b27b-94de801a2d16','b7f9fa97-842d-11e8-9538-00155d0a851b',NULL,'2019-06-14 16:00:01'),('7c893d3b-a6a1-11e8-bce8-00155d0a851b','10535a80-416f-11e9-b27b-94de801a2d16','db5c8cbd-a694-11e8-bce8-00155d0a851b',NULL,'2019-06-14 15:59:57'),('7c893e5e-a6a1-11e8-bce8-00155d0a851b','10535a80-416f-11e9-b27b-94de801a2d16','b7fa00a2-842d-11e8-9538-00155d0a851b',NULL,'2019-06-14 15:59:56'),('7c893f62-a6a1-11e8-bce8-00155d0a851b','10535a80-416f-11e9-b27b-94de801a2d16','178e3e84-a695-11e8-bce8-00155d0a851b',NULL,'2019-06-14 15:59:56'),('ba3fd79d-a76e-11e8-8b48-00155d0a851b','10535a80-416f-11e9-b27b-94de801a2d16','1790addc-a695-11e8-bce8-00155d0a851b',NULL,'2019-06-14 15:59:54'),('ba3febcc-a76e-11e8-8b48-00155d0a851b','10535a80-416f-11e9-b27b-94de801a2d16','b7f9fbfb-842d-11e8-9538-00155d0a851b',NULL,'2019-06-14 15:59:52'),('d3b91707-bc13-11e8-88c1-00155d0a851b','7e3b6951-8435-11e8-9538-00155d0a851b','b7f9fa97-842d-11e8-9538-00155d0a851b','','2019-05-17 15:27:50'),('f4e6a08e-bbd6-11e8-88c1-00155d0a851b','7e3b6951-8435-11e8-9538-00155d0a851b','db5c8cbd-a694-11e8-bce8-00155d0a851b','','2019-05-17 15:27:50');

/*Table structure for table `encounter_med_orders` */

DROP TABLE IF EXISTS `encounter_med_orders`;

CREATE TABLE `encounter_med_orders` (
  `EMO_ID` varchar(36) NOT NULL,
  `EMO_PEN_ID` varchar(36) DEFAULT NULL,
  `EMO_MED_CD` varchar(20) NOT NULL,
  `EMO_ORD_DT` date NOT NULL,
  `EMO_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `EMO_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`EMO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `encounter_med_orders` */

/*Table structure for table `encounter_referrals` */

DROP TABLE IF EXISTS `encounter_referrals`;

CREATE TABLE `encounter_referrals` (
  `ERE_ID` varchar(36) NOT NULL,
  `ERE_PEN_ID` varchar(36) DEFAULT NULL,
  `ERE_REF_CD` varchar(20) NOT NULL,
  `ERE_REF_DT` date NOT NULL,
  `ERE_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `ERE_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`ERE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `encounter_referrals` */

/*Table structure for table `encounter_test_orders` */

DROP TABLE IF EXISTS `encounter_test_orders`;

CREATE TABLE `encounter_test_orders` (
  `ETO_ID` varchar(36) NOT NULL,
  `ETO_PEN_ID` varchar(36) DEFAULT NULL,
  `ETO_TEST_CD` varchar(20) NOT NULL,
  `ETO_ORD_PLACE_DT` date NOT NULL,
  `ETO_ORD_EFF_DT` date DEFAULT NULL,
  `ETO_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `ETO_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `encounter_test_orders` */

/*Table structure for table `lab_tests` */

DROP TABLE IF EXISTS `lab_tests`;

CREATE TABLE `lab_tests` (
  `LBT_ID` varchar(36) NOT NULL,
  `LBT_CODE` varchar(45) DEFAULT NULL COMMENT 'Each Lab Test Element will have unique code to identify and will be used while integrating with external system ',
  `LBT_NAME` varchar(45) DEFAULT NULL COMMENT 'Name of the Lab test',
  `LBT_DESC` varchar(45) DEFAULT NULL COMMENT 'Description of Lab Test to identify in detail',
  `LBT_TYPE` varchar(45) DEFAULT NULL,
  `LBT_GROUP_ID` varchar(36) DEFAULT NULL,
  `LBT_UOM_CODE` varchar(20) DEFAULT NULL COMMENT 'Available unit of measurement for the lab result value. ',
  `LBT_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `LBT_LAST_CHANGED_DT` datetime DEFAULT NULL,
  `LBT_NORMAL_RANGE` varchar(500) DEFAULT NULL COMMENT 'Each Lab Result will have normal range for values for reference. ',
  `record_status` char(1) DEFAULT NULL,
  `LBT_CONTROL_TYPE` varchar(5) DEFAULT NULL,
  `LBT_RESPONSE_CODE` int(11) DEFAULT NULL,
  `LBT_HAS_CRITICAL` tinyint(4) DEFAULT NULL,
  `LBT_RECORD_STATUS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`LBT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lab_tests` */

insert  into `lab_tests`(`LBT_ID`,`LBT_CODE`,`LBT_NAME`,`LBT_DESC`,`LBT_TYPE`,`LBT_GROUP_ID`,`LBT_UOM_CODE`,`LBT_LAST_USR_ID`,`LBT_LAST_CHANGED_DT`,`LBT_NORMAL_RANGE`,`record_status`,`LBT_CONTROL_TYPE`,`LBT_RESPONSE_CODE`,`LBT_HAS_CRITICAL`,`LBT_RECORD_STATUS`) values ('01baed7e-788c-11e9-80f5-00059a3c7a00','APRI','APRI','APRI','APRI','b7fa0e5f-842d-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b',NULL,NULL,NULL,'txt',NULL,1,'Active'),('178e3e84-a695-11e8-bce8-00155d0a851b','HCT','Hematocrit','Hematocrit','Hematocrit','b7fa0e5f-842d-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-23 00:00:00','18 - 50 d/mL',NULL,'txt',NULL,1,'Active'),('1790addc-a695-11e8-bce8-00155d0a851b','HCV RNA','HCV RNA','HCV RNA','HCV RNA','b7fa0e5f-842d-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-23 00:00:00','28 - 50 d/mL',NULL,'txt',NULL,1,'Active'),('b7f9fa97-842d-11e8-9538-00155d0a851b','AST','AST (SGOT)','AST (SGOT)','AST (SGOT)','b7fa0e5f-842d-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-06-08 00:00:00','38 - 50 d/mL',NULL,'txt',NULL,1,'Active'),('b7f9fbfb-842d-11e8-9538-00155d0a851b','WBC','WBC','WBC','WBC','b7fa0e5f-842d-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-06-08 00:00:00','42 - 50 d/mL',NULL,'txt',NULL,1,'Active'),('b7fa00a2-842d-11e8-9538-00155d0a851b','PLT','Platelet','Platelet','Platelet','b7fa0e5f-842d-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-06-08 00:00:00','45 - 50 d/mL',NULL,'txt',NULL,1,'Active'),('b7fa0e5f-842d-11e8-9538-00155d0a851b','Group','','','','0',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-06-08 00:00:00',NULL,NULL,'txt',NULL,1,'Active'),('db5c8cbd-a694-11e8-bce8-00155d0a851b','HB','Hemoglobin','Hemoglobin','Hemoglobin','b7fa0e5f-842d-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-23 00:00:00','48 - 50 d/mL',NULL,'txt',NULL,1,'Active');

/*Table structure for table `login_history` */

DROP TABLE IF EXISTS `login_history`;

CREATE TABLE `login_history` (
  `ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `DETAILS` varchar(255) NOT NULL,
  `STATUS` varchar(45) NOT NULL,
  `CREATED_AT` datetime NOT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login_history` */

insert  into `login_history`(`ID`,`USER_ID`,`DETAILS`,`STATUS`,`CREATED_AT`,`record_status`) values ('0619b34c-9efa-11e9-9de9-00059a3c7a00','79edc2fd-843a-11e8-9538-00155d0a851b','{\"uname\":demo}','SUCCESS','2019-07-05 13:23:40',NULL),('2878ace1-9ef7-11e9-9de9-00059a3c7a00','79edc2fd-843a-11e8-9538-00155d0a851b','{\"uname\":demo}','SUCCESS','2019-07-05 13:03:09',NULL),('36a08648-9efa-11e9-9de9-00059a3c7a00','79edc2fd-843a-11e8-9538-00155d0a851b','{\"uname\":demo}','SUCCESS','2019-07-05 13:25:01',NULL),('38c2855a-9efb-11e9-9de9-00059a3c7a00','79edc2fd-843a-11e8-9538-00155d0a851b','{\"uname\":demo}','SUCCESS','2019-07-05 13:32:14',NULL),('3bd8ef67-9ef8-11e9-9de9-00059a3c7a00','79edc2fd-843a-11e8-9538-00155d0a851b','{\"uname\":demo}','SUCCESS','2019-07-05 13:10:51',NULL),('3df32a61-9ef7-11e9-9de9-00059a3c7a00','79edc2fd-843a-11e8-9538-00155d0a851b','{\"uname\":demo}','SUCCESS','2019-07-05 13:03:45',NULL),('ce0a5fd4-9efa-11e9-9de9-00059a3c7a00','79edc2fd-843a-11e8-9538-00155d0a851b','{\"uname\":demo}','SUCCESS','2019-07-05 13:29:15',NULL),('ecbf6950-9efa-11e9-9de9-00059a3c7a00','79edc2fd-843a-11e8-9538-00155d0a851b','{\"uname\":demo}','SUCCESS','2019-07-05 13:30:07',NULL),('f1715beb-9ef9-11e9-9de9-00059a3c7a00','79edc2fd-843a-11e8-9538-00155d0a851b','{\"uname\":demo}','SUCCESS','2019-07-05 13:23:05',NULL);

/*Table structure for table `medications` */

DROP TABLE IF EXISTS `medications`;

CREATE TABLE `medications` (
  `MED_ID` varchar(36) NOT NULL,
  `MED_CD` varchar(20) NOT NULL,
  `MED_NAMES` varchar(200) NOT NULL,
  `MED_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `MED_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`MED_ID`),
  UNIQUE KEY `MED_CD` (`MED_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `medications` */

insert  into `medications`(`MED_ID`,`MED_CD`,`MED_NAMES`,`MED_LAST_USR_ID`,`MED_LAST_CHANGE_DT`,`record_status`) values ('6b5ef3c4-842e-11e8-9538-00155d0a851b','Harvoni','Harvoni','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:47',NULL),('6b5ef49f-842e-11e8-9538-00155d0a851b','Viekira Pak','Viekira Pak','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:47',NULL),('6b5ef50e-842e-11e8-9538-00155d0a851b','Zepatier','Zepatier','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:47',NULL),('6b5ef575-842e-11e8-9538-00155d0a851b','Technivie','Technivie','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:47',NULL),('6b5ef5d9-842e-11e8-9538-00155d0a851b','Epclusa','Epclusa','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:47',NULL),('6b5ef63e-842e-11e8-9538-00155d0a851b','Vosevi','Vosevi','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:47',NULL),('6b5ef6a4-842e-11e8-9538-00155d0a851b','Mavyret','Mavyret','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:47',NULL),('6b5ef70a-842e-11e8-9538-00155d0a851b','Daclatasvir ','Daclatasvir ','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:47',NULL),('6b5ef77e-842e-11e8-9538-00155d0a851b','sofosbuvir ','sofosbuvir ','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:47',NULL);

/*Table structure for table `participant_crf_details` */

DROP TABLE IF EXISTS `participant_crf_details`;

CREATE TABLE `participant_crf_details` (
  `PCD_ID` varchar(36) NOT NULL,
  `PCD_PEN_ID` varchar(36) DEFAULT NULL,
  `PCD_CRF_ID` varchar(36) DEFAULT NULL,
  `PCD_CRF_ENTRY_DT` datetime DEFAULT NULL,
  `PCD_CRF_STATUS` varchar(45) DEFAULT NULL,
  `PCD_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `PCD_LAST_CHANGE_DT` datetime DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  `PCD_REVIEW` int(1) DEFAULT NULL,
  PRIMARY KEY (`PCD_ID`),
  KEY `fk_pcd_pen_id_idx` (`PCD_PEN_ID`),
  KEY `fk_pcd_crf_id_idx` (`PCD_CRF_ID`),
  CONSTRAINT `fk_pcd_crf_id` FOREIGN KEY (`PCD_CRF_ID`) REFERENCES `crf_library` (`crf_id`),
  CONSTRAINT `fk_pcd_pen_id` FOREIGN KEY (`PCD_PEN_ID`) REFERENCES `participant_encounters` (`pen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_crf_details` */

insert  into `participant_crf_details`(`PCD_ID`,`PCD_PEN_ID`,`PCD_CRF_ID`,`PCD_CRF_ENTRY_DT`,`PCD_CRF_STATUS`,`PCD_LAST_USR_ID`,`PCD_LAST_CHANGE_DT`,`record_status`,`PCD_REVIEW`) values ('74933972-9ef7-11e9-9de9-00059a3c7a00','7483f13f-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('75639d56-9ef7-11e9-9de9-00059a3c7a00','7554ddee-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('76182f44-9ef7-11e9-9de9-00059a3c7a00','76108d58-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('7703876b-9ef7-11e9-9de9-00059a3c7a00','76fd2b81-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('77f90179-9ef7-11e9-9de9-00059a3c7a00','77e719d9-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('793110b8-9ef7-11e9-9de9-00059a3c7a00','791487dd-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('7acd9d9f-9ef7-11e9-9de9-00059a3c7a00','7ab6be21-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('7bfeda37-9ef7-11e9-9de9-00059a3c7a00','7bf73479-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('7cb5fc31-9ef7-11e9-9de9-00059a3c7a00','7cae5915-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('7d82bb70-9ef7-11e9-9de9-00059a3c7a00','7d774311-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('7e2d1485-9ef7-11e9-9de9-00059a3c7a00','7e25724a-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('7ef88dae-9ef7-11e9-9de9-00059a3c7a00','7eefa4a5-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('7fbc62f4-9ef7-11e9-9de9-00059a3c7a00','7fb22f58-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('808addd5-9ef7-11e9-9de9-00059a3c7a00','807e26d4-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('814488cf-9ef7-11e9-9de9-00059a3c7a00','813b194c-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('82171445-9ef7-11e9-9de9-00059a3c7a00','8200ccd1-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('831d8fab-9ef7-11e9-9de9-00059a3c7a00','83173585-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('83da7090-9ef7-11e9-9de9-00059a3c7a00','83d0d6f1-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('84bb6077-9ef7-11e9-9de9-00059a3c7a00','848e474c-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('858a15c5-9ef7-11e9-9de9-00059a3c7a00','857ea67f-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('86b711f4-9ef7-11e9-9de9-00059a3c7a00','86ab9d26-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('8754bf19-9ef7-11e9-9de9-00059a3c7a00','87494b6e-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('88137c2a-9ef7-11e9-9de9-00059a3c7a00','880d1cef-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('890b20c1-9ef7-11e9-9de9-00059a3c7a00','88feb632-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('8a20a32d-9ef7-11e9-9de9-00059a3c7a00','8a1a468a-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('8ad3b11e-9ef7-11e9-9de9-00059a3c7a00','8acad20e-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('8b9dd332-9ef7-11e9-9de9-00059a3c7a00','8b93ef9b-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('8cb82326-9ef7-11e9-9de9-00059a3c7a00','8caf3bc9-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('8d942d2f-9ef7-11e9-9de9-00059a3c7a00','8d7c4223-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('8e870e81-9ef7-11e9-9de9-00059a3c7a00','8e7ce164-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('8f29d2b5-9ef7-11e9-9de9-00059a3c7a00','8f2266ca-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('90098bfd-9ef7-11e9-9de9-00059a3c7a00','8ff165ba-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('90ddfd93-9ef7-11e9-9de9-00059a3c7a00','90d4eeaf-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('91d878bf-9ef7-11e9-9de9-00059a3c7a00','91ccf69b-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('927ef5af-9ef7-11e9-9de9-00059a3c7a00','927753b2-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('9352f686-9ef7-11e9-9de9-00059a3c7a00','93355e47-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('94c8fa58-9ef7-11e9-9de9-00059a3c7a00','949d9694-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('979bcdfa-9ef7-11e9-9de9-00059a3c7a00','977f65f8-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('99219e00-9ef7-11e9-9de9-00059a3c7a00','990a34cb-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('9ac87568-9ef7-11e9-9de9-00059a3c7a00','9ab2af37-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('9d5133e3-9ef7-11e9-9de9-00059a3c7a00','9d450ac7-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('9e57714d-9ef7-11e9-9de9-00059a3c7a00','9e4ac45a-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('9f21a580-9ef7-11e9-9de9-00059a3c7a00','9f1a037c-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('a06d297f-9ef7-11e9-9de9-00059a3c7a00','a051a1a6-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('a15a074e-9ef7-11e9-9de9-00059a3c7a00','a13a0fc3-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('a29b5dd3-9ef7-11e9-9de9-00059a3c7a00','a290484a-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('a3711561-9ef7-11e9-9de9-00059a3c7a00','a366d14b-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('a45d81fc-9ef7-11e9-9de9-00059a3c7a00','a453a7d8-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('a530ebca-9ef7-11e9-9de9-00059a3c7a00','a526bd75-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('a6344efe-9ef7-11e9-9de9-00059a3c7a00','a62166a0-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL),('a6f576e7-9ef7-11e9-9de9-00059a3c7a00','a6edd391-9ef7-11e9-9de9-00059a3c7a00','a1adf8ab-8429-11e8-9538-00155d0a851b',NULL,'Completed',NULL,NULL,NULL,NULL);

/*Table structure for table `participant_crf_responses` */

DROP TABLE IF EXISTS `participant_crf_responses`;

CREATE TABLE `participant_crf_responses` (
  `PCR_ID` varchar(36) NOT NULL,
  `PCR_CRF_CODE` varchar(45) DEFAULT NULL,
  `PCR_QUE_ID` varchar(36) DEFAULT NULL,
  `PCR_RESPONSE_VALUE` varchar(2000) DEFAULT NULL,
  `PCR_UOM_ID` varchar(36) DEFAULT NULL,
  `PCR_PEN_ID` varchar(36) DEFAULT NULL,
  `PCR_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `PCR_LAST_CHANGED_DT` datetime DEFAULT NULL,
  `PCR_PCD_ID` varchar(36) DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`PCR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_crf_responses` */

insert  into `participant_crf_responses`(`PCR_ID`,`PCR_CRF_CODE`,`PCR_QUE_ID`,`PCR_RESPONSE_VALUE`,`PCR_UOM_ID`,`PCR_PEN_ID`,`PCR_LAST_USR_ID`,`PCR_LAST_CHANGED_DT`,`PCR_PCD_ID`,`record_status`) values ('74a4e38b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','At home',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('74ac801e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('74c476ab-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('74cb3b98-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('74d198fe-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('74d7f4de-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('74de4f9c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('74e4ab78-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('74eb0888-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('74f163c4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('74ff3319-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('750d7aac-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('751daf67-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('75254f82-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('752cf017-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7483f13f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'74933972-9ef7-11e9-9de9-00059a3c7a00',NULL),('756b3ec6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('7572e14c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('757a81c6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('758220ed-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('7589c268-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('75916419-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('759904df-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('75a0e708-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('75c8482d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('75d640bf-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('75dc9dad-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('75e2f8d8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Dont Know',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('75e955da-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('75efb146-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('75f60f24-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7554ddee-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'75639d56-9ef7-11e9-9de9-00059a3c7a00',NULL),('761fce2e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Barber',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('7627746a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('7632e14f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('763bd1a7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('765cfe56-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('766356b2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('7669b4fd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('76701170-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('767de6fb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('7685880c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('7690fbe3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('769db20c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('76a553dc-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('76acf505-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('76b496c7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'76108d58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'76182f44-9ef7-11e9-9de9-00059a3c7a00',NULL),('770ee427-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('77193982-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('772336fb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','Yes',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('7733da98-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('774205aa-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('7752444c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('775c998b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('77658365-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('7770459f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('77997a55-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('77a25fde-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('77ab4466-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','One Dose',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('77b42ba8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('77c0e088-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('77c882bb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'76fd2b81-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7703876b-9ef7-11e9-9de9-00059a3c7a00',NULL),('78048855-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Barber',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('7817965b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('78243fce-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('782a9e68-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('783198b9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('7848b09f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('78533d68-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('78628843-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('7868e66c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('78743345-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('787fbeea-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('788dcb35-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('789a7aa2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('78ac28ba-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('78d4e390-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'77e719d9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'77f90179-9ef7-11e9-9de9-00059a3c7a00',NULL),('79587c73-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('799620db-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('79aa76a6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('79b9faf8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('79c40c0f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7a01b4b0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7a234845-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7a3b69cc-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7a41ca19-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7a4bf52b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7a5766bd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7a5dbca7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Dont Know',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7a641ec1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7a7b5490-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7a8e2658-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'791487dd-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'793110b8-9ef7-11e9-9de9-00059a3c7a00',NULL),('7adf0eed-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7aed6d68-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7af509ac-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7afcf4d0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b124fb8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b22f824-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b30db3c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b3c598a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b453f0c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b4e2915-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b5855e1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b613ada-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b752ae8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b875507-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7b903a9e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7ab6be21-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7acd9d9f-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c067a14-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c0e1b66-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c15bb8a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c1d5e06-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c25015c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c30bf8b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c48a2c9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c59241a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c60c4fb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c686b64-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c78f01e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c808d26-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c883008-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c8fd454-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7c9777a0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7bf73479-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7bfeda37-9ef7-11e9-9de9-00059a3c7a00',NULL),('7cbd9f4a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7cc54583-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7cd8bd67-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','Yes',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7ce8d672-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7cf81e86-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d010579-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d08a44e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d192563-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d1f8083-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d25dc8f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d2d7d73-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d33d92a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d3b7dbf-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d431de7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d4ac03c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7cae5915-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7cb5fc31-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d8a5ecd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Barber',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d948a19-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7d9c2af3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7da511c4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7daf988a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7dbe7332-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7dc4cee8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7dcc7115-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7dd41069-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7dda6caf-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7de21006-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7de869bf-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7deec5c1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7df522d8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e049e51-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7d774311-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7d82bb70-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e39c9e0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e42b66d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e4a5c65-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e570c6b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e5ead49-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e65078b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e6b6252-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e71bf0a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e781a56-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e838e95-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e8b2f08-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7e91cbae-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7ea87715-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7eb523b6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7ebcc4ce-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7e25724a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7e2d1485-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f005e4a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f1c256e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f250ae5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f339d18-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f4f0564-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f57eb3b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f60d34d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f6d84e4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f7668c4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f7cc415-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f832106-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f8980c3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f8fdb50-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f977e81-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7f9dd579-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7eefa4a5-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7ef88dae-9ef7-11e9-9de9-00059a3c7a00',NULL),('7fc446be-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','At home',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('7fd85bed-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('7feb7015-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('7ff6dc7b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('8008abe4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('801416ed-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('801a732d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('8020cf7e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('80272ad9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('802d86bf-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('8033e15e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('803a3cd7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('804099ad-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('8046f51c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('805123d4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'7fb22f58-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'7fbc62f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('80913af6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80979c43-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80a07d17-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80a6d864-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80ad334a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80b39114-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80b9eb4f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80c18c66-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80c7e8a6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80cf89dc-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80d92cd9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80e35cf2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80ed8826-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('80f98264-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('811f21c2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'807e26d4-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'808addd5-9ef7-11e9-9de9-00059a3c7a00',NULL),('814c264b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','At home',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('815b692c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('81659a15-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('816fc6a0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('81761ff2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('817c7c2b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('818a785f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('81a0e0d9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('81ab8986-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('81b6fbf0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('81bd5610-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('81c3b2dc-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('81ca1544-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('81d2f42c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('81dbd79f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'813b194c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'814488cf-9ef7-11e9-9de9-00059a3c7a00',NULL),('82255900-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('82475f60-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('8254a8b5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('825e4992-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('82709ec7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('8276fb0a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('828125a8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('828b55f7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('82957e8d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('82a891ca-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('82b91922-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('82c8667a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('82e59a78-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('82ebf953-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('82f257d8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8200ccd1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'82171445-9ef7-11e9-9de9-00059a3c7a00',NULL),('8323eb7e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('832a4805-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('8330a441-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('83370add-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('834161ed-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('8348cbef-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('834f279b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('8355c22c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('83803e14-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('838af6ab-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('8398e7a2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('839f4318-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('83a9710d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('83b110b3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('83b8af90-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'83173585-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'831d8fab-9ef7-11e9-9de9-00059a3c7a00',NULL),('83e16026-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','At home',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('83e7bbbe-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('83ef9ba1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('84083057-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('8412f991-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('841954db-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('841fc89c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('842dad5d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('8434078a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('843a62de-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('8441d745-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('84534ba6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('846278f5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('846bd2df-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('84776d53-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'83d0d6f1-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'83da7090-9ef7-11e9-9de9-00059a3c7a00',NULL),('84cfe419-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','At home',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('84da9f37-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('84e0fc9d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('84e754ec-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('84eef52b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('84fa68bf-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('85037699-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('8517b18e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('852dab69-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('853bee33-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('8546b55c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('854d159a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('8555577c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('85602a6e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('856b9171-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'848e474c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'84bb6077-9ef7-11e9-9de9-00059a3c7a00',NULL),('859bf3de-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','At home',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('85a9df87-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('85b4b1cd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('85c3785c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('85d51ce9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('85f8cc8e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('86094638-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('86195630-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('862decb7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('864db705-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('866ef7a4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('86769b64-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('867e399f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('868d1935-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('86988bc8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'857ea67f-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'858a15c5-9ef7-11e9-9de9-00059a3c7a00',NULL),('86bd6ad9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('86c3c846-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('86ca2a48-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('86d30a4b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('86d9650f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('86dfc1b6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('86e61d51-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('86f34e4a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('87084244-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('87129ec5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('871ccb2a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('872328df-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('872982c1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('872fded4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('87363c1f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'86ab9d26-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'86b711f4-9ef7-11e9-9de9-00059a3c7a00',NULL),('876d3140-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Both',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87758d04-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('877d3005-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('878ecfde-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87a0dad3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87a87b4d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87b01eda-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87b6a629-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87c218a0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87c873cb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87ced2f1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87d52ae0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87db85c9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87e6cb15-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('87f63a5b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'87494b6e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8754bf19-9ef7-11e9-9de9-00059a3c7a00',NULL),('881a1806-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('88385ec2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('883eb982-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('8846d208-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('884f3eeb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('885d4f6f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('887faa22-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('88912516-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('889b53a5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('88a438c3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('88ae99f8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('88be1b01-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('88ce6592-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('88d8919e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('88def03b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'880d1cef-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'88137c2a-9ef7-11e9-9de9-00059a3c7a00',NULL),('89159dc2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','At home',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('892206a6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('892b3940-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('893423b0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('893bc09c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('894bb1ca-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('898f07e9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('89a9d374-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('89bbe8a9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('89c4cea9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('89cdb435-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('89d55882-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('89dcf70f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('89e6ed6d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('89fe1f58-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'88feb632-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'890b20c1-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a26ffa3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a30d4ba-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a3dadd2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a455151-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a4cf27a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a54c604-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','No',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a5b217d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a6692df-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a75d8c8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a80ab5e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a941cca-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8a9bbffe-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8aa35f29-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8aaaff8b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ab2a225-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8a1a468a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8a20a32d-9ef7-11e9-9de9-00059a3c7a00',NULL),('8adb5396-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Barber',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ae2f6c7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8aea96f9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8af238fd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b0173b7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b091792-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b10b917-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b2092b9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b32098f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b5a82d5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b6628df-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b6dc963-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b7425f1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b7a815d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8b80e050-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8acad20e-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8ad3b11e-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ba572c7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8bad6547-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8bd496f9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','Yes',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8bec1b8c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8bf9ac7b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8c014a49-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','No',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8c07a659-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8c0e010b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8c145da8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8c1fce39-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8c2c3eee-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8c367794-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8c3e01d2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8c4c1047-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8c6a9dcd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8b93ef9b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8b9dd332-9ef7-11e9-9de9-00059a3c7a00',NULL),('8cbfc471-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8cc8eee4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8cd2d9bf-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8cdbc075-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8cea8834-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d0b0f3b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','No',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d1630cb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d205a76-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d2d6234-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d33bd95-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d3da931-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d46916c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Two Dose',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d4f7ad8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d586173-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d628df6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8caf3bc9-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8cb82326-9ef7-11e9-9de9-00059a3c7a00',NULL),('8d9e8f0b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8da5ffd0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8db0309a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8dbf6a73-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8dc5c8a9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8dcd6726-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','No',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8dd3c4ef-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ddb67cd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8de30971-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ded315c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8dfb34f7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8e055c26-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8e0bba4f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8e3737c6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8e541ed8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8d7c4223-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8d942d2f-9ef7-11e9-9de9-00059a3c7a00',NULL),('8e8c250e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8e913a83-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8e979629-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','Yes',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8e9df1d9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ea44d96-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8eaef6f5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ec6869c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ece2500-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ed5d0f9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8edeb182-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ee652b1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8eef530c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8ef6f46b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8efe950b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f04f289-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8e7ce164-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8e870e81-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f3175a5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f391368-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f3f7146-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','Yes',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f5026dc-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f5b6b76-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f66dc48-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','No',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f6d3989-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f74d7e3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f7f06c4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f85621b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f8bbf36-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f921a8d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Three Dose',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8f98748e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8fac2895-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('8fb32a8e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8f2266ca-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'8f29d2b5-9ef7-11e9-9de9-00059a3c7a00',NULL),('9018c702-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('9021cb58-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('902d3dee-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','Yes',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('903a4121-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('904f90f2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('9055ebab-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('906019ca-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('906a431f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('90736646-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('908b2a94-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('9092ca8c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('90a0f0ea-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Dont Know',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('90aaf82f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('90b3dd3c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('90bcc6ea-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'8ff165ba-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90098bfd-9ef7-11e9-9de9-00059a3c7a00',NULL),('90f25518-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('910ac384-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('912cd45b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('913aceb0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('91426fff-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('91518938-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('91592002-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('91637c86-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('916b21f2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('9172c1e6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('917a6047-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('918204f7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Three Dose',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('9189a347-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('919288c2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('9197a2d9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'90d4eeaf-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'90ddfd93-9ef7-11e9-9de9-00059a3c7a00',NULL),('91ded55f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Barber',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('91e67770-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('91f472cd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('91fd5a53-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('920432bc-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('920bd0ac-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('92122c89-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('9219d05d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('92217164-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('92291479-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('9230b377-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('92385346-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('9243a518-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('925308ac-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('925e78e1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'91ccf69b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'91d878bf-9ef7-11e9-9de9-00059a3c7a00',NULL),('92869d63-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('928f7ddf-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('92971f64-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('929ec28a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('92a66d9a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('92af4baa-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('92b6ecc8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('92be8c75-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('92c62c11-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('92cf13a1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('92dd79d6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('92fae251-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Dont Know',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('93050f8a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('930f39a6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('931821f9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'927753b2-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'927ef5af-9ef7-11e9-9de9-00059a3c7a00',NULL),('935eba9d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('936658bd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('937114e2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('9381b7cd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('93918952-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('93992ba1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('93a0cb8b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('93a86df2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('93b00e40-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('93bffa94-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('93c79ccb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('93cf3c36-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('93d6de89-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('93f02efa-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('941cc93b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','',NULL,'93355e47-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9352f686-9ef7-11e9-9de9-00059a3c7a00',NULL),('94efa6a0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('950ec1ab-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('95272ca4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('954ac066-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('95763f8f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('95a5b840-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('95eb46a5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('962a8744-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('963e4bd6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('96569e8b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('9678daa4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('96a3dc8f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Three Dose',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('96c31984-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('96f05549-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('97258563-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'949d9694-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'94c8fa58-9ef7-11e9-9de9-00059a3c7a00',NULL),('97b2424b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','At home',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('97c4aefe-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('97dbb984-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('97f12bc8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('9804a614-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('9815de1f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('98269fd3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('983365ba-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('98498abb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('985e8cfb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('9872e7e2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('9883a4e5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('989e98d6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('98b7e1fe-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('98c1b354-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'977f65f8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'979bcdfa-9ef7-11e9-9de9-00059a3c7a00',NULL),('9935bfb7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('9945f484-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('99501ae9-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('996a3d77-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('999f9b94-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('99b20e74-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('99c15fbd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('99dacb07-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('99f57aa7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('9a10043b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('9a25c236-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('9a369d0e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('9a44486c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('9a4d2c24-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('9a6563ef-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'990a34cb-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'99219e00-9ef7-11e9-9de9-00059a3c7a00',NULL),('9adf8442-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9b13d809-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9b4e9f6f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9b6e68bc-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9b7a82d2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9b83c3c6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9b933652-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9b9ad769-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9ba3c4c7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9bb2fa47-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9bd665cf-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9c079623-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Three Dose',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9c6b1192-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9cbfcc49-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9ce855e7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'9ab2af37-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9ac87568-9ef7-11e9-9de9-00059a3c7a00',NULL),('9d666fd7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9d729d69-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9d7f6bd3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9d8a661d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9d922990-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9db104f0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9dbe8e37-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9dc76f20-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9dcf1392-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9de0d3a4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9def85c7-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9dff581d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Two Dose',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9e0984b5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9e1124f1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9e18c6ad-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'9d450ac7-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9d5133e3-9ef7-11e9-9de9-00059a3c7a00',NULL),('9e5f11e3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9e66b450-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9e6e553b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9e796d41-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9e876bda-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9e91971c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9e9937e8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9ea21f1c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9ea9c026-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9eb1612c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9eb8fe7f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9ec0de4d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9ee30020-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9ef2aaa3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9f0036c0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','',NULL,'9e4ac45a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9e57714d-9ef7-11e9-9de9-00059a3c7a00',NULL),('9f2dfe91-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Barber',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9f4112ed-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9f48b1f6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9f505393-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9f57f369-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9f632ed1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9f767950-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9f7e19f6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9f936fdb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9faed037-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9fb7a713-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9fc17e51-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9fcbaac4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9fd354b0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('9fe6b833-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'9f1a037c-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'9f21a580-9ef7-11e9-9de9-00059a3c7a00',NULL),('a07ef580-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Both',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a08696d1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a091bd04-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a0ad2621-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a0bbfdf0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a0c405d6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a0cba5b6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a0d3497a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a0daea50-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a0e28d24-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a0ea31ca-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a0fa4a12-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a101eea3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a1098c85-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a1127561-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a051a1a6-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a06d297f-9ef7-11e9-9de9-00059a3c7a00',NULL),('a16cc54f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','At home',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a17e8ce6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a18c8ca2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a19a8851-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a1afb011-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a1bbff9b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a1da908c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a1e58f31-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a1f38cb5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a2047e03-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a219af3d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a22e74df-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a24120a2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a24dd004-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a255a63e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a13a0fc3-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a15a074e-9ef7-11e9-9de9-00059a3c7a00',NULL),('a2a9591f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a2b2402a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a2b9011f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','Yes',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a2bf5d06-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a2d320b0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a2df2f0d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','No',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a2ebe8d5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','Yes',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a2fa5aa3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','No',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a30e368e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a31661ef-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a31d7886-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a323de16-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a32eea56-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a33b93a4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a3433656-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a290484a-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a29b5dd3-9ef7-11e9-9de9-00059a3c7a00',NULL),('a37b29d0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a385aaa0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a3a594e8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a3bc6285-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','Yes',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a3c68f05-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a3d43035-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a3dbcf82-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a3e3cc01-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a3eb6fd6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a3f8435f-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a405c5cb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a40ff326-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Three Dose',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a4179418-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a41f6e5e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a439ea13-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a366d14b-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a3711561-9ef7-11e9-9de9-00059a3c7a00',NULL),('a467afb0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Barber',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a471dd2a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','Yes',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a47ac20b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a482645d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a48a5800-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a491fa5d-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a49fa096-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a4a75265-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a4b54337-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a4c04c4b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a4da2959-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a4f023ca-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Dont Know',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a4fa3a63-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a50322be-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a50c08cb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a453a7d8-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a45d81fc-9ef7-11e9-9de9-00059a3c7a00',NULL),('a53b1d87-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Barber',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a545459e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','No',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a54ce7bd-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a569e7b8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a58d7e0a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a59e225c-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a5a5c187-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a5ad6350-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a5b505fb-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a5bca667-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a5c447e2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a5cbe662-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Dont Know',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a5d387ad-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a5db31c6-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a5e96a62-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a526bd75-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a530ebca-9ef7-11e9-9de9-00059a3c7a00',NULL),('a63e58d0-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','N/A',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a64c53df-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','N/A',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a6553bbe-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a65e211a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a667084b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','No',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a66eaae1-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a677c6b2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a67e202a-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a68c3bb5-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a6a44c66-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a6b0c9a8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a6b86af3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Three Dose',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a6c02157-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a6cf4f06-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a6d6f073-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a62166a0-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6344efe-9ef7-11e9-9de9-00059a3c7a00',NULL),('a7010e85-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d43d-842a-11e8-9538-00155d0a851b','Both',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a70766f2-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d4be-842a-11e8-9538-00155d0a851b','Yes',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a70dcb74-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d541-842a-11e8-9538-00155d0a851b','No',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a716ae8e-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d5c3-842a-11e8-9538-00155d0a851b','No',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a7225bc4-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','20d6d646-842a-11e8-9538-00155d0a851b','Yes',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a73cc341-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc7d2310-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a7496200-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fcac007f-842a-11e8-9538-00155d0a851b','No',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a7527316-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc97d96e-b737-11e8-ae48-00155d0a851b','Yes',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a758ce33-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','fc9a388e-b737-11e8-ae48-00155d0a851b','No',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a766b9e3-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','291e25c4-9e56-11e9-9de9-00059a3c7a00','N/A',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a7802c0b-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','2da22b28-9e56-11e9-9de9-00059a3c7a00','Yes',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a78a56ff-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3166bbb4-9e56-11e9-9de9-00059a3c7a00','Dont Know',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a796f2bc-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','361d733c-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a79fd9ed-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','39516ae3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL),('a7a8bfa8-9ef7-11e9-9de9-00059a3c7a00','RIS_FAC','3c56fdd3-9e56-11e9-9de9-00059a3c7a00','No',NULL,'a6edd391-9ef7-11e9-9de9-00059a3c7a00',NULL,NULL,'a6f576e7-9ef7-11e9-9de9-00059a3c7a00',NULL);

/*Table structure for table `participant_demographics` */

DROP TABLE IF EXISTS `participant_demographics`;

CREATE TABLE `participant_demographics` (
  `PDG_ID` varchar(36) NOT NULL,
  `PDG_SPT_ID` varchar(36) DEFAULT NULL,
  `PDG_GENDER_BIRTH` varchar(20) NOT NULL,
  `PDG_RACE` varchar(50) NOT NULL,
  `PDG_ETHNICITY` varchar(20) NOT NULL,
  `PDG_COH_STATUS` varchar(20) NOT NULL,
  `PDG_COH_STATUS_DT` datetime NOT NULL,
  `PDG_COUNTRY_BIRTH` varchar(2) NOT NULL,
  `PDG_REGION` varchar(100) NOT NULL,
  `PDG_RES_STATE` varchar(100) NOT NULL,
  `PDG_PRIM_INS` varchar(100) NOT NULL,
  `PDG_SEC_INS` varchar(100) NOT NULL,
  `PDG_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `PDG_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`PDG_ID`),
  KEY `PDG_SPT_FK` (`PDG_SPT_ID`),
  CONSTRAINT `PDG_SPT_FK` FOREIGN KEY (`PDG_SPT_ID`) REFERENCES `study_site_participants` (`spt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_demographics` */

/*Table structure for table `participant_discharge` */

DROP TABLE IF EXISTS `participant_discharge`;

CREATE TABLE `participant_discharge` (
  `PDC_ID` varchar(36) NOT NULL,
  `PDC_ECO_ID` varchar(36) NOT NULL,
  `PDC_EDC_PROVIDE` varchar(45) NOT NULL,
  `PDC_NOTE` varchar(200) NOT NULL,
  `PDC_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `PDC_LAST_CHANGE_DT` date NOT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`PDC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_discharge` */

/*Table structure for table `participant_encounter_vitals` */

DROP TABLE IF EXISTS `participant_encounter_vitals`;

CREATE TABLE `participant_encounter_vitals` (
  `PEV_ID` varchar(36) NOT NULL,
  `PEV_PEN_ID` varchar(36) DEFAULT NULL,
  `PEV_VTL_CODE` varchar(45) DEFAULT NULL,
  `PEV_VTL_VALUE` varchar(2000) DEFAULT NULL,
  `PEV_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `PEV_LAST_CHANGED_DT` datetime DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`PEV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_encounter_vitals` */

/*Table structure for table `participant_encounters` */

DROP TABLE IF EXISTS `participant_encounters`;

CREATE TABLE `participant_encounters` (
  `PEN_ID` varchar(36) NOT NULL,
  `PEN_SPT_ID` varchar(36) DEFAULT NULL,
  `PEN_ENC_SVE_ID` varchar(36) DEFAULT NULL,
  `PEN_EVENT_NAME` varchar(50) NOT NULL,
  `PEN_EVENT_UNSCH` varchar(20) DEFAULT NULL,
  `PEN_ENC_DT` date DEFAULT NULL,
  `PEN_ENC_REASON` varchar(200) DEFAULT NULL,
  `PEN_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `PEN_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`PEN_ID`),
  KEY `PEN_SPT_FK` (`PEN_SPT_ID`),
  CONSTRAINT `PEN_SPT_FK` FOREIGN KEY (`PEN_SPT_ID`) REFERENCES `study_site_participants` (`spt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_encounters` */

insert  into `participant_encounters`(`PEN_ID`,`PEN_SPT_ID`,`PEN_ENC_SVE_ID`,`PEN_EVENT_NAME`,`PEN_EVENT_UNSCH`,`PEN_ENC_DT`,`PEN_ENC_REASON`,`PEN_LAST_USR_ID`,`PEN_LAST_CHANGE_DT`,`record_status`) values ('7483f13f-9ef7-11e9-9de9-00059a3c7a00','7472679f-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:17',NULL),('7554ddee-9ef7-11e9-9de9-00059a3c7a00','75414918-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:18',NULL),('76108d58-9ef7-11e9-9de9-00059a3c7a00','7608ee34-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:19',NULL),('76fd2b81-9ef7-11e9-9de9-00059a3c7a00','76e03607-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:21',NULL),('77e719d9-9ef7-11e9-9de9-00059a3c7a00','77d7c40f-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:22',NULL),('791487dd-9ef7-11e9-9de9-00059a3c7a00','78f61004-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:24',NULL),('7ab6be21-9ef7-11e9-9de9-00059a3c7a00','7aab6c15-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'2019-03-20',NULL,NULL,'2019-07-05 13:05:27',NULL),('7abe60a3-9ef7-11e9-9de9-00059a3c7a00','7aab6c15-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','4 WEEK Visit',NULL,'2019-03-20',NULL,NULL,'2019-07-05 13:05:27',NULL),('7ac5ffdb-9ef7-11e9-9de9-00059a3c7a00','7aab6c15-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','8 WEEK Visit',NULL,'2019-04-16',NULL,NULL,'2019-07-05 13:05:27',NULL),('7bca22b9-9ef7-11e9-9de9-00059a3c7a00','7bb7b23a-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:29',NULL),('7bf73479-9ef7-11e9-9de9-00059a3c7a00','7bef95fa-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:29',NULL),('7cae5915-9ef7-11e9-9de9-00059a3c7a00','7ca6b7d5-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:30',NULL),('7d774311-9ef7-11e9-9de9-00059a3c7a00','7d651d42-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:32',NULL),('7e25724a-9ef7-11e9-9de9-00059a3c7a00','7e1dd241-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:33',NULL),('7eefa4a5-9ef7-11e9-9de9-00059a3c7a00','7ed77c9f-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:34',NULL),('7fb22f58-9ef7-11e9-9de9-00059a3c7a00','7fabd65b-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:35',NULL),('807e26d4-9ef7-11e9-9de9-00059a3c7a00','8076c914-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:37',NULL),('813b194c-9ef7-11e9-9de9-00059a3c7a00','81317cc0-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:38',NULL),('8200ccd1-9ef7-11e9-9de9-00059a3c7a00','81f7d3a7-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:39',NULL),('83173585-9ef7-11e9-9de9-00059a3c7a00','830bc27e-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:41',NULL),('83d0d6f1-9ef7-11e9-9de9-00059a3c7a00','83ca7c38-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:42',NULL),('848e474c-9ef7-11e9-9de9-00059a3c7a00','84842796-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:44',NULL),('857ea67f-9ef7-11e9-9de9-00059a3c7a00','85784994-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:45',NULL),('86ab9d26-9ef7-11e9-9de9-00059a3c7a00','86a5415e-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:47',NULL),('87494b6e-9ef7-11e9-9de9-00059a3c7a00','8742f0cf-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:48',NULL),('880d1cef-9ef7-11e9-9de9-00059a3c7a00','8806c623-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:49',NULL),('88feb632-9ef7-11e9-9de9-00059a3c7a00','88f85a8c-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:51',NULL),('8a1a468a-9ef7-11e9-9de9-00059a3c7a00','8a13edd5-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:53',NULL),('8acad20e-9ef7-11e9-9de9-00059a3c7a00','8ac32988-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:54',NULL),('8b93ef9b-9ef7-11e9-9de9-00059a3c7a00','8b8d9306-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:55',NULL),('8caf3bc9-9ef7-11e9-9de9-00059a3c7a00','8c9a4f39-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:57',NULL),('8d7c4223-9ef7-11e9-9de9-00059a3c7a00','8d735310-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:05:59',NULL),('8e7ce164-9ef7-11e9-9de9-00059a3c7a00','8e759129-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:00',NULL),('8f2266ca-9ef7-11e9-9de9-00059a3c7a00','8f11ab61-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:01',NULL),('8ff165ba-9ef7-11e9-9de9-00059a3c7a00','8fcb25c8-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:03',NULL),('90d4eeaf-9ef7-11e9-9de9-00059a3c7a00','90cd4cf3-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:04',NULL),('91ccf69b-9ef7-11e9-9de9-00059a3c7a00','91ab24fe-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:06',NULL),('927753b2-9ef7-11e9-9de9-00059a3c7a00','926fb141-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:07',NULL),('93355e47-9ef7-11e9-9de9-00059a3c7a00','932b35e8-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:08',NULL),('949d9694-9ef7-11e9-9de9-00059a3c7a00','94749595-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:11',NULL),('977f65f8-9ef7-11e9-9de9-00059a3c7a00','976d8b9a-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:15',NULL),('990a34cb-9ef7-11e9-9de9-00059a3c7a00','98f822ba-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:18',NULL),('9ab2af37-9ef7-11e9-9de9-00059a3c7a00','9a89598c-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:21',NULL),('9d450ac7-9ef7-11e9-9de9-00059a3c7a00','9d270c9c-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:25',NULL),('9e4ac45a-9ef7-11e9-9de9-00059a3c7a00','9e2d32b2-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:27',NULL),('9f1a037c-9ef7-11e9-9de9-00059a3c7a00','9f0f765a-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:28',NULL),('a051a1a6-9ef7-11e9-9de9-00059a3c7a00','a034f464-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:30',NULL),('a13a0fc3-9ef7-11e9-9de9-00059a3c7a00','a1220ea1-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:32',NULL),('a290484a-9ef7-11e9-9de9-00059a3c7a00','a27bfcde-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:34',NULL),('a366d14b-9ef7-11e9-9de9-00059a3c7a00','a35b632f-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:35',NULL),('a453a7d8-9ef7-11e9-9de9-00059a3c7a00','a44bb595-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:37',NULL),('a526bd75-9ef7-11e9-9de9-00059a3c7a00','a51c916d-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:38',NULL),('a62166a0-9ef7-11e9-9de9-00059a3c7a00','a6120350-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:40',NULL),('a6edd391-9ef7-11e9-9de9-00059a3c7a00','a6e631e6-9ef7-11e9-9de9-00059a3c7a00','4219daf2-8436-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'0000-00-00',NULL,NULL,'2019-07-05 13:06:41',NULL);

/*Table structure for table `participant_medication_history` */

DROP TABLE IF EXISTS `participant_medication_history`;

CREATE TABLE `participant_medication_history` (
  `PM_ID` varchar(36) NOT NULL,
  `PM_MEDICATION` varchar(100) DEFAULT NULL,
  `PM_DOSE` varchar(50) DEFAULT NULL,
  `PM_UNITS` varchar(5) DEFAULT NULL,
  `PM_FREQUENCY` varchar(45) DEFAULT NULL,
  `PM_FREQUENCY_IN` varchar(100) DEFAULT NULL,
  `PM_DOSE_FREQ` varchar(45) DEFAULT NULL,
  `PM_DOSE_STRENGTH` varchar(45) DEFAULT NULL,
  `PM_REASON_FOR_DISCONTI` varchar(45) DEFAULT NULL,
  `PM_DIAGNOSIS` varchar(45) DEFAULT NULL,
  `PM_PEN_ID` varchar(36) DEFAULT NULL,
  `PM_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `PM_LAST_CHANGE_DT` varchar(45) DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  `PM_DOC_START_DT` date DEFAULT NULL,
  `PM_DOC_END_DT` date DEFAULT NULL,
  `PM_MED_CODE` varchar(45) DEFAULT NULL,
  `PM_DRUG_DESC` varchar(45) DEFAULT NULL,
  `PM_DOSE_QUNTITY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PM_ID`),
  KEY `PM_PEN_ID_idx` (`PM_PEN_ID`),
  CONSTRAINT `PM_PEN_ID` FOREIGN KEY (`PM_PEN_ID`) REFERENCES `participant_encounters` (`pen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_medication_history` */

/*Table structure for table `participant_procedure_history` */

DROP TABLE IF EXISTS `participant_procedure_history`;

CREATE TABLE `participant_procedure_history` (
  `PPH_ID` varchar(36) NOT NULL,
  `PPH_NAME` varchar(100) DEFAULT NULL,
  `PPH_DAY` int(2) DEFAULT NULL,
  `PPH_MONTH` int(2) DEFAULT NULL,
  `PPH_YEAR` int(4) DEFAULT NULL,
  `PPH_DESCRIPTION` varchar(500) DEFAULT NULL,
  `PPH_LAST_USR_ID` varchar(45) DEFAULT NULL,
  `PPH_LAST_CHANGE_DT` datetime DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  `participantId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PPH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_procedure_history` */

insert  into `participant_procedure_history`(`PPH_ID`,`PPH_NAME`,`PPH_DAY`,`PPH_MONTH`,`PPH_YEAR`,`PPH_DESCRIPTION`,`PPH_LAST_USR_ID`,`PPH_LAST_CHANGE_DT`,`record_status`,`participantId`) values ('45f5b4b6-4709-11e9-b27b-94de801a2d16','S',5,6,2014,'X','79edc36e-843a-11e8-9538-00155d0a851b','2019-03-15 00:00:00',NULL,'f864664e-6bb7-23bc-8a3e-708360548990');

/*Table structure for table `participant_study_consents` */

DROP TABLE IF EXISTS `participant_study_consents`;

CREATE TABLE `participant_study_consents` (
  `PSC_ID` varchar(36) NOT NULL,
  `PSC_SPT_ID` varchar(36) DEFAULT NULL,
  `PSC_SCO_ID` varchar(36) DEFAULT NULL,
  `PSC_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `PSC_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PSC_CON_DT` varchar(40) DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`PSC_ID`),
  KEY `PSC_SPT_FK` (`PSC_SPT_ID`),
  CONSTRAINT `PSC_SPT_FK` FOREIGN KEY (`PSC_SPT_ID`) REFERENCES `study_site_participants` (`spt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_study_consents` */

/*Table structure for table `participants` */

DROP TABLE IF EXISTS `participants`;

CREATE TABLE `participants` (
  `PAT_ID` varchar(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `PAT_TNT_ID` varchar(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `PAT_FGC_ID` varchar(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `PAT_MRN` varchar(50) DEFAULT NULL,
  `PAT_PID` varchar(50) NOT NULL,
  `PAT_FNAME` varchar(200) NOT NULL,
  `PAT_MI` varchar(10) DEFAULT NULL,
  `PAT_LNAME` varchar(200) DEFAULT NULL,
  `PAT_GENDER_CURR` varchar(50) NOT NULL,
  `PAT_DOB` date DEFAULT NULL,
  `PAT_AGE` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `PAT_AGE_CRITERIA` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `PAT_PHONE` varchar(50) DEFAULT NULL,
  `PAT_RELATIONSHIP` varchar(20) DEFAULT NULL,
  `PAT_ADDRESS` varchar(500) DEFAULT NULL,
  `PAT_ADDRESS1` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `PAT_CITY` varchar(20) DEFAULT NULL,
  `PAT_STATE` varchar(20) DEFAULT NULL,
  `PAT_ZIPCODE` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `PAT_TB` varchar(10) DEFAULT NULL,
  `PAT_COUGH` varchar(10) DEFAULT NULL,
  `PAT_FILE_PATH` varchar(300) DEFAULT NULL,
  `PAT_STATUS` varchar(20) NOT NULL DEFAULT 'Active',
  `PAT_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `PAT_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  `PAT_PID_TEMP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participants` */

insert  into `participants`(`PAT_ID`,`PAT_TNT_ID`,`PAT_FGC_ID`,`PAT_MRN`,`PAT_PID`,`PAT_FNAME`,`PAT_MI`,`PAT_LNAME`,`PAT_GENDER_CURR`,`PAT_DOB`,`PAT_AGE`,`PAT_AGE_CRITERIA`,`PAT_PHONE`,`PAT_RELATIONSHIP`,`PAT_ADDRESS`,`PAT_ADDRESS1`,`PAT_CITY`,`PAT_STATE`,`PAT_ZIPCODE`,`PAT_TB`,`PAT_COUGH`,`PAT_FILE_PATH`,`PAT_STATUS`,`PAT_LAST_USR_ID`,`PAT_LAST_CHANGE_DT`,`record_status`,`PAT_PID_TEMP`) values ('7aa51117-9ef7-11e9-9de9-00059a3c7a00','cd0256d7-8439-11e8-9538-00155d0a851b','HEP 2','61101-8001996-2','ISL00001','Shakeela',NULL,NULL,'Female',NULL,'35','Adult','0333-5351031','Head of Household','C151, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,'2019-07-05 13:05:27',NULL,NULL),('a01ad891-9ef7-11e9-9de9-00059a3c7a00','cd0256d7-8439-11e8-9538-00155d0a851b','HEP 9','61101-8620705-3','ISL00002','Nazeer',NULL,NULL,'Male',NULL,'50','Adult','0300-9149794','Others','C.163 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,'2019-07-05 13:06:30',NULL,NULL);

/*Table structure for table `pid_counter_assignments` */

DROP TABLE IF EXISTS `pid_counter_assignments`;

CREATE TABLE `pid_counter_assignments` (
  `PCA_SRS_ID` varchar(36) NOT NULL,
  `PCA_PID_MIN` int(11) DEFAULT NULL,
  `PCA_PID_MAX` int(11) DEFAULT NULL,
  `PCA_PID_LAST` int(11) NOT NULL,
  `PCA_SPID_MIN` int(11) DEFAULT NULL,
  `PCA_SPID_MAX` int(11) DEFAULT NULL,
  `PCA_SPID_LAST` int(11) NOT NULL,
  `PCA_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`PCA_SRS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pid_counter_assignments` */

/*Table structure for table `question_library` */

DROP TABLE IF EXISTS `question_library`;

CREATE TABLE `question_library` (
  `QLY_ID` varchar(36) NOT NULL,
  `QLY_TNT_ID` varchar(36) DEFAULT NULL,
  `QLY_LIB_NAME` varchar(50) NOT NULL,
  `QLY_LIB_DESC` varchar(1000) NOT NULL,
  `QLY_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `QLY_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`QLY_ID`),
  UNIQUE KEY `QLY_TNT_LIB_NAME_UK` (`QLY_TNT_ID`,`QLY_LIB_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `question_library` */

/*Table structure for table `referrals` */

DROP TABLE IF EXISTS `referrals`;

CREATE TABLE `referrals` (
  `REF_ID` varchar(36) NOT NULL,
  `REF_CD` varchar(20) NOT NULL,
  `REF_NAMES` varchar(200) NOT NULL,
  `REF_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `REF_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`REF_ID`),
  UNIQUE KEY `REF_CD` (`REF_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `referrals` */

/*Table structure for table `reset_password` */

DROP TABLE IF EXISTS `reset_password`;

CREATE TABLE `reset_password` (
  `RSE_ID` varchar(36) NOT NULL,
  `RSE_USR_ID` varchar(36) DEFAULT NULL,
  `RSE_RESET_TOKEN` varchar(100) NOT NULL,
  `RSE_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`RSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reset_password` */

insert  into `reset_password`(`RSE_ID`,`RSE_USR_ID`,`RSE_RESET_TOKEN`,`RSE_LAST_CHANGE_DT`,`record_status`) values ('3c01ce2f-9987-11e9-b2c2-94de801a2d16','79edc3d8-843a-11e8-9538-00155d0a851b','U2FsdGVkX1+5+ACAQIjxC9lFMxuRRZjMZ3OTSdsDOIc=','2019-06-28 14:59:40',NULL),('45c76c5c-9987-11e9-b2c2-94de801a2d16','79edc442-843a-11e8-9538-00155d0a851b','U2FsdGVkX1+/IKv1yibfw5qMcJ3AAwhz14AF99WDAAo=','2019-06-28 14:59:52',NULL);

/*Table structure for table `screening` */

DROP TABLE IF EXISTS `screening`;

CREATE TABLE `screening` (
  `SCN_ID` varchar(36) NOT NULL,
  `SCN_FGC_ID` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `SCN_TNT_ID` varchar(36) DEFAULT NULL,
  `SCN_MRN` varchar(50) DEFAULT NULL,
  `SCN_FNAME` varchar(200) NOT NULL,
  `SCN_MI` varchar(10) DEFAULT NULL,
  `SCN_LNAME` varchar(200) DEFAULT NULL,
  `SCN_GENDER_CURR` varchar(50) NOT NULL,
  `SCN_DOB` date DEFAULT NULL,
  `SCN_AGE` varchar(10) DEFAULT NULL,
  `SCN_AGE_CRITERIA` varchar(20) DEFAULT NULL,
  `SCN_PHONE` varchar(50) DEFAULT NULL,
  `SCN_RELATIONSHIP` varchar(20) DEFAULT NULL,
  `SCN_ADDRESS` varchar(500) DEFAULT NULL,
  `SCN_ADDRESS1` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `SCN_CITY` varchar(20) DEFAULT NULL,
  `SCN_STATE` varchar(20) DEFAULT NULL,
  `SCN_ZIPCODE` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `SCN_TB` varchar(10) DEFAULT NULL,
  `SCN_COUGH` varchar(10) DEFAULT NULL,
  `SCN_FILE_PATH` varchar(300) DEFAULT NULL,
  `PARENT_SCN_ID` varchar(36) DEFAULT NULL,
  `SCN_SCREEN_DT` date DEFAULT NULL,
  `SCN_SCREEN_STATUS` varchar(20) DEFAULT NULL,
  `SCN_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `SCN_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`SCN_ID`),
  KEY `SCN_LAST_USR_FK` (`SCN_LAST_USR_ID`),
  CONSTRAINT `SCN_LAST_USR_FK` FOREIGN KEY (`SCN_LAST_USR_ID`) REFERENCES `users` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `screening` */

insert  into `screening`(`SCN_ID`,`SCN_FGC_ID`,`SCN_TNT_ID`,`SCN_MRN`,`SCN_FNAME`,`SCN_MI`,`SCN_LNAME`,`SCN_GENDER_CURR`,`SCN_DOB`,`SCN_AGE`,`SCN_AGE_CRITERIA`,`SCN_PHONE`,`SCN_RELATIONSHIP`,`SCN_ADDRESS`,`SCN_ADDRESS1`,`SCN_CITY`,`SCN_STATE`,`SCN_ZIPCODE`,`SCN_TB`,`SCN_COUGH`,`SCN_FILE_PATH`,`PARENT_SCN_ID`,`SCN_SCREEN_DT`,`SCN_SCREEN_STATUS`,`SCN_LAST_USR_ID`,`SCN_LAST_CHANGE_DT`,`record_status`) values ('745d76be-9ef7-11e9-9de9-00059a3c7a00','HEP 1','cd0256d7-8439-11e8-9538-00155d0a851b','61101-7119866-8','Anwar',NULL,NULL,'Male',NULL,'47','Adult','0322-8589728','Head of Household','S75, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:16',NULL),('7534998c-9ef7-11e9-9de9-00059a3c7a00','HEP 1','cd0256d7-8439-11e8-9538-00155d0a851b','61101-7119866-8','Shameem Anwar',NULL,NULL,'Female',NULL,'47','Adult','0300-5518534','Wife','S75, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:18',NULL),('75fda62b-9ef7-11e9-9de9-00059a3c7a00','HEP 1','cd0256d7-8439-11e8-9538-00155d0a851b','61101-7119866-8','Patras',NULL,NULL,'Male',NULL,'43','Adult','0300-5518534','Brother','S75, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:19',NULL),('76c2a536-9ef7-11e9-9de9-00059a3c7a00','HEP 1','cd0256d7-8439-11e8-9538-00155d0a851b','37406-17181722-6','Mukhtar Bibi',NULL,NULL,'Female',NULL,'45','Adult','0345-5103075','Sister in law','S75, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:20',NULL),('77d0287d-9ef7-11e9-9de9-00059a3c7a00','HEP 1','cd0256d7-8439-11e8-9538-00155d0a851b','37406-17181722-6','Shamoon',NULL,NULL,'Male',NULL,'40','Adult','0345-5103075','Brother','S75, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:22',NULL),('78e7c304-9ef7-11e9-9de9-00059a3c7a00','HEP 1','cd0256d7-8439-11e8-9538-00155d0a851b','61101-8476525-0','Samina Shamoon ',NULL,NULL,'Female',NULL,'27','Adult','0322-8589728','Sister in law','S75, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:24',NULL),('7a980c68-9ef7-11e9-9de9-00059a3c7a00','HEP 2','cd0256d7-8439-11e8-9538-00155d0a851b','61101-8001996-2','Shakeela',NULL,NULL,'Female',NULL,'35','Adult','0333-5351031','Head of Household','C151, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-20','Enrolled',NULL,'2019-07-05 13:05:27',NULL),('7b9ea031-9ef7-11e9-9de9-00059a3c7a00','HEP 2','cd0256d7-8439-11e8-9538-00155d0a851b','','Nadeem',NULL,NULL,'Male',NULL,'35','Adult','0333-5351031','Husband','C151, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:29',NULL),('7be800bd-9ef7-11e9-9de9-00059a3c7a00','HEP 2','cd0256d7-8439-11e8-9538-00155d0a851b','61101-8001996-2','Shehnaz',NULL,NULL,'Female',NULL,'36','Adult','0333-5351031','Sister in law','C151, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:29',NULL),('7c9f27c4-9ef7-11e9-9de9-00059a3c7a00','HEP 2','cd0256d7-8439-11e8-9538-00155d0a851b','61101-4242514-5','Shaziya',NULL,NULL,'Female',NULL,'38','Adult','0333-5351031','Sister in law','C151, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:30',NULL),('7d526cc1-9ef7-11e9-9de9-00059a3c7a00','HEP 2','cd0256d7-8439-11e8-9538-00155d0a851b','61101-4242514-5','Shafeeq',NULL,NULL,'Male',NULL,'32','Adult','0333-5351031','Brother','C151, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:31',NULL),('7e1129b7-9ef7-11e9-9de9-00059a3c7a00','HEP 2','cd0256d7-8439-11e8-9538-00155d0a851b','61101-4242514-5','Mehwish',NULL,NULL,'Female',NULL,'21','Adult','0333-5351899','Daughter','C151, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:33',NULL),('7ecea04f-9ef7-11e9-9de9-00059a3c7a00','HEP 2','cd0256d7-8439-11e8-9538-00155d0a851b','61101-8001996-2','Lubna',NULL,NULL,'Female',NULL,'32','Adult','0333-5351031','Sister in law','C151, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:34',NULL),('7fa439b7-9ef7-11e9-9de9-00059a3c7a00','HEP 2','cd0256d7-8439-11e8-9538-00155d0a851b','61101-7070566-7','Shahbaz',NULL,NULL,'Male',NULL,'34','Adult','0333-5351031','Others','C151, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:35',NULL),('805a6365-9ef7-11e9-9de9-00059a3c7a00','HEP 2','cd0256d7-8439-11e8-9538-00155d0a851b','61101-2193208-0','Parveen',NULL,NULL,'Female',NULL,'64','Adult','0333-5351899','Others','C151, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:37',NULL),('81289c6a-9ef7-11e9-9de9-00059a3c7a00','HEP 3','cd0256d7-8439-11e8-9538-00155d0a851b','61101-3002750-1','Shaam',NULL,NULL,'Male',NULL,'21','Adult','0340-0030551','Son','C74, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:38',NULL),('81effd3a-9ef7-11e9-9de9-00059a3c7a00','HEP 3','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1771103-7','Kiran',NULL,NULL,'Female',NULL,'19','Adult','0340-0030551','Daughter','C74, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:39',NULL),('82ff109c-9ef7-11e9-9de9-00059a3c7a00','HEP 3','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1771103-7','Venus',NULL,NULL,'Female',NULL,'45','Adult','0340-0030551','Wife','C74, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:41',NULL),('83c39433-9ef7-11e9-9de9-00059a3c7a00','HEP 3','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1771103-7','Patras',NULL,NULL,'Male',NULL,'53','Adult','0340-0030551','Head of Household','C74, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:42',NULL),('847dd112-9ef7-11e9-9de9-00059a3c7a00','HEP 3','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1870135-7','Liaquat',NULL,NULL,'Male',NULL,'49','Adult','0334-5295491','Brother','C74, F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:43',NULL),('8571f86c-9ef7-11e9-9de9-00059a3c7a00','HEP 4','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1834884-1','Allah Dita',NULL,NULL,'Male',NULL,'87','Adult','0300-5500244','Father',' C72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:45',NULL),('869ef475-9ef7-11e9-9de9-00059a3c7a00','HEP 4','cd0256d7-8439-11e8-9538-00155d0a851b','61101-5696698-4','Shama',NULL,NULL,'Female',NULL,'37','Adult','0300-5500244','Wife',' C72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:47',NULL),('873ca368-9ef7-11e9-9de9-00059a3c7a00','HEP 4','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1834884-1','Waseem',NULL,NULL,'Male',NULL,'39','Adult','0300-5500244','Brother',' C72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:48',NULL),('87fcaa1d-9ef7-11e9-9de9-00059a3c7a00','HEP 4','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1834884-1','Ludhia',NULL,NULL,'Female',NULL,'35','Adult','0300-5500244','Sister in law',' C72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:49',NULL),('88e5530e-9ef7-11e9-9de9-00059a3c7a00','HEP 4','cd0256d7-8439-11e8-9538-00155d0a851b','61101-7972991-3','Nadeem',NULL,NULL,'Male',NULL,'40','Adult','0300-5500244','Head of Household',' C72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:51',NULL),('8a08877c-9ef7-11e9-9de9-00059a3c7a00','HEP 5','cd0256d7-8439-11e8-9538-00155d0a851b','61101-7972991-3','Aneela',NULL,NULL,'Female',NULL,'45','Adult','0300-5500244','Wife','S72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:53',NULL),('8aba5dbd-9ef7-11e9-9de9-00059a3c7a00','HEP 5','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1638765-7','Shery',NULL,NULL,'Male',NULL,'22','Adult','0312-5449033','Son','S.72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:54',NULL),('8b8744ed-9ef7-11e9-9de9-00059a3c7a00','HEP 5','cd0256d7-8439-11e8-9538-00155d0a851b','61101-9621156-7','Nindia',NULL,NULL,'Female',NULL,'19','Adult','0307-5540294','Others','S.72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:55',NULL),('8c818f66-9ef7-11e9-9de9-00059a3c7a00','HEP 5','cd0256d7-8439-11e8-9538-00155d0a851b','61101-9621156-7','Shakeel ',NULL,NULL,'Male',NULL,'50','Adult','0307-5540294','Head of Household','S.72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:57',NULL),('8d6a3c49-9ef7-11e9-9de9-00059a3c7a00','HEP 6','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1926276-3','Rafeeq',NULL,NULL,'Male',NULL,'45','Adult','0316-5466396','Head of Household','S.72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:05:58',NULL),('8e68917d-9ef7-11e9-9de9-00059a3c7a00','HEP 6','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1563453-8','Razia',NULL,NULL,'Female',NULL,'42','Adult','0316-5466396','Wife','S.72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:00',NULL),('8f0b562c-9ef7-11e9-9de9-00059a3c7a00','HEP 6','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1563453-8','Sahar',NULL,NULL,'Female',NULL,'19','Adult','0316-5466396','Daughter','S.72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:01',NULL),('8fbea8a5-9ef7-11e9-9de9-00059a3c7a00','HEP 7','cd0256d7-8439-11e8-9538-00155d0a851b','61101-0743881-7','Rasheed',NULL,NULL,'Male',NULL,'56','Adult','0302-8902534','Head of Household','S.72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:02',NULL),('90c5b9d9-9ef7-11e9-9de9-00059a3c7a00','HEP 7','cd0256d7-8439-11e8-9538-00155d0a851b','61101-0743881-7','Naseem ',NULL,NULL,'Female',NULL,'45','Adult','0302-8902534','Wife','S.72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:04',NULL),('919e08ae-9ef7-11e9-9de9-00059a3c7a00','HEP 7','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1563453-8','Faiz',NULL,NULL,'Male',NULL,'26','Adult','0302-8902534','Son','S.72 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:06',NULL),('9264df38-9ef7-11e9-9de9-00059a3c7a00','HEP 8','cd0256d7-8439-11e8-9538-00155d0a851b','','Naseem ',NULL,NULL,'Male',NULL,'48','Adult','0311-9573704','Head of Household','C.163 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:07',NULL),('931fda2f-9ef7-11e9-9de9-00059a3c7a00','HEP 8','cd0256d7-8439-11e8-9538-00155d0a851b','','Riffat',NULL,NULL,'Female',NULL,'38','Adult','0311-9573704','Wife','C.163 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:08',NULL),('9459e1bf-9ef7-11e9-9de9-00059a3c7a00','HEP 8','cd0256d7-8439-11e8-9538-00155d0a851b','','Areej',NULL,NULL,'Female',NULL,'20','Adult','0311-9573704','Daughter','C.163 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:10',NULL),('97588b31-9ef7-11e9-9de9-00059a3c7a00','HEP 9','cd0256d7-8439-11e8-9538-00155d0a851b','61101-8794409-5','Saleem',NULL,NULL,'Male',NULL,'48','Adult','0349-0563851','Head of Household','C175 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:15',NULL),('98d06868-9ef7-11e9-9de9-00059a3c7a00','HEP 9','cd0256d7-8439-11e8-9538-00155d0a851b','61101-4210802-0','Shala',NULL,NULL,'Female',NULL,'47','Adult','0349-0563851','Wife','C175 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:18',NULL),('9a77bf91-9ef7-11e9-9de9-00059a3c7a00','HEP 9','cd0256d7-8439-11e8-9538-00155d0a851b','61101-8620705-3','Sahar',NULL,NULL,'Female',NULL,'19','Adult','0349-0563851','Daughter','C.163 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:20',NULL),('9d0aed1d-9ef7-11e9-9de9-00059a3c7a00','HEP 9','cd0256d7-8439-11e8-9538-00155d0a851b','61101-7196122-5','Mari',NULL,NULL,'Female',NULL,'23','Adult','0315-5663528','Others','C.163 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:25',NULL),('9e207060-9ef7-11e9-9de9-00059a3c7a00','HEP 9','cd0256d7-8439-11e8-9538-00155d0a851b','','Sahi',NULL,NULL,'Male',NULL,'26','Adult','0315-5663528','Son','C.163 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:26',NULL),('9f07dd2c-9ef7-11e9-9de9-00059a3c7a00','HEP 9','cd0256d7-8439-11e8-9538-00155d0a851b','61101-7196122-5','Zorab',NULL,NULL,'Male',NULL,'20','Adult','0315-5663528','Son','C.163 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:28',NULL),('9ff72c58-9ef7-11e9-9de9-00059a3c7a00','HEP 9','cd0256d7-8439-11e8-9538-00155d0a851b','61101-8620705-3','Nazeer',NULL,NULL,'Male',NULL,'50','Adult','0300-9149794','Others','C.163 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','Enrolled',NULL,'2019-07-05 13:06:30',NULL),('a11a7a98-9ef7-11e9-9de9-00059a3c7a00','HEP 10','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1199863-5','Saleem ',NULL,NULL,'Male',NULL,'50','Adult','0301-5125781','Head of Household','C.162 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:31',NULL),('a272b8e8-9ef7-11e9-9de9-00059a3c7a00','HEP 10','cd0256d7-8439-11e8-9538-00155d0a851b','61101-1199863-5','Saria',NULL,NULL,'Female',NULL,'45','Adult','0301-5125781','Wife','C.162 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:34',NULL),('a34ae046-9ef7-11e9-9de9-00059a3c7a00','HEP 10','cd0256d7-8439-11e8-9538-00155d0a851b','61101-6595102-9','Kiran ',NULL,NULL,'Female',NULL,'27','Adult','0340-5421707','Daughter','C.162 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:35',NULL),('a441981d-9ef7-11e9-9de9-00059a3c7a00','HEP 10','cd0256d7-8439-11e8-9538-00155d0a851b','61101-6595102-9','Nadeem',NULL,NULL,'Male',NULL,'24','Adult','0311-9606395','Son','C.162 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:37',NULL),('a513b6d3-9ef7-11e9-9de9-00059a3c7a00','HEP 10','cd0256d7-8439-11e8-9538-00155d0a851b','61101-6595102-9','Arslan',NULL,NULL,'Male',NULL,'21','Adult','0311-9606395','Son','C.162 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:38',NULL),('a6004aff-9ef7-11e9-9de9-00059a3c7a00','HEP 10','cd0256d7-8439-11e8-9538-00155d0a851b','61101-6595102-9','Insha',NULL,NULL,'Female',NULL,'19','Adult','0340-5421707','Daughter','C.162 F/C','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:40',NULL),('a6dea19e-9ef7-11e9-9de9-00059a3c7a00','HEP 10','cd0256d7-8439-11e8-9538-00155d0a851b','61101-6595102-9','Dilawar',NULL,NULL,'Male',NULL,'29','Adult','0311-9606395','Others','C.162 F/C ','France Colony ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','In Progress',NULL,'2019-07-05 13:06:41',NULL);

/*Table structure for table `site_registered_studies` */

DROP TABLE IF EXISTS `site_registered_studies`;

CREATE TABLE `site_registered_studies` (
  `SRS_ID` varchar(36) NOT NULL,
  `SRS_STU_ID` varchar(36) DEFAULT NULL,
  `SRS_SVE_ID` varchar(36) DEFAULT NULL,
  `SRS_SIT_ID` varchar(36) DEFAULT NULL,
  `SRS_REG_DATE` date NOT NULL,
  `SRS_REG_CURRENT` varchar(1) NOT NULL,
  `SRS_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `SRS_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`SRS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `site_registered_studies` */

insert  into `site_registered_studies`(`SRS_ID`,`SRS_STU_ID`,`SRS_SVE_ID`,`SRS_SIT_ID`,`SRS_REG_DATE`,`SRS_REG_CURRENT`,`SRS_LAST_USR_ID`,`SRS_LAST_CHANGE_DT`,`record_status`) values ('d01f2d16-8433-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','4219daf2-8436-11e8-9538-00155d0a851b','2bed6776-8434-11e8-9538-00155d0a851b','2017-10-01','Y','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:48',NULL);

/*Table structure for table `sites` */

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `SIT_ID` varchar(36) NOT NULL,
  `SIT_TNT_ID` varchar(36) DEFAULT NULL,
  `SIT_SITE_NAME` varchar(200) NOT NULL,
  `SIT_STATUS` varchar(20) NOT NULL DEFAULT 'Active',
  `SIT_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `SIT_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`SIT_ID`),
  KEY `SIT_LAST_USR_FK` (`SIT_LAST_USR_ID`),
  CONSTRAINT `SIT_LAST_USR_FK` FOREIGN KEY (`SIT_LAST_USR_ID`) REFERENCES `users` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sites` */

insert  into `sites`(`SIT_ID`,`SIT_TNT_ID`,`SIT_SITE_NAME`,`SIT_STATUS`,`SIT_LAST_USR_ID`,`SIT_LAST_CHANGE_DT`,`record_status`) values ('2bed6776-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Islamabad University','Active','79edc223-843a-11e8-9538-00155d0a851b','2019-06-24 14:47:00',NULL);

/*Table structure for table `specimen_tracking` */

DROP TABLE IF EXISTS `specimen_tracking`;

CREATE TABLE `specimen_tracking` (
  `id` varchar(40) NOT NULL,
  `spe_site_id` varchar(36) NOT NULL,
  `specimen_date` datetime NOT NULL,
  `specimen_number` varchar(50) NOT NULL,
  `specimen_sent_to` varchar(100) DEFAULT NULL,
  `lab_result_date` datetime DEFAULT NULL,
  `specimen_type` varchar(50) NOT NULL,
  `participant` varchar(40) NOT NULL,
  `encounter` varchar(40) NOT NULL,
  `comments` text,
  `record_status` char(1) DEFAULT NULL,
  `ST_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `spe_site_id_idx` (`spe_site_id`),
  CONSTRAINT `spe_site_id_idx` FOREIGN KEY (`spe_site_id`) REFERENCES `sites` (`sit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `specimen_tracking` */

insert  into `specimen_tracking`(`id`,`spe_site_id`,`specimen_date`,`specimen_number`,`specimen_sent_to`,`lab_result_date`,`specimen_type`,`participant`,`encounter`,`comments`,`record_status`,`ST_LAST_CHANGE_DT`) values ('0adac00a-99af-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','2019-06-28 00:00:00','123456','Rays','2019-06-28 00:00:00','Sonu','3358c678-98ab-11e9-947e-94de801a2d16','339b083f-98ab-11e9-947e-94de801a2d16','Rays',NULL,'2019-06-28 19:44:29'),('3ad84e6b-9357-11e9-9803-94de801a2d16','2bed6776-8434-11e8-9538-00155d0a851b','2019-06-20 00:00:00','01','LAB','2019-06-20 00:00:00','Blood','60b051d6-9354-11e9-9803-94de801a2d16','60d28cf9-9354-11e9-9803-94de801a2d16',NULL,NULL,'2019-06-20 18:00:41'),('4eae6d70-98ca-11e9-947e-94de801a2d16','2bed6776-8434-11e8-9538-00155d0a851b','2019-06-27 00:00:00','number1','sent','2019-06-27 00:00:00','typ1','2f93cbce-98ab-11e9-947e-94de801a2d16','8 WEEK Visit','test',NULL,'2019-06-28 18:48:15'),('5b65fac5-98b7-11e9-947e-94de801a2d16','2bed6776-8434-11e8-9538-00155d0a851b','2019-06-27 00:00:00','number',NULL,NULL,'specimen ','18332bf9-98ab-11e9-947e-94de801a2d16','183b0378-98ab-11e9-947e-94de801a2d16',NULL,NULL,'2019-06-27 14:11:33'),('7ebf6fa3-98c9-11e9-947e-94de801a2d16','2bed6776-8434-11e8-9538-00155d0a851b','2019-06-28 00:00:00','123456','ssss','2019-06-28 00:00:00','ssss','18332bf9-98ab-11e9-947e-94de801a2d16','183b0378-98ab-11e9-947e-94de801a2d16','ssss',NULL,'2019-06-28 19:52:25'),('84173828-9d98-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','2019-07-03 00:00:00','123456','Sonu','2019-07-03 00:00:00','Sonu','050f8d21-9d87-11e9-9de9-00059a3c7a00','052c5013-9d87-11e9-9de9-00059a3c7a00','Sonu1',NULL,'2019-07-03 19:13:21'),('ce0d347a-9990-11e9-b2c2-94de801a2d16','2bed6776-8434-11e8-9538-00155d0a851b','2019-06-28 00:00:00','k','cv','2019-06-28 00:00:00','c','27aaff3e-98ab-11e9-947e-94de801a2d16','27b159d3-98ab-11e9-947e-94de801a2d16','c',NULL,'2019-06-28 16:08:06'),('e27aaf2b-9bf7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','2019-07-01 00:00:00','sss','sss','2019-07-01 00:00:00','sss','011ed751-9bc1-11e9-9de9-00059a3c7a00','0126c380-9bc1-11e9-9de9-00059a3c7a00','sss',NULL,'2019-07-01 18:53:12');

/*Table structure for table `studies` */

DROP TABLE IF EXISTS `studies`;

CREATE TABLE `studies` (
  `STU_ID` varchar(36) NOT NULL,
  `STU_TNT_ID` varchar(36) DEFAULT NULL,
  `STU_DISPLAY_TXT` varchar(200) NOT NULL,
  `STU_TITLE` varchar(200) NOT NULL,
  `STU_STATUS` varchar(20) NOT NULL DEFAULT 'Active',
  `STU_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `STU_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`STU_ID`),
  KEY `STU_LAST_USR_FK` (`STU_LAST_USR_ID`),
  CONSTRAINT `STU_LAST_USR_FK` FOREIGN KEY (`STU_LAST_USR_ID`) REFERENCES `users` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `studies` */

insert  into `studies`(`STU_ID`,`STU_TNT_ID`,`STU_DISPLAY_TXT`,`STU_TITLE`,`STU_STATUS`,`STU_LAST_USR_ID`,`STU_LAST_CHANGE_DT`,`record_status`) values ('654ec9a2-8434-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','Hepatitis C bye bye','Hepatitis C study','Active','79edc223-843a-11e8-9538-00155d0a851b','2019-03-27 11:27:15',NULL);

/*Table structure for table `study_consents` */

DROP TABLE IF EXISTS `study_consents`;

CREATE TABLE `study_consents` (
  `SCO_ID` varchar(36) NOT NULL,
  `SCO_STU_ID` varchar(36) DEFAULT NULL,
  `SCO_VER_TXT` varchar(10) NOT NULL,
  `SCO_CONSENT_URL` varchar(500) NOT NULL,
  `SCO_STATUS` varchar(20) NOT NULL DEFAULT 'Active',
  `SCO_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `SCO_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`SCO_ID`),
  KEY `SCO_LAST_USR_FK` (`SCO_LAST_USR_ID`),
  CONSTRAINT `SCO_LAST_USR_FK` FOREIGN KEY (`SCO_LAST_USR_ID`) REFERENCES `users` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_consents` */

insert  into `study_consents`(`SCO_ID`,`SCO_STU_ID`,`SCO_VER_TXT`,`SCO_CONSENT_URL`,`SCO_STATUS`,`SCO_LAST_USR_ID`,`SCO_LAST_CHANGE_DT`,`record_status`) values ('00502a31-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','1.0','/documentlibrary/1/5/3/2/consent/1.pdf','Active','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:49',NULL);

/*Table structure for table `study_event_steps` */

DROP TABLE IF EXISTS `study_event_steps`;

CREATE TABLE `study_event_steps` (
  `SVS_ID` varchar(36) NOT NULL,
  `SVS_STU_ID` varchar(36) DEFAULT NULL,
  `SVS_EVENT_NAME` varchar(50) NOT NULL,
  `SVS_GROUP_NAME` varchar(50) DEFAULT NULL,
  `SVS_STEP_CD` varchar(20) DEFAULT NULL,
  `SVS_GROUP_ID` varchar(36) DEFAULT NULL,
  `SVS_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `SVS_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SVS_DISPLAY_ORDER` int(11) DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`SVS_ID`),
  KEY `SVS_STEP_FK` (`SVS_STEP_CD`),
  KEY `SVS_LAST_USR_FK` (`SVS_LAST_USR_ID`),
  CONSTRAINT `SVS_LAST_USR_FK` FOREIGN KEY (`SVS_LAST_USR_ID`) REFERENCES `users` (`usr_id`),
  CONSTRAINT `SVS_STEP_FK` FOREIGN KEY (`SVS_STEP_CD`) REFERENCES `data_capture_steps` (`dcs_step_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_event_steps` */

insert  into `study_event_steps`(`SVS_ID`,`SVS_STU_ID`,`SVS_EVENT_NAME`,`SVS_GROUP_NAME`,`SVS_STEP_CD`,`SVS_GROUP_ID`,`SVS_LAST_USR_ID`,`SVS_LAST_CHANGE_DT`,`SVS_DISPLAY_ORDER`,`record_status`) values ('351cfcfb-8b69-11e9-bad0-00059a3c7a00','654ec9a2-8434-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'DEM',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 20:01:42',2,NULL),('35be0ca3-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','20 WEEK Visit',NULL,'PHY_EX',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:51:54',2,NULL),('35f54ac4-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','20 WEEK Visit',NULL,'DSCHG_20',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:51:55',3,NULL),('46f98745-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'SCN_ENC',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:48:22',1,NULL),('46f98821-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'ELIG',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 20:01:51',4,NULL),('46f98903-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'LAB',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 14:54:52',7,NULL),('46f9896c-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'ENROLL',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 20:02:06',5,NULL),('46f989d5-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','4 WEEK Visit',NULL,'ENC',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:49:36',1,NULL),('46f98fb7-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','4 WEEK Visit',NULL,'PHY_EX',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:49:37',2,NULL),('46f99086-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','4 WEEK Visit',NULL,'DSCHG_4',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:49:40',3,NULL),('46f990ef-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','8 WEEK Visit',NULL,'ENC',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:50:19',1,NULL),('46f99295-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','8 WEEK Visit',NULL,'PHY_EX',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:50:20',2,NULL),('46f99364-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','8 WEEK Visit',NULL,'DSCHG_8',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:50:23',3,NULL),('46f993cb-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','12 WEEK Visit',NULL,'ENC',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:50:50',1,NULL),('46f9949d-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','12 WEEK Visit',NULL,'TRT_RES',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:50:51',4,NULL),('46f99570-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','12 WEEK Visit',NULL,'PHY_EX',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:50:52',5,NULL),('46f9964a-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','12 WEEK Visit',NULL,'DSCHG_12',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:50:53',6,NULL),('46f996b5-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','16 WEEK Visit',NULL,'ENC',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:51:22',1,NULL),('46f9986a-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','16 WEEK Visit',NULL,'PHY_EX',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:51:22',2,NULL),('46f99949-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','16 WEEK Visit',NULL,'DSCHG_16',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:51:25',3,NULL),('6a35e70a-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','24 WEEK Visit',NULL,'ENC',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:19',1,NULL),('6a4683ff-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','24 WEEK Visit',NULL,'LAB',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:20',3,NULL),('6a5aa9d5-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','24 WEEK Visit',NULL,'PHY_EX',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:21',5,NULL),('6a747667-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','24 WEEK Visit',NULL,'TRT_RES',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:22',4,NULL),('7d23688b-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','36 WEEK Visit',NULL,'ENC',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:49',1,NULL),('7d36d7a1-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','36 WEEK Visit',NULL,'LAB',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:50',3,NULL),('7d55e49b-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','36 WEEK Visit',NULL,'PHY_EX',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:51',5,NULL),('7d725e6f-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','36 WEEK Visit',NULL,'TRT_RES',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:52',4,NULL),('7d8be008-4f01-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','36 WEEK Visit',NULL,'DSCHG_36',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:53',6,NULL),('865a3b8b-4f00-11e9-83a3-00059a3c7800','654ec9a2-8434-11e8-9538-00155d0a851b','20 WEEK Visit',NULL,'ENC',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:51:58',1,NULL),('a40a9a44-8b67-11e9-bad0-00059a3c7a00','654ec9a2-8434-11e8-9538-00155d0a851b','36 WEEK Visit',NULL,'DR_BLO_NOW',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:56',2,NULL),('ad039aa5-8b66-11e9-bad0-00059a3c7a00','654ec9a2-8434-11e8-9538-00155d0a851b','24 WEEK Visit',NULL,'DR_BLO_NOW',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:23',2,NULL),('c7070f7a-8b65-11e9-bad0-00059a3c7a00','654ec9a2-8434-11e8-9538-00155d0a851b','12 WEEK Visit',NULL,'DR_BLO_NOW',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:50:54',2,NULL),('ccac527f-9e3d-11e9-9de9-00059a3c7a00','654ec9a2-8434-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'RIS_FAC',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 20:01:47',3,NULL),('d278ad46-8b65-11e9-bad0-00059a3c7a00','654ec9a2-8434-11e8-9538-00155d0a851b','12 WEEK Visit',NULL,'LAB',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:50:57',3,NULL),('d5b4c465-8b67-11e9-bad0-00059a3c7a00','654ec9a2-8434-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'DR_BLO_NOW',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 14:54:55',6,NULL),('d86d50d2-8b67-11e9-bad0-00059a3c7a00','654ec9a2-8434-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'PHY_EX',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 14:54:49',8,NULL),('dbc66799-8b67-11e9-bad0-00059a3c7a00','654ec9a2-8434-11e8-9538-00155d0a851b','Day 0 Visit',NULL,'DSCHG',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-07-04 14:54:43',9,NULL),('e3d03264-8b66-11e9-bad0-00059a3c7a00','654ec9a2-8434-11e8-9538-00155d0a851b','24 WEEK Visit',NULL,'DSCHG_24',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2019-06-14 11:52:25',6,NULL);

/*Table structure for table `study_events` */

DROP TABLE IF EXISTS `study_events`;

CREATE TABLE `study_events` (
  `SEV_ID` varchar(36) NOT NULL,
  `SEV_STU_ID` varchar(36) DEFAULT NULL,
  `SEV_EVENT_NAME` varchar(50) NOT NULL,
  `SEV_SHORT_CD` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `SEV_EVENT_ORDER` int(11) NOT NULL,
  `SEV_DURATION` int(11) NOT NULL,
  `SEV_UNIT_DURATION` varchar(20) NOT NULL,
  `SEV_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `SEV_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`SEV_ID`),
  UNIQUE KEY `SEV_STU_SHORT_UK` (`SEV_STU_ID`,`SEV_SHORT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_events` */

insert  into `study_events`(`SEV_ID`,`SEV_STU_ID`,`SEV_EVENT_NAME`,`SEV_SHORT_CD`,`SEV_EVENT_ORDER`,`SEV_DURATION`,`SEV_UNIT_DURATION`,`SEV_LAST_USR_ID`,`SEV_LAST_CHANGE_DT`,`record_status`) values ('10535a80-416f-11e9-b27b-94de801a2d16','654ec9a2-8434-11e8-9538-00155d0a851b','36 WEEK Visit','W36',8,0,'Months','79edc223-843a-11e8-9538-00155d0a851b','2019-06-17 12:36:26',NULL),('579d308e-40e3-11e9-b27b-94de801a2d16','654ec9a2-8434-11e8-9538-00155d0a851b','20 WEEK Visit','W20',6,0,'Months','79edc223-843a-11e8-9538-00155d0a851b','2019-06-17 12:36:30',NULL),('5b2c539b-40e3-11e9-b27b-94de801a2d16','654ec9a2-8434-11e8-9538-00155d0a851b','24 WEEK Visit','W24',7,0,'Months','79edc223-843a-11e8-9538-00155d0a851b','2019-06-17 12:36:35',NULL),('7e3b6951-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','Day 0 Visit','0',1,0,'Months','79edc223-843a-11e8-9538-00155d0a851b','2019-06-21 16:09:00',NULL),('7e3b6b16-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','4 WEEK Visit','W4',2,0,'Months','79edc223-843a-11e8-9538-00155d0a851b','2019-06-17 12:36:38',NULL),('7e3b6b97-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','8 WEEK Visit','W8',3,0,'Months','79edc223-843a-11e8-9538-00155d0a851b','2019-06-17 12:36:42',NULL),('7e3b6c02-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','12 WEEK Visit','W12',4,0,'Months','79edc223-843a-11e8-9538-00155d0a851b','2019-06-17 12:36:48',NULL),('7e3b6c6d-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','16 WEEK Visit','W16',5,0,'Months','79edc223-843a-11e8-9538-00155d0a851b','2019-06-17 12:36:56',NULL),('7e3b6cd8-8435-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','UnScheduled','U',9,0,'Months','79edc223-843a-11e8-9538-00155d0a851b','2019-03-08 20:01:59',NULL);

/*Table structure for table `study_site_participants` */

DROP TABLE IF EXISTS `study_site_participants`;

CREATE TABLE `study_site_participants` (
  `SPT_ID` varchar(36) NOT NULL,
  `SPT_PAT_ID` varchar(36) DEFAULT NULL,
  `SPT_SCN_ID` varchar(36) DEFAULT NULL,
  `SPT_SIT_ID` varchar(36) DEFAULT NULL,
  `SPT_STU_ID` varchar(36) DEFAULT NULL,
  `SPT_SPID` varchar(20) DEFAULT NULL,
  `SPT_ENROLL_DT` date DEFAULT NULL,
  `SPT_ENROLL_STATUS` varchar(50) NOT NULL,
  `SPT_ENROLL_STATUS_DT` date DEFAULT NULL,
  `SPT_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `SPT_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  `CREATED_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  `SPT_SPID_TEMP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SPT_ID`),
  KEY `SPT_SIT_FK` (`SPT_SIT_ID`),
  KEY `SPT_STU_FK` (`SPT_STU_ID`),
  KEY `SPT_LAST_USR_FK` (`SPT_LAST_USR_ID`),
  KEY `SPT_PAT_FK_idx` (`SPT_PAT_ID`),
  CONSTRAINT `SPT_LAST_USR_FK` FOREIGN KEY (`SPT_LAST_USR_ID`) REFERENCES `users` (`usr_id`),
  CONSTRAINT `SPT_PAT_FK` FOREIGN KEY (`SPT_PAT_ID`) REFERENCES `participants` (`PAT_ID`),
  CONSTRAINT `SPT_SIT_FK` FOREIGN KEY (`SPT_SIT_ID`) REFERENCES `sites` (`sit_id`),
  CONSTRAINT `SPT_STU_FK` FOREIGN KEY (`SPT_STU_ID`) REFERENCES `studies` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_site_participants` */

insert  into `study_site_participants`(`SPT_ID`,`SPT_PAT_ID`,`SPT_SCN_ID`,`SPT_SIT_ID`,`SPT_STU_ID`,`SPT_SPID`,`SPT_ENROLL_DT`,`SPT_ENROLL_STATUS`,`SPT_ENROLL_STATUS_DT`,`SPT_LAST_USR_ID`,`SPT_LAST_CHANGE_DT`,`record_status`,`CREATED_DT`,`SPT_SPID_TEMP`) values ('7472679f-9ef7-11e9-9de9-00059a3c7a00',NULL,'745d76be-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:17',NULL,'2019-07-05 13:05:17',NULL),('75414918-9ef7-11e9-9de9-00059a3c7a00',NULL,'7534998c-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:18',NULL,'2019-07-05 13:05:18',NULL),('7608ee34-9ef7-11e9-9de9-00059a3c7a00',NULL,'75fda62b-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:19',NULL,'2019-07-05 13:05:19',NULL),('76e03607-9ef7-11e9-9de9-00059a3c7a00',NULL,'76c2a536-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:21',NULL,'2019-07-05 13:05:21',NULL),('77d7c40f-9ef7-11e9-9de9-00059a3c7a00',NULL,'77d0287d-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:22',NULL,'2019-07-05 13:05:22',NULL),('78f61004-9ef7-11e9-9de9-00059a3c7a00',NULL,'78e7c304-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:24',NULL,'2019-07-05 13:05:24',NULL),('7aab6c15-9ef7-11e9-9de9-00059a3c7a00','7aa51117-9ef7-11e9-9de9-00059a3c7a00','7a980c68-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','ISL00001','2019-03-20','Enrolled',NULL,NULL,'2019-07-05 13:05:27',NULL,'2019-07-05 13:05:27',NULL),('7bb7b23a-9ef7-11e9-9de9-00059a3c7a00',NULL,'7b9ea031-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:29',NULL,'2019-07-05 13:05:29',NULL),('7bef95fa-9ef7-11e9-9de9-00059a3c7a00',NULL,'7be800bd-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:29',NULL,'2019-07-05 13:05:29',NULL),('7ca6b7d5-9ef7-11e9-9de9-00059a3c7a00',NULL,'7c9f27c4-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:30',NULL,'2019-07-05 13:05:30',NULL),('7d651d42-9ef7-11e9-9de9-00059a3c7a00',NULL,'7d526cc1-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:32',NULL,'2019-07-05 13:05:32',NULL),('7e1dd241-9ef7-11e9-9de9-00059a3c7a00',NULL,'7e1129b7-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:33',NULL,'2019-07-05 13:05:33',NULL),('7ed77c9f-9ef7-11e9-9de9-00059a3c7a00',NULL,'7ecea04f-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:34',NULL,'2019-07-05 13:05:34',NULL),('7fabd65b-9ef7-11e9-9de9-00059a3c7a00',NULL,'7fa439b7-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:35',NULL,'2019-07-05 13:05:35',NULL),('8076c914-9ef7-11e9-9de9-00059a3c7a00',NULL,'805a6365-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:37',NULL,'2019-07-05 13:05:37',NULL),('81317cc0-9ef7-11e9-9de9-00059a3c7a00',NULL,'81289c6a-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:38',NULL,'2019-07-05 13:05:38',NULL),('81f7d3a7-9ef7-11e9-9de9-00059a3c7a00',NULL,'81effd3a-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:39',NULL,'2019-07-05 13:05:39',NULL),('830bc27e-9ef7-11e9-9de9-00059a3c7a00',NULL,'82ff109c-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:41',NULL,'2019-07-05 13:05:41',NULL),('83ca7c38-9ef7-11e9-9de9-00059a3c7a00',NULL,'83c39433-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:42',NULL,'2019-07-05 13:05:42',NULL),('84842796-9ef7-11e9-9de9-00059a3c7a00',NULL,'847dd112-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:44',NULL,'2019-07-05 13:05:44',NULL),('85784994-9ef7-11e9-9de9-00059a3c7a00',NULL,'8571f86c-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:45',NULL,'2019-07-05 13:05:45',NULL),('86a5415e-9ef7-11e9-9de9-00059a3c7a00',NULL,'869ef475-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:47',NULL,'2019-07-05 13:05:47',NULL),('8742f0cf-9ef7-11e9-9de9-00059a3c7a00',NULL,'873ca368-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:48',NULL,'2019-07-05 13:05:48',NULL),('8806c623-9ef7-11e9-9de9-00059a3c7a00',NULL,'87fcaa1d-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:49',NULL,'2019-07-05 13:05:49',NULL),('88f85a8c-9ef7-11e9-9de9-00059a3c7a00',NULL,'88e5530e-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:51',NULL,'2019-07-05 13:05:51',NULL),('8a13edd5-9ef7-11e9-9de9-00059a3c7a00',NULL,'8a08877c-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:53',NULL,'2019-07-05 13:05:53',NULL),('8ac32988-9ef7-11e9-9de9-00059a3c7a00',NULL,'8aba5dbd-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:54',NULL,'2019-07-05 13:05:54',NULL),('8b8d9306-9ef7-11e9-9de9-00059a3c7a00',NULL,'8b8744ed-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:55',NULL,'2019-07-05 13:05:55',NULL),('8c9a4f39-9ef7-11e9-9de9-00059a3c7a00',NULL,'8c818f66-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:57',NULL,'2019-07-05 13:05:57',NULL),('8d735310-9ef7-11e9-9de9-00059a3c7a00',NULL,'8d6a3c49-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:05:59',NULL,'2019-07-05 13:05:59',NULL),('8e759129-9ef7-11e9-9de9-00059a3c7a00',NULL,'8e68917d-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:00',NULL,'2019-07-05 13:06:00',NULL),('8f11ab61-9ef7-11e9-9de9-00059a3c7a00',NULL,'8f0b562c-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:01',NULL,'2019-07-05 13:06:01',NULL),('8fcb25c8-9ef7-11e9-9de9-00059a3c7a00',NULL,'8fbea8a5-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:02',NULL,'2019-07-05 13:06:02',NULL),('90cd4cf3-9ef7-11e9-9de9-00059a3c7a00',NULL,'90c5b9d9-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:04',NULL,'2019-07-05 13:06:04',NULL),('91ab24fe-9ef7-11e9-9de9-00059a3c7a00',NULL,'919e08ae-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:06',NULL,'2019-07-05 13:06:06',NULL),('926fb141-9ef7-11e9-9de9-00059a3c7a00',NULL,'9264df38-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:07',NULL,'2019-07-05 13:06:07',NULL),('932b35e8-9ef7-11e9-9de9-00059a3c7a00',NULL,'931fda2f-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:08',NULL,'2019-07-05 13:06:08',NULL),('94749595-9ef7-11e9-9de9-00059a3c7a00',NULL,'9459e1bf-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:10',NULL,'2019-07-05 13:06:10',NULL),('976d8b9a-9ef7-11e9-9de9-00059a3c7a00',NULL,'97588b31-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:15',NULL,'2019-07-05 13:06:15',NULL),('98f822ba-9ef7-11e9-9de9-00059a3c7a00',NULL,'98d06868-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:18',NULL,'2019-07-05 13:06:18',NULL),('9a89598c-9ef7-11e9-9de9-00059a3c7a00',NULL,'9a77bf91-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:20',NULL,'2019-07-05 13:06:20',NULL),('9d270c9c-9ef7-11e9-9de9-00059a3c7a00',NULL,'9d0aed1d-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:25',NULL,'2019-07-05 13:06:25',NULL),('9e2d32b2-9ef7-11e9-9de9-00059a3c7a00',NULL,'9e207060-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:27',NULL,'2019-07-05 13:06:27',NULL),('9f0f765a-9ef7-11e9-9de9-00059a3c7a00',NULL,'9f07dd2c-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:28',NULL,'2019-07-05 13:06:28',NULL),('a034f464-9ef7-11e9-9de9-00059a3c7a00','a01ad891-9ef7-11e9-9de9-00059a3c7a00','9ff72c58-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','ISL00002','0000-00-00','Enrolled',NULL,NULL,'2019-07-05 13:06:30',NULL,'2019-07-05 13:06:30',NULL),('a1220ea1-9ef7-11e9-9de9-00059a3c7a00',NULL,'a11a7a98-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:32',NULL,'2019-07-05 13:06:32',NULL),('a27bfcde-9ef7-11e9-9de9-00059a3c7a00',NULL,'a272b8e8-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:34',NULL,'2019-07-05 13:06:34',NULL),('a35b632f-9ef7-11e9-9de9-00059a3c7a00',NULL,'a34ae046-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:35',NULL,'2019-07-05 13:06:35',NULL),('a44bb595-9ef7-11e9-9de9-00059a3c7a00',NULL,'a441981d-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:37',NULL,'2019-07-05 13:06:37',NULL),('a51c916d-9ef7-11e9-9de9-00059a3c7a00',NULL,'a513b6d3-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:38',NULL,'2019-07-05 13:06:38',NULL),('a6120350-9ef7-11e9-9de9-00059a3c7a00',NULL,'a6004aff-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:40',NULL,'2019-07-05 13:06:40',NULL),('a6e631e6-9ef7-11e9-9de9-00059a3c7a00',NULL,'a6dea19e-9ef7-11e9-9de9-00059a3c7a00','2bed6776-8434-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b',NULL,'0000-00-00','In Progress',NULL,NULL,'2019-07-05 13:06:41',NULL,'2019-07-05 13:06:41',NULL);

/*Table structure for table `study_versions` */

DROP TABLE IF EXISTS `study_versions`;

CREATE TABLE `study_versions` (
  `SVE_ID` varchar(36) NOT NULL,
  `SVE_STU_ID` varchar(36) DEFAULT NULL,
  `SVE_VER_TXT` varchar(10) NOT NULL,
  `SVE_STATUS` varchar(20) NOT NULL DEFAULT 'Active',
  `SVE_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `SVE_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`SVE_ID`),
  KEY `SVE_LAST_USR_FK` (`SVE_LAST_USR_ID`),
  CONSTRAINT `SVE_LAST_USR_FK` FOREIGN KEY (`SVE_LAST_USR_ID`) REFERENCES `users` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_versions` */

insert  into `study_versions`(`SVE_ID`,`SVE_STU_ID`,`SVE_VER_TXT`,`SVE_STATUS`,`SVE_LAST_USR_ID`,`SVE_LAST_CHANGE_DT`,`record_status`) values ('4219daf2-8436-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','1.0','Active','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL);

/*Table structure for table `sync_database` */

DROP TABLE IF EXISTS `sync_database`;

CREATE TABLE `sync_database` (
  `SYN_ID` varchar(36) NOT NULL,
  `DEVICEID` varchar(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`SYN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sync_database` */

insert  into `sync_database`(`SYN_ID`,`DEVICEID`,`LAST_UPDATED_DATE`) values ('283a362c-5b78-11e9-83a3-00059a3c7800','9fb3fe3d1f0d500d','2019-06-24 19:50:41'),('2b59bb21-cba3-11e8-870a-0e98f40a3ca0','172560a01795ba3c','2019-07-05 12:37:00'),('2f7aec01-cc69-11e8-870a-0e98f40a3ca0','2953662c36ae04fd','2018-10-10 08:47:57');

/*Table structure for table `tenant_addresses` */

DROP TABLE IF EXISTS `tenant_addresses`;

CREATE TABLE `tenant_addresses` (
  `TAD_ID` varchar(36) NOT NULL,
  `TAD_TNT_ID` varchar(36) DEFAULT NULL,
  `TAD_URL` varchar(500) NOT NULL,
  `TAD_TYPE` varchar(20) NOT NULL,
  `TAD_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `TAD_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`TAD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenant_addresses` */

insert  into `tenant_addresses`(`TAD_ID`,`TAD_TNT_ID`,`TAD_URL`,`TAD_TYPE`,`TAD_LAST_USR_ID`,`TAD_LAST_CHANGE_DT`,`record_status`) values ('7c29c973-8436-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','http://localhost:4200','PRIMARY','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL);

/*Table structure for table `tenant_medications` */

DROP TABLE IF EXISTS `tenant_medications`;

CREATE TABLE `tenant_medications` (
  `TME_ID` varchar(36) NOT NULL,
  `TME_TNT_ID` varchar(36) DEFAULT NULL,
  `TME_MED_CD` varchar(20) NOT NULL,
  `TME_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `TME_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`TME_ID`),
  UNIQUE KEY `TME_MED_CD` (`TME_MED_CD`),
  CONSTRAINT `TME_MED_CD_FK` FOREIGN KEY (`TME_MED_CD`) REFERENCES `medications` (`med_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenant_medications` */

/*Table structure for table `tenant_referrals` */

DROP TABLE IF EXISTS `tenant_referrals`;

CREATE TABLE `tenant_referrals` (
  `TRE_ID` varchar(36) NOT NULL,
  `TRE_TNT_ID` varchar(36) DEFAULT NULL,
  `TRE_REF_CD` varchar(20) NOT NULL,
  `TRE_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `TRE_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`TRE_ID`),
  UNIQUE KEY `TRE_REF_CD` (`TRE_REF_CD`),
  CONSTRAINT `TRE_REF_CD_FK` FOREIGN KEY (`TRE_REF_CD`) REFERENCES `referrals` (`ref_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenant_referrals` */

/*Table structure for table `tenant_sites` */

DROP TABLE IF EXISTS `tenant_sites`;

CREATE TABLE `tenant_sites` (
  `TSI_ID` varchar(36) NOT NULL,
  `TSI_TNT_ID` varchar(36) DEFAULT NULL,
  `TSI_SIT_ID` varchar(36) DEFAULT NULL,
  `TSI_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `TSI_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`TSI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenant_sites` */

insert  into `tenant_sites`(`TSI_ID`,`TSI_TNT_ID`,`TSI_SIT_ID`,`TSI_LAST_USR_ID`,`TSI_LAST_CHANGE_DT`,`record_status`) values ('33eced30-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','2bed6776-8434-11e8-9538-00155d0a851b','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL);

/*Table structure for table `tenant_steps` */

DROP TABLE IF EXISTS `tenant_steps`;

CREATE TABLE `tenant_steps` (
  `TSE_ID` varchar(36) NOT NULL,
  `TSE_TNT_ID` varchar(36) DEFAULT NULL,
  `TSE_STEP_CD` varchar(20) NOT NULL,
  `TSE_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `TSE_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`TSE_ID`),
  KEY `TSE_STEP_FK` (`TSE_STEP_CD`),
  CONSTRAINT `TSE_STEP_FK` FOREIGN KEY (`TSE_STEP_CD`) REFERENCES `data_capture_steps` (`dcs_step_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenant_steps` */

insert  into `tenant_steps`(`TSE_ID`,`TSE_TNT_ID`,`TSE_STEP_CD`,`TSE_LAST_USR_ID`,`TSE_LAST_CHANGE_DT`,`record_status`) values ('767c2702-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','SCN_ENC','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c27d6-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','ELIG','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2844-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','ORD','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c28aa-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','LAB','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c290f-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','ENROLL','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2972-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','ENC','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c29d6-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','DEM','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2a3a-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','DIS_CHA','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2aa9-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','SOC_FAC','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2b0d-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','RIS_FAC','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2b70-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','DIS_HIS','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2bd4-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','COMORB','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2c35-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','MED_HIS','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2c98-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','PRO_HIS','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2cfb-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','SYS_REV','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2d5f-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','CLI_IMP','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2dce-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','VIT','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2e36-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','PHY_EX','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL),('767c2e9d-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','DSCHG','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL);

/*Table structure for table `tenant_studies` */

DROP TABLE IF EXISTS `tenant_studies`;

CREATE TABLE `tenant_studies` (
  `TST_ID` varchar(36) NOT NULL,
  `TST_TNT_ID` varchar(36) DEFAULT NULL,
  `TST_STU_ID` varchar(36) DEFAULT NULL,
  `TST_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `TST_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`TST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenant_studies` */

insert  into `tenant_studies`(`TST_ID`,`TST_TNT_ID`,`TST_STU_ID`,`TST_LAST_USR_ID`,`TST_LAST_CHANGE_DT`,`record_status`) values ('d6efd11a-8438-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','654ec9a2-8434-11e8-9538-00155d0a851b','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:50',NULL);

/*Table structure for table `tenant_tests` */

DROP TABLE IF EXISTS `tenant_tests`;

CREATE TABLE `tenant_tests` (
  `TTE_ID` varchar(36) NOT NULL,
  `TTE_TNT_ID` varchar(36) DEFAULT NULL,
  `TTE_TEST_CD` varchar(20) NOT NULL,
  `TTE_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `TTE_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`TTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenant_tests` */

/*Table structure for table `tenant_users` */

DROP TABLE IF EXISTS `tenant_users`;

CREATE TABLE `tenant_users` (
  `TUS_ID` varchar(36) NOT NULL,
  `TUS_TNT_ID` varchar(36) DEFAULT NULL,
  `TUS_USR_ID` varchar(36) DEFAULT NULL,
  `TUS_LAST_LOGIN_DT` datetime DEFAULT NULL,
  `TUS_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `TUS_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`TUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenant_users` */

insert  into `tenant_users`(`TUS_ID`,`TUS_TNT_ID`,`TUS_USR_ID`,`TUS_LAST_LOGIN_DT`,`TUS_LAST_USR_ID`,`TUS_LAST_CHANGE_DT`,`record_status`) values ('17a7ce80-c31c-11e8-88c1-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','17a5ddcf-c31c-11e8-88c1-00155d0a851b','2018-09-28 18:13:47','79edc223-843a-11e8-9538-00155d0a851b','2018-09-28 18:13:47',NULL),('1bbd64ea-9be2-11e9-9de9-00059a3c7a00','cd0256d7-8439-11e8-9538-00155d0a851b','1bae3264-9be2-11e9-9de9-00059a3c7a00','2019-07-01 14:55:00','79edc2fd-843a-11e8-9538-00155d0a851b','2019-07-01 14:55:00',NULL),('2730f024-996d-11e9-b2c2-94de801a2d16','cd0256d7-8439-11e8-9538-00155d0a851b','2724061a-996d-11e9-b2c2-94de801a2d16','2019-06-28 11:52:54','79edc2fd-843a-11e8-9538-00155d0a851b','2019-06-28 11:52:54',NULL),('2a480e13-c31c-11e8-88c1-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','2a43d4da-c31c-11e8-88c1-00155d0a851b','2018-09-28 18:14:18','79edc223-843a-11e8-9538-00155d0a851b','2018-09-28 18:14:18',NULL),('54a0d4a1-c17f-11e8-88c1-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','549d06bb-c17f-11e8-88c1-00155d0a851b','2018-09-26 16:59:03','79edc223-843a-11e8-9538-00155d0a851b','2018-09-26 16:59:03',NULL),('824e141a-9be4-11e9-9de9-00059a3c7a00','cd0256d7-8439-11e8-9538-00155d0a851b','824225d6-9be4-11e9-9de9-00059a3c7a00','2019-07-01 15:12:11','79edc2fd-843a-11e8-9538-00155d0a851b','2019-07-01 15:12:11',NULL),('88c34837-9cbf-11e9-9de9-00059a3c7a00','cd0256d7-8439-11e8-9538-00155d0a851b','88b73d2a-9cbf-11e9-9de9-00059a3c7a00','2019-07-02 17:20:00','79edc2fd-843a-11e8-9538-00155d0a851b','2019-07-02 17:20:00',NULL),('8a091aa9-8439-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','79edc223-843a-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-16 12:53:21',NULL),('8a091b7f-8439-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','79edc2fd-843a-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-16 12:53:21',NULL),('8a091be8-8439-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','79edc36e-843a-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-16 12:53:21',NULL),('8a091c4e-8439-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','79edc3d8-843a-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-16 12:53:21',NULL),('8a091cb4-8439-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','79edc442-843a-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-16 12:53:21',NULL),('8a091d1a-8439-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','79edc4ad-843a-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-16 12:53:21',NULL),('8a091d80-8439-11e8-9538-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','79edc518-843a-11e8-9538-00155d0a851b',NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-07-16 12:53:21',NULL),('bc5a86ae-13d7-11e9-870a-0e98f40a3ca0','cd0256d7-8439-11e8-9538-00155d0a851b','bc5a1641-13d7-11e9-870a-0e98f40a3ca0','2019-01-09 06:28:11','79edc36e-843a-11e8-9538-00155d0a851b','2019-01-09 06:28:11',NULL),('bde168bb-9ca1-11e9-9de9-00059a3c7a00','cd0256d7-8439-11e8-9538-00155d0a851b','bdcbea2c-9ca1-11e9-9de9-00059a3c7a00','2019-07-02 13:46:45','79edc2fd-843a-11e8-9538-00155d0a851b','2019-07-02 13:46:45',NULL),('df90e415-9cb7-11e9-9de9-00059a3c7a00','cd0256d7-8439-11e8-9538-00155d0a851b','df87e65c-9cb7-11e9-9de9-00059a3c7a00','2019-07-02 16:25:10','79edc2fd-843a-11e8-9538-00155d0a851b','2019-07-02 16:25:10',NULL),('e91edfcc-9ca0-11e9-9de9-00059a3c7a00','cd0256d7-8439-11e8-9538-00155d0a851b','e91575db-9ca0-11e9-9de9-00059a3c7a00','2019-07-02 13:40:48','79edc2fd-843a-11e8-9538-00155d0a851b','2019-07-02 13:40:48',NULL),('f403fb00-c31b-11e8-88c1-00155d0a851b','cd0256d7-8439-11e8-9538-00155d0a851b','f3fcac1a-c31b-11e8-88c1-00155d0a851b','2018-09-28 18:12:47','79edc223-843a-11e8-9538-00155d0a851b','2018-09-28 18:12:47',NULL);

/*Table structure for table `tenants` */

DROP TABLE IF EXISTS `tenants`;

CREATE TABLE `tenants` (
  `TNT_ID` varchar(36) NOT NULL,
  `TNT_DISPLAY_TXT` varchar(100) NOT NULL,
  `TNT_AVR_ID` varchar(36) DEFAULT NULL,
  `TNT_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`TNT_ID`),
  UNIQUE KEY `TNT_DISPLAY_TXT` (`TNT_DISPLAY_TXT`),
  KEY `TNT_AVR_FK_idx` (`TNT_AVR_ID`),
  CONSTRAINT `TNT_AVR_FK` FOREIGN KEY (`TNT_AVR_ID`) REFERENCES `app_versions` (`avr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tenants` */

insert  into `tenants`(`TNT_ID`,`TNT_DISPLAY_TXT`,`TNT_AVR_ID`,`TNT_LAST_CHANGE_DT`,`record_status`) values ('cd0256d7-8439-11e8-9538-00155d0a851b','GVN Hep C for Regional Institute of Medical Sciences, Imphal','291887a5-8428-11e8-9538-00155d0a851b','2018-07-11 17:34:06',NULL);

/*Table structure for table `tests` */

DROP TABLE IF EXISTS `tests`;

CREATE TABLE `tests` (
  `TES_ID` varchar(36) NOT NULL,
  `TES_TEST_CD` varchar(20) NOT NULL,
  `TES_TEST_NAMES` varchar(200) NOT NULL,
  `TES_STATUS` varchar(20) NOT NULL,
  `TES_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `TES_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`TES_ID`),
  UNIQUE KEY `TES_TEST_CD` (`TES_TEST_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tests` */

insert  into `tests`(`TES_ID`,`TES_TEST_CD`,`TES_TEST_NAMES`,`TES_STATUS`,`TES_LAST_USR_ID`,`TES_LAST_CHANGE_DT`,`record_status`) values ('fffbca84-8439-11e8-9538-00155d0a851b','ANT BODY','HEP C ANTIBODY TEST','Active','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:51',NULL),('fffbcb46-8439-11e8-9538-00155d0a851b','RNA QLT','HEP C RNA QUALITATIVE TEST','Active','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:51',NULL),('fffbcbb5-8439-11e8-9538-00155d0a851b','RNA QTN','HEP C RNA QUANTITATIVE TEST','Active','79edc223-843a-11e8-9538-00155d0a851b','2018-07-11 18:06:51',NULL);

/*Table structure for table `unit_of_measurements` */

DROP TABLE IF EXISTS `unit_of_measurements`;

CREATE TABLE `unit_of_measurements` (
  `UOM_ID` varchar(36) NOT NULL,
  `UOM_UNIT` varchar(2000) DEFAULT NULL,
  `UOM_DESCRIPTION` varchar(2000) DEFAULT NULL,
  `UOM_BASE_UOM` int(11) DEFAULT NULL COMMENT 'Parent Uinit of Self Table',
  `UOM_CONVERSION_FACTOR` double DEFAULT NULL,
  `UOM_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `UOM_LAST_CHANGED_DT` datetime DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`UOM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `unit_of_measurements` */

insert  into `unit_of_measurements`(`UOM_ID`,`UOM_UNIT`,`UOM_DESCRIPTION`,`UOM_BASE_UOM`,`UOM_CONVERSION_FACTOR`,`UOM_LAST_USR_ID`,`UOM_LAST_CHANGED_DT`,`record_status`) values ('3f4b0f0d-843a-11e8-9538-00155d0a851b','ml','Mili Litre',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-31 00:00:00',NULL),('3f4b1057-843a-11e8-9538-00155d0a851b','Micro ml','Micro Mili Litre',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-31 00:00:00',NULL),('46735c76-90ba-11e8-b999-00155d0a851b','C','Temparture',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-31 00:00:00',NULL),('4c341713-90ba-11e8-b999-00155d0a851b','F','Temparture',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-31 00:00:00',NULL),('51c5a567-9ed6-11e8-827d-00155d0a851b','IU/L','IU/L',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-13 14:27:00',NULL),('545561c6-90ba-11e8-b999-00155d0a851b','in','Height',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-31 00:00:00',NULL),('57b0d6bb-90ba-11e8-b999-00155d0a851b','cm','Height',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-31 00:00:00',NULL),('5b923693-90ba-11e8-b999-00155d0a851b','kg','Weight',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-31 00:00:00',NULL),('5e9e32cb-90ba-11e8-b999-00155d0a851b','lbs','Weight',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-05-31 00:00:00',NULL),('878f723c-9ed9-11e8-827d-00155d0a851b','mg/dL','mg/dL',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-13 00:00:00',NULL),('a06f5d41-9ed9-11e8-827d-00155d0a851b','g/dL','g/dL',NULL,NULL,'79edc223-843a-11e8-9538-00155d0a851b','2018-08-13 00:00:00',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `USR_ID` varchar(36) NOT NULL,
  `USR_UNAME` varchar(20) NOT NULL,
  `USR_PASSWORD` varchar(50) NOT NULL,
  `USR_DISPLAY_TXT` varchar(100) NOT NULL,
  `USR_EMAIL` varchar(100) NOT NULL,
  `USR_TYPE` varchar(20) NOT NULL,
  `USR_STATUS` varchar(20) NOT NULL DEFAULT 'Active',
  `USR_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `USR_LAST_CHANGE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USR_ATTEMPT` int(10) NOT NULL DEFAULT '0',
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`USR_ID`),
  UNIQUE KEY `USR_UNAME` (`USR_UNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`USR_ID`,`USR_UNAME`,`USR_PASSWORD`,`USR_DISPLAY_TXT`,`USR_EMAIL`,`USR_TYPE`,`USR_STATUS`,`USR_LAST_USR_ID`,`USR_LAST_CHANGE_DT`,`USR_ATTEMPT`,`record_status`) values ('17a5ddcf-c31c-11e8-88c1-00155d0a851b','Hectretab2','3688d9a2465cd74a2b6f2eaeee4e4a4d43a182d7','Hectre Tabs','hectre.tab2@gmail.com','Application','Active',NULL,'2019-07-02 17:15:01',0,NULL),('1bae3264-9be2-11e9-9de9-00059a3c7a00','ssharma','bd62f472f1d51f2a014c31ea48179d17c492f59f','Sonu Sharma','ssharma.26095@gmail.com','Application','Active',NULL,'2019-07-02 17:18:28',0,NULL),('1de675a9-9f0d-11e9-9de9-00059a3c7a00','Bita1','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Bita User','bita@gmail.com','Application','Active',NULL,'2019-07-05 15:44:17',0,NULL),('2724061a-996d-11e9-b2c2-94de801a2d16','Sonu','72456ca49ab8a17d1aeb32c4fd86f7f702b992b3','Tablet Test','ssharma@raystechserv.com','Enterprise','Active',NULL,'2019-06-28 11:52:54',0,NULL),('2a43d4da-c31c-11e8-88c1-00155d0a851b','Hectretab3','b706525f1ba1a6d90acf81d12464c59ff95f6360','Hectre Tabt','hectre.tab3@gmail.com','Application','Active',NULL,'2018-09-28 18:15:08',0,NULL),('3235c81e-9f0d-11e9-9de9-00059a3c7a00','bita2','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Bita User','bita@gmail.com','Application','Active',NULL,'2019-07-05 15:44:17',0,NULL),('4a717557-9f0d-11e9-9de9-00059a3c7a00','bita3','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Bita User','bita@gmail.com','Application','Active',NULL,'2019-07-05 15:44:18',0,NULL),('549d06bb-c17f-11e8-88c1-00155d0a851b','Dchauhan','532c1cbe25de3f60c605dbdf65aca0a514eb8252','Dipika Chauhan','dchauhan@gmail.com','Application','Active',NULL,'2018-09-28 14:36:46',0,NULL),('5dd615a9-9f0d-11e9-9de9-00059a3c7a00','bita4','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Bita User','bita@gmail.com','Application','Active',NULL,'2019-07-05 15:44:19',0,NULL),('7369540d-9f0d-11e9-9de9-00059a3c7a00','bita5','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Bita User','bita@gmail.com','Application','Active',NULL,'2019-07-05 15:44:22',0,NULL),('79edc223-843a-11e8-9538-00155d0a851b','sa','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Sys A','a@abc.com','PERSON','Active',NULL,'2019-06-24 15:37:33',0,NULL),('79edc2fd-843a-11e8-9538-00155d0a851b','demo','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Guest','dipika27.official@gmail.com','PERSON','Active',NULL,'2019-07-05 16:00:16',0,NULL),('79edc36e-843a-11e8-9538-00155d0a851b','pmathur','21071096a1678c6e0ac7a48e349afd630d40deaf','Poonam Mathur','pmathur@ihv.umaryland.edu','PERSON','Active',NULL,'2019-07-04 18:16:20',0,NULL),('79edc3d8-843a-11e8-9538-00155d0a851b','aabutaleb','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Ameer Abutaleb','a@abc.com','PERSON','Active',NULL,'2019-07-02 11:44:29',0,NULL),('79edc442-843a-11e8-9538-00155d0a851b','hsmith','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Howard Smith','a@abc.com','PERSON','Active',NULL,'2019-06-28 15:02:00',0,NULL),('79edc4ad-843a-11e8-9538-00155d0a851b','skottilil','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Shyam Kottilil','a@abc.com','PERSON','Active',NULL,'2018-07-10 17:42:43',0,NULL),('79edc518-843a-11e8-9538-00155d0a851b','nmercer','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Natalia Mercer','a@abc.com','PERSON','Active',NULL,'2018-07-10 17:42:43',0,NULL),('824225d6-9be4-11e9-9de9-00059a3c7a00','Sharma','bd62f472f1d51f2a014c31ea48179d17c492f59f','zcx z','demo@gmail.vom','Enterprise','Active',NULL,'2019-07-01 15:12:11',0,NULL),('88b73d2a-9cbf-11e9-9de9-00059a3c7a00','mpatel','8afa88bb735c7401b5b1f044422106bf1da0177e','Milap Patel','demo@gmail.com','Enterprise','Active',NULL,'2019-07-02 17:20:00',0,NULL),('bc5a1641-13d7-11e9-870a-0e98f40a3ca0','cgross','21071096a1678c6e0ac7a48e349afd630d40deaf','Chloe Gross','cgross@ihv.umaryland.edu','Application','Active',NULL,'2019-01-09 06:28:31',0,NULL),('bdcbea2c-9ca1-11e9-9de9-00059a3c7a00','vgodliya','8afa88bb735c7401b5b1f044422106bf1da0177e','Varun Godliya','demo@gmail.com','Enterprise','Active',NULL,'2019-07-02 13:46:45',0,NULL),('df87e65c-9cb7-11e9-9de9-00059a3c7a00','vdave','8afa88bb735c7401b5b1f044422106bf1da0177e','Vishal Dave','demo@gmail.com','Enterprise','Inactive',NULL,'2019-07-02 16:25:10',0,NULL),('e91575db-9ca0-11e9-9de9-00059a3c7a00','SONUSHARMA','8afa88bb735c7401b5b1f044422106bf1da0177e','Tablet Test','demo@gmail.com','Enterprise','Active',NULL,'2019-07-02 13:40:48',0,NULL),('f3fcac1a-c31b-11e8-88c1-00155d0a851b','Hectretab1','6c878eaad09b86b27852f3fabc94fe3aeb54c2c6','Hectre Tabf','hectre.tab1@gmail.com','Application','Active',NULL,'2018-10-01 15:37:41',0,NULL);

/*Table structure for table `vitals` */

DROP TABLE IF EXISTS `vitals`;

CREATE TABLE `vitals` (
  `VTL_ID` varchar(36) NOT NULL,
  `VTL_CODE` varchar(45) DEFAULT NULL,
  `VTL_DISPLAY_TEXT` varchar(250) DEFAULT NULL,
  `VTL_UOM_ID` varchar(36) DEFAULT NULL,
  `VTL_DISPLAY_ORDER` int(11) DEFAULT NULL,
  `VTL_LAST_USR_ID` varchar(36) DEFAULT NULL,
  `VTL_LAST_CHANGED_DT` datetime DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`VTL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vitals` */

insert  into `vitals`(`VTL_ID`,`VTL_CODE`,`VTL_DISPLAY_TEXT`,`VTL_UOM_ID`,`VTL_DISPLAY_ORDER`,`VTL_LAST_USR_ID`,`VTL_LAST_CHANGED_DT`,`record_status`) values ('fcecf14b-843a-11e8-9538-00155d0a851b','TEMP','Temperature','Temparture',1,'79edc223-843a-11e8-9538-00155d0a851b','2018-06-01 00:00:00',NULL),('fcecf22a-843a-11e8-9538-00155d0a851b','SBP','Systolic Blood Pressure',NULL,2,'79edc223-843a-11e8-9538-00155d0a851b','2018-06-01 00:00:00',NULL),('fcecf299-843a-11e8-9538-00155d0a851b','DBP','Diastolic Blood Pressure',NULL,3,'79edc223-843a-11e8-9538-00155d0a851b','2018-06-01 00:00:00',NULL),('fcecf303-843a-11e8-9538-00155d0a851b','WGT','Current weight','Weight',4,'79edc223-843a-11e8-9538-00155d0a851b','2018-06-01 00:00:00',NULL),('fcecf36e-843a-11e8-9538-00155d0a851b','HGT','Current height','Height',5,'79edc223-843a-11e8-9538-00155d0a851b','2018-06-01 00:00:00',NULL);

/* Procedure structure for procedure `Add_Family_Member` */

/*!50003 DROP PROCEDURE IF EXISTS  `Add_Family_Member` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Add_Family_Member`(siteId VARCHAR(36), studyId VARCHAR(36), QUERY JSON)
BEGIN
	DECLARE encounterDate DATETIME DEFAULT NULL;
    DECLARE consentDate DATETIME DEFAULT NULL;
    DECLARE dob DATETIME DEFAULT NULL;
    DECLARE encounterType VARCHAR(100) DEFAULT NULL;
    DECLARE encounterUnscheduled VARCHAR(20) DEFAULT NULL;
    DECLARE encounterReason VARCHAR(100) DEFAULT NULL;
    DECLARE fname VARCHAR(100) DEFAULT NULL;
    DECLARE mi VARCHAR(100) DEFAULT NULL;
    DECLARE lname VARCHAR(100) DEFAULT NULL;
	DECLARE gender VARCHAR(100) DEFAULT NULL;
	DECLARE age VARCHAR(100) DEFAULT NULL;
	DECLARE ageCriteria VARCHAR(100) DEFAULT NULL;
	DECLARE address VARCHAR(100) DEFAULT NULL;
	DECLARE address1 VARCHAR(100) DEFAULT NULL;
	DECLARE city VARCHAR(20) DEFAULT NULL;
	DECLARE state VARCHAR(20) DEFAULT NULL;
	DECLARE zipcode VARCHAR(10) DEFAULT NULL;
	DECLARE hadtb VARCHAR(10) DEFAULT NULL;
	DECLARE havecough VARCHAR(10) DEFAULT NULL;
	DECLARE relationship VARCHAR(10) DEFAULT NULL;
	DECLARE phone VARCHAR(15) DEFAULT NULL;
    DECLARE consentVersion VARCHAR(100) DEFAULT NULL;
    DECLARE mrn VARCHAR(100) DEFAULT NULL;
    DECLARE userId VARCHAR(36) DEFAULT NULL;
    DECLARE studyVersionId VARCHAR(36) DEFAULT NULL;
    DECLARE studySiteParticipantId VARCHAR(36) DEFAULT NULL;
    DECLARE screeningId VARCHAR(36) DEFAULT NULL;
    DECLARE parEncId VARCHAR(36) DEFAULT NULL;
    DECLARE fgcId VARCHAR(50) DEFAULT NULL;
    DECLARE PARENT_SCN_ID VARCHAR(50) DEFAULT NULL;
	SET encounterDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.encounterDate')), '');
    SET consentDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.consentDate')), '');
    SET dob = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.dob')), '');
    SET encounterType = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.encounterType')), '');
    SET encounterUnscheduled = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.encounterUnscheduled')), '');
    SET encounterReason = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.encounterReason')), '');
    SET fname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.fname')), '');
    SET mi = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.mi')), '');
    SET lname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.lname')), '');
	SET gender = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.gender')), '');
	SET age = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.age')), '');
	SET ageCriteria = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.ageCriteria')), '');
	SET address = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.address')), '');
	SET address1 = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.address1')), '');
	SET city = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.city')), '');
	SET state = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.state')), '');
	SET zipcode = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.zipcode')), '');
	SET hadtb = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.hadtb')), '');
	SET havecough = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.havecough')), '');
	SET fgcId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.fgcId')), '');
	SET PARENT_SCN_ID = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.PARENT_SCN_ID')), '');
	SET phone = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.phone')), '');
	SET relationship = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.relation')), '');
    SET consentVersion = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.consentVersion')), '');
    SET mrn = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.mrn')), '');
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.userId')), '');
    SET studySiteParticipantId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.studySiteParticipantId')), '');
	SELECT SRS_SVE_ID INTO studyVersionId FROM SITE_REGISTERED_STUDIES WHERE SRS_STU_ID = studyId AND SRS_SIT_ID = siteId AND SRS_REG_CURRENT = 'Y';
	
	
    IF studySiteParticipantId IS NULL THEN
	BEGIN
		SET screeningId = UUID();
        
		INSERT INTO SCREENING (SCN_ID, SCN_FGC_ID, SCN_TNT_ID, SCN_MRN, SCN_FNAME, SCN_MI, SCN_LNAME, SCN_GENDER_CURR, SCN_DOB, SCN_SCREEN_DT, SCN_SCREEN_STATUS, SCN_LAST_USR_ID, SCN_AGE, SCN_AGE_CRITERIA, SCN_ADDRESS, SCN_ADDRESS1, SCN_CITY, SCN_STATE, SCN_ZIPCODE, SCN_TB, SCN_COUGH, SCN_PHONE, SCN_RELATIONSHIP, PARENT_SCN_ID )
		VALUES (screeningId, fgcId, 'cd0256d7-8439-11e8-9538-00155d0a851b', mrn, fname, mi, lname, gender, dob, encounterDate, 'In Progress', userId, age, ageCriteria, address, address1, city, state, zipcode, hadtb, havecough, phone, relationship, PARENT_SCN_ID );
		SET studySiteParticipantId = UUID();
		INSERT INTO STUDY_SITE_PARTICIPANTS (SPT_ID, SPT_PAT_ID, SPT_SCN_ID, SPT_SIT_ID, SPT_STU_ID, SPT_SPID, SPT_ENROLL_DT, SPT_ENROLL_STATUS, SPT_ENROLL_STATUS_DT, SPT_LAST_USR_ID )
		VALUES (studySiteParticipantId, NULL, screeningId, siteId, studyId, NULL, NULL, 'In Progress', CURRENT_DATE(), userId );
		
	END;
    END IF;
    
    SET parEncId = UUID();
    
	INSERT INTO PARTICIPANT_ENCOUNTERS (PEN_ID, PEN_SPT_ID, PEN_ENC_SVE_ID, PEN_EVENT_NAME, PEN_EVENT_UNSCH, PEN_ENC_DT, PEN_ENC_REASON, PEN_LAST_USR_ID )
	VALUES (parEncId, studySiteParticipantId, studyVersionId, encounterType, encounterUnscheduled, encounterDate, encounterReason, userId);
	
    IF consentDate IS NOT NULL THEN
		INSERT INTO PARTICIPANT_STUDY_CONSENTS (PSC_ID, PSC_SPT_ID, PSC_SCO_ID, PSC_LAST_USR_ID, PSC_CON_DT, PSC_LAST_CHANGE_DT)
		VALUES (UUID(),studySiteParticipantId, consentVersion, userId, consentDate, NOW());
    END IF;
    
	CALL Encounters_GetEncounterInfoById( parEncId );
END */$$
DELIMITER ;

/* Procedure structure for procedure `DEBUG` */

/*!50003 DROP PROCEDURE IF EXISTS  `DEBUG` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `DEBUG`(deleteNow boolean, message varchar(6000))
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS DEBUG (
		message VARCHAR(6000) NOT NULL
	);
   
	IF deleteNow = true THEN
        DROP temporary table DEBUG;
    else
		insert into DEBUG (message) values (message);        
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `EncounterForm_GetByGroupId` */

/*!50003 DROP PROCEDURE IF EXISTS  `EncounterForm_GetByGroupId` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `EncounterForm_GetByGroupId`(studyId varchar(36), formCode tinytext, encounterId varchar(36))
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
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `EncounterForm_SaveDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `EncounterForm_SaveDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `EncounterForm_SaveDetails`(studyId varchar(36), encounterId varchar(36), formCode varchar(45), query JSON, userId varchar(36), submitStatus varchar(40))
BEGIN    
    DECLARE l_crf_id varchar(36) default null;
    DECLARE i      INT DEFAULT  0;
	DECLARE jCount INT DEFAULT -1;
  	DECLARE l_pcr_id varchar(36) default null;
    
    select CRF_ID into l_crf_id from CRF_LIBRARY where CRF_SHORT_CODE=formCode; 
     
    if l_crf_id is not null THEN 
		begin 
			
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
                
                
              
                
                SET jCount = jCount + JSON_LENGTH( query, '$' );
				  WHILE ( i <= jCount ) DO
				
					SELECT PCR_ID INTO l_pcr_id
					FROM participant_crf_responses
					WHERE PCR_PEN_ID = encounterId and PCR_CRF_CODE = formCode and  PCR_QUE_ID = JSON_EXTRACT(query, CONCAT( '$[', i, '].CODE'));
					
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
					
					
                    
                    SELECT CRQ_RELATED into @relatedTable from crf_questions where CRQ_ID = JSON_EXTRACT(query, CONCAT( '$[', i, '].CODE'));
                    
                    IF @relatedTable IS NOT NULL THEN
						SET @tableName = JSON_UNQUOTE(JSON_EXTRACT(@relatedTable, '$.table'));
						SET @fieldName = JSON_UNQUOTE(JSON_EXTRACT(@relatedTable, '$.field'));
                        SET @fieldValue = JSON_EXTRACT(query, CONCAT( '$[', i, '].VALUE'));                        
                        
                        
                        SELECT pat_id into @participantId
							FROM participant_encounters
							JOIN study_site_participants ON spt_id = pen_spt_id
							JOIN participants ON spt_pat_id = pat_id
							LEFT JOIN participant_study_consents ON psc_spt_id = spt_id
							WHERE pen_id = encounterId;
                        
                        
						SET @updateQuery = CONCAT('UPDATE ', @tableName,' SET ', @fieldName, '=', @fieldValue, ' WHERE PAT_ID = "', @participantId, '";');
						
						PREPARE statement FROM @updateQuery;
						EXECUTE statement;    
						DEALLOCATE PREPARE statement;
                        
                    END IF;
                    
                    SET i = i + 1;
				  END WHILE;
                
            end; 
    end if;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `Encounters_CreateEncounter` */

/*!50003 DROP PROCEDURE IF EXISTS  `Encounters_CreateEncounter` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Encounters_CreateEncounter`(siteId VARCHAR(36), studyId VARCHAR(36), QUERY JSON)
BEGIN
	DECLARE encounterDate DATETIME DEFAULT NULL;
    DECLARE consentDate DATETIME DEFAULT NULL;
    DECLARE dob DATETIME DEFAULT NULL;
    DECLARE encounterType VARCHAR(100) DEFAULT NULL;
    DECLARE encounterUnscheduled VARCHAR(20) DEFAULT NULL;
    DECLARE encounterReason VARCHAR(100) DEFAULT NULL;
    DECLARE fname VARCHAR(100) DEFAULT NULL;
    DECLARE mi VARCHAR(100) DEFAULT NULL;
    DECLARE lname VARCHAR(100) DEFAULT NULL;
	DECLARE gender VARCHAR(100) DEFAULT NULL;
	DECLARE age VARCHAR(100) DEFAULT NULL;
	DECLARE ageCriteria VARCHAR(100) DEFAULT NULL;
	DECLARE address VARCHAR(100) DEFAULT NULL;
	DECLARE address1 VARCHAR(100) DEFAULT NULL;
	DECLARE city VARCHAR(20) DEFAULT NULL;
	DECLARE state VARCHAR(20) DEFAULT NULL;
	DECLARE zipcode VARCHAR(10) DEFAULT NULL;
	DECLARE hadtb VARCHAR(10) DEFAULT NULL;
	DECLARE havecough VARCHAR(10) DEFAULT NULL;
    DECLARE consentVersion VARCHAR(100) DEFAULT NULL;
    DECLARE mrn VARCHAR(100) DEFAULT NULL;
    DECLARE userId VARCHAR(36) DEFAULT NULL;
    DECLARE studyVersionId VARCHAR(36) DEFAULT NULL;
    DECLARE studySiteParticipantId VARCHAR(36) DEFAULT NULL;
    DECLARE screeningId VARCHAR(36) DEFAULT NULL;
    DECLARE parEncId VARCHAR(36) DEFAULT NULL;
    DECLARE fgcId VARCHAR(50) DEFAULT NULL;
    DECLARE PARENT_SCN_ID VARCHAR(50) DEFAULT NULL;
    DECLARE relationship VARCHAR(50) DEFAULT NULL;
    DECLARE fileUpload VARCHAR(50) DEFAULT NULL;
	SET encounterDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.encounterDate')), '');
    SET consentDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.consentDate')), '');
    SET dob = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.dob')), '');
    SET encounterType = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.encounterType')), '');
    SET encounterUnscheduled = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.encounterUnscheduled')), '');
    SET encounterReason = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.encounterReason')), '');
    SET fname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.fname')), '');
    SET mi = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.mi')), '');
    SET lname = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.lname')), '');
	SET gender = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.gender')), '');
	SET age = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.age')), '');
	SET ageCriteria = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.ageCriteria')), '');
	SET address = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.address')), '');
	SET address1 = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.address1')), '');
	SET city = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.city')), '');
	SET state = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.state')), '');
	SET zipcode = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.zipcode')), '');
	SET hadtb = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.hadtb')), '');
	SET havecough = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.havecough')), '');
    SET consentVersion = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.consentVersion')), '');
    SET PARENT_SCN_ID = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.PARENT_SCN_ID')), '');
    SET relationship = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.relation')), '');
       SET fileUpload = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.fileUpload')), '');
    SET mrn = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.mrn')), '');
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.userId')), '');
    SET studySiteParticipantId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.studySiteParticipantId')), '');
	SELECT SRS_SVE_ID INTO studyVersionId FROM SITE_REGISTERED_STUDIES WHERE SRS_STU_ID = studyId AND SRS_SIT_ID = siteId AND SRS_REG_CURRENT = 'Y';
	
	CALL get_Family_Group_Code(fgcId);
    IF studySiteParticipantId IS NULL THEN
	BEGIN
		SET screeningId = UUID();
        
		INSERT INTO SCREENING (SCN_ID, SCN_FGC_ID, SCN_TNT_ID, SCN_MRN, SCN_FNAME, SCN_MI, SCN_LNAME, SCN_GENDER_CURR, SCN_DOB, SCN_SCREEN_DT, SCN_SCREEN_STATUS, SCN_LAST_USR_ID, SCN_AGE, SCN_AGE_CRITERIA, SCN_ADDRESS, SCN_ADDRESS1, SCN_CITY, SCN_STATE, SCN_ZIPCODE, SCN_TB, SCN_COUGH ,PARENT_SCN_ID,SCN_FILE_PATH, SCN_RELATIONSHIP)
		VALUES (screeningId, fgcId, 'cd0256d7-8439-11e8-9538-00155d0a851b', mrn, fname, mi, lname, gender, dob, encounterDate, 'In Progress', userId, age, ageCriteria, address, address1, city, state, zipcode, hadtb, havecough , PARENT_SCN_ID,fileUpload,relationship);
		SET studySiteParticipantId = UUID();
		INSERT INTO STUDY_SITE_PARTICIPANTS (SPT_ID, SPT_PAT_ID, SPT_SCN_ID, SPT_SIT_ID, SPT_STU_ID, SPT_SPID, SPT_ENROLL_DT, SPT_ENROLL_STATUS, SPT_ENROLL_STATUS_DT, SPT_LAST_USR_ID )
		VALUES (studySiteParticipantId, NULL, screeningId, siteId, studyId, NULL, NULL, 'In Progress', CURRENT_DATE(), userId );
		
	END;
    END IF;
    
    SET parEncId = UUID();
    
	INSERT INTO PARTICIPANT_ENCOUNTERS (PEN_ID, PEN_SPT_ID, PEN_ENC_SVE_ID, PEN_EVENT_NAME, PEN_EVENT_UNSCH, PEN_ENC_DT, PEN_ENC_REASON, PEN_LAST_USR_ID )
	VALUES (parEncId, studySiteParticipantId, studyVersionId, encounterType, encounterUnscheduled, encounterDate, encounterReason, userId);
	
    IF consentDate IS NOT NULL THEN
		INSERT INTO PARTICIPANT_STUDY_CONSENTS (PSC_ID, PSC_SPT_ID, PSC_SCO_ID, PSC_LAST_USR_ID, PSC_CON_DT, PSC_LAST_CHANGE_DT)
		VALUES (UUID(),studySiteParticipantId, consentVersion, userId, consentDate, NOW());
    END IF;
    
	CALL Encounters_GetEncounterInfoById( parEncId );
END */$$
DELIMITER ;

/* Procedure structure for procedure `Encounters_GetAllIssues` */

/*!50003 DROP PROCEDURE IF EXISTS  `Encounters_GetAllIssues` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Encounters_GetAllIssues`(encounterId varchar(36))
BEGIN
	SELECT EDD_ID as id, EDD_EDS_PEN_ID AS encounterId, EDD_STEP_CD as stepCode, EDD_ISSUE_DESC as issueDesc
    FROM encounter_data_details where EDD_EDS_PEN_ID = encounterId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Encounters_GetEncounterInfoById` */

/*!50003 DROP PROCEDURE IF EXISTS  `Encounters_GetEncounterInfoById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Encounters_GetEncounterInfoById`(encounterId varchar(36))
BEGIN
	DECLARE participantId varchar(36) DEFAULT NULL;
    SELECT spt_pat_id INTO participantId
    FROM participant_encounters
    JOIN study_site_participants ON spt_id = pen_spt_id
    WHERE pen_id = encounterId;
    IF participantId IS NULL THEN
    BEGIN
		SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, scn_fname fname, SCN_FGC_ID fgcId, scn_mi mi, scn_age age, scn_age_criteria agecriteria, scn_lname lname, scn_gender_curr gender, scn_dob dob,SCN_ADDRESS address,SCN_ADDRESS1 address1,SCN_CITY city,SCN_STATE state,SCN_ZIPCODE zipcode,SCN_TB hadtb,SCN_COUGH havecough, psc_con_dt AS consentDate, psc_sco_id AS consentVersion, scn_mrn mrn, concat(left(scn_fname, 1), ' ', left(scn_lname, 1)) spid, pen_id encounterId, pen_spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, scn_id as screeningId,SCN_RELATIONSHIP as relation, null as participantId
		FROM participant_encounters
		JOIN study_site_participants ON spt_id = pen_spt_id
        JOIN screening ON spt_scn_id = scn_id
        LEFT JOIN participant_study_consents ON psc_spt_id = spt_id
		WHERE pen_id = encounterId;
	END;
	ELSE
    BEGIN
		SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason,PAT_FGC_ID fgcId, pat_fname fname, pat_mi mi, pat_lname lname, pat_gender_curr gender, pat_dob dob, pat_age age, pat_age_criteria agecriteria, psc_con_dt AS consentDate, psc_sco_id AS consentVersion, pat_mrn mrn, spt_spid spid, pen_id encounterId, pen_spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, null as screeningId,PAT_ADDRESS address,PAT_ADDRESS1 address1,PAT_CITY city,PAT_STATE state,PAT_ZIPCODE zipcode,PAT_TB hadtb,PAT_COUGH havecough, pat_id as participantId, scn_id AS screeningId, PAT_RELATIONSHIP AS relation
		FROM participant_encounters
		JOIN study_site_participants ON spt_id = pen_spt_id
        JOIN participants ON spt_pat_id = pat_id
        JOIN screening ON spt_scn_id = scn_id
        LEFT JOIN participant_study_consents ON psc_spt_id = spt_id
		WHERE pen_id = encounterId;
	END;
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Encounters_UpdateEncounter` */

/*!50003 DROP PROCEDURE IF EXISTS  `Encounters_UpdateEncounter` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Encounters_UpdateEncounter`(encounterId varchar(36), query JSON)
BEGIN
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
	DECLARE age VARCHAR(100) DEFAULT NULL;
	DECLARE ageCriteria VARCHAR(100) DEFAULT NULL;
	DECLARE address VARCHAR(100) DEFAULT NULL;
	DECLARE address1 VARCHAR(100) DEFAULT NULL;
	DECLARE city VARCHAR(20) DEFAULT NULL;
	DECLARE state VARCHAR(20) DEFAULT NULL;
	DECLARE zipcode VARCHAR(10) DEFAULT NULL;
	DECLARE hadtb VARCHAR(10) DEFAULT NULL;
	DECLARE havecough VARCHAR(10) DEFAULT NULL;
	DECLARE relation VARCHAR(36) DEFAULT NULL;
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
	SET age = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.age')), '');
	SET ageCriteria = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.ageCriteria')), '');
	SET address = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.address')), '');
	SET address1 = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.address1')), '');
	SET city = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.city')), '');
	SET state = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.state')), '');
	SET zipcode = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.zipcode')), '');
	SET hadtb = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.hadtb')), '');
	SET havecough = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.havecough')), '');
	SET relation = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.relation')), '');
    SET consentVersion = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.consentVersion')), '');
    SET mrn = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.mrn')), '');
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
	SELECT SPT_SCN_ID, SPT_PAT_ID, SPT_ID
	INTO screeningId, participantId, studySiteParticipantId
	FROM STUDY_SITE_PARTICIPANTS
	JOIN PARTICIPANT_ENCOUNTERS ON PEN_SPT_ID = SPT_ID
	WHERE PEN_ID = encounterId;
    if encounterType = 'Day 0 Visit' then
	begin
		UPDATE SCREENING
		SET SCN_MRN = mrn
		, SCN_FNAME = fname
		, SCN_MI = mi
		, SCN_LNAME = lname
		, SCN_GENDER_CURR = gender
		, SCN_DOB = dob
		, SCN_AGE = age
		, SCN_AGE_CRITERIA = ageCriteria
		, SCN_AGE_CRITERIA = ageCriteria 
		, SCN_ADDRESS = address
		, SCN_ADDRESS1 = address1
		, SCN_CITY = city
		, SCN_STATE = state
		, SCN_ZIPCODE = zipcode
		, SCN_TB = hadtb
		, SCN_COUGH = havecough
		, SCN_RELATIONSHIP = relation
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
		, PAT_AGE = age
		, PAT_AGE_CRITERIA = ageCriteria 
		, PAT_ADDRESS = address
		, PAT_ADDRESS1 = address1
		, PAT_CITY = city
		, PAT_STATE = state
		, PAT_ZIPCODE = zipcode
		, PAT_TB = hadtb
		, PAT_COUGH = havecough
		, PAT_RELATIONSHIP = relation
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `getAllGroupList` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAllGroupList` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `getAllGroupList`(spt_id varchar(36))
BEGIN
	select count(elr.ELR_ID) AS ELRCount,elr.encounter_group_id,ELR_LBT_TEST_DATE,
	ELR_PEN_ID, PEN.PEN_EVENT_NAME AS TestName
	from encounter_lab_result elr
	LEFT JOIN participant_encounters AS pen ON elr.ELR_pen_id=pen.PEN_ID
	where elr.ELR_pen_id in (select PEN_ID from participant_encounters where pen_spt_id = spt_id)
	group by encounter_group_id,ELR_LBT_TEST_DATE,ELR_PEN_ID;
	
	
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getAllMedications` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAllMedications` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `getAllMedications`()
BEGIN
	Select MED_CD medCode , MED_NAMES medName from medications order by MED_NAMES;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getAllParticipantEncounters` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAllParticipantEncounters` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `getAllParticipantEncounters`()
BEGIN
    SELECT PEN_ID as encounterId, concat(PEN_EVENT_NAME,' ', PEN_ENC_DT) as encounterType from participant_encounters;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getAllSpecimens` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAllSpecimens` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `getAllSpecimens`(siteId varchar(36))
BEGIN
	select st.id id, ssp.SPT_SPID participantSptId, pe.PEN_EVENT_NAME encounterEventName, st.specimen_type specimenType, 
    st.specimen_date specimenDate, st.specimen_number specimenNumber, st.specimen_sent_to specimenSentTo, 
    st.lab_result_date labResultDate, st.participant participant, st.encounter encounter, pe.PEN_ENC_DT encounterEventDate
	from specimen_tracking st
	join study_site_participants ssp on st.participant = ssp.SPT_ID
	join participant_encounters pe on st.encounter = pe.PEN_ID where st.spe_site_id = siteId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getAppVersion` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAppVersion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `getAppVersion`()
BEGIN
SELECT AVR_DISPLAY_TXT AS VERSION FROM app_versions order by AVR_LAST_CHANGE_DT DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetEncounterLabResult` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetEncounterLabResult` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `GetEncounterLabResult`(encounterId VARCHAR(36), group_id VARCHAR(36), event_name VARCHAR(30))
BEGIN
     DECLARE p_sev_id VARCHAR(36);
 	SELECT SEV_ID INTO @p_sev_id FROM study_events WHERE sev_event_name = event_name LIMIT 1;
	
	SELECT
	CASE WHEN ELT_SEV_ID = @p_sev_id THEN TRUE ELSE FALSE END AS IS_ENC_QUE
	,LBT_ID,LBT_NAME,LBT_DESC,LBT_CODE AS ELR_LBT_CODE
	,LBT_GROUP_ID,LBT_CONTROL_TYPE,LBT_HAS_CRITICAL,
	(SELECT ELR_RESULT_RANGE FROM encounter_lab_result WHERE ELR_PEN_ID = encounterId AND Encounter_GROUP_ID = group_id AND ELR_LBT_CODE = LBT_CODE LIMIT 1) AS ELR_RESULT_RANGE,
	(SELECT ELR_UOM FROM encounter_lab_result WHERE ELR_PEN_ID = encounterId AND Encounter_GROUP_ID = group_id AND ELR_LBT_CODE = LBT_CODE LIMIT 1) AS ELR_UOM,
	(SELECT ELR_ID FROM encounter_lab_result WHERE ELR_PEN_ID = encounterId AND Encounter_GROUP_ID = group_id AND ELR_LBT_CODE = LBT_CODE LIMIT 1) AS ELR_ID,
	(SELECT ELR_RESULT_VALUE FROM encounter_lab_result WHERE ELR_PEN_ID = encounterId AND Encounter_GROUP_ID = group_id AND ELR_LBT_CODE = LBT_CODE LIMIT 1) AS ELR_RESULT_VALUE,
	(SELECT GROUP_CONCAT(CQR_RESPONSE_VALUE) FROM cqr_question_responses WHERE CQR_RESPONSE_CODE= LBT_RESPONSE_CODE GROUP BY CQR_RESPONSE_CODE) AS OPTIONS
	FROM lab_tests
	LEFT JOIN encounter_lab_tests ON elt_lbt_id = lbt_id AND ELT_SEV_ID =  @p_sev_id 
	WHERE LBT_RECORD_STATUS = 'Active'
ORDER BY LBT_NAME;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetMasterLabTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetMasterLabTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `GetMasterLabTest`()
begin
	select LBT_ID,LBT_NAME,LBT_DESC,LBT_CODE as ELR_LBT_CODE,LBT_GROUP_ID,
    LBT_CONTROL_TYPE,LBT_HAS_CRITICAL,
    (SELECT GROUP_CONCAT(CQR_RESPONSE_VALUE)  FROM cqr_question_responses where CQR_RESPONSE_CODE= LBT_RESPONSE_CODE group by CQR_RESPONSE_CODE) AS OPTIONS
    from lab_tests
    where LBT_RECORD_STATUS = 'Active'
    order by LBT_NAME;
end */$$
DELIMITER ;

/* Procedure structure for procedure `GetParticipantsPIDS` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetParticipantsPIDS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `GetParticipantsPIDS`(PATID VARCHAR(5000) )
BEGIN
select PAT_ID,PAT_PID from participants where FIND_IN_SET(PAT_ID, PATID);
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetSpecimens` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetSpecimens` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `GetSpecimens`()
BEGIN
    SELECT * from specimen_tracking ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getSPID` */

/*!50003 DROP PROCEDURE IF EXISTS  `getSPID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `getSPID`(OUT p_pid_final VARCHAR(50))
BEGIN
DECLARE p_pid VARCHAR(50) DEFAULT NULL;
SELECT CASE WHEN ((SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1) <= 9) THEN CONCAT(SUBSTRING_INDEX(PAT_PID, 'ISL', 1),'ISL0000',(SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1))
WHEN ((SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1) > 9 AND (SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1) <= 99) THEN CONCAT(SUBSTRING_INDEX(PAT_PID, 'ISL', 1),'ISL000',(SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1))  
WHEN ((SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1) > 99 AND (SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1) <= 999) THEN CONCAT(SUBSTRING_INDEX(PAT_PID, 'ISL', 1),'ISL00',(SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1))
WHEN ((SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1) > 999 AND (SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1) <= 9999) THEN CONCAT(SUBSTRING_INDEX(PAT_PID, 'ISL', 1),'ISL0',(SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1))
WHEN ((SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1) > 9999) THEN CONCAT(SUBSTRING_INDEX(PAT_PID, 'ISL', 1),'ISL',(SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1))
ELSE (SUBSTRING_INDEX(PAT_PID, 'ISL', -1) + 1) END AS PID INTO p_pid FROM participants ORDER BY PAT_PID DESC LIMIT 1;
						
						IF p_pid IS NULL THEN
						BEGIN
							SET p_pid = CONCAT('ISL','00001');
						END;
						END IF;
                        
SET p_pid_final= p_pid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetStudySiteParticipantsSPIDs` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetStudySiteParticipantsSPIDs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `GetStudySiteParticipantsSPIDs`(SPTID VARCHAR(1000))
BEGIN
select SPT_ID,SPT_SPID from study_site_participants where FIND_IN_SET(SPT_ID, SPTID);
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetUnitsOfMeasurement` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetUnitsOfMeasurement` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `GetUnitsOfMeasurement`()
begin
	select UOM_ID AS 'key', UOM_UNIT as value from unit_of_measurements;
end */$$
DELIMITER ;

/* Procedure structure for procedure `GetUpdateScript` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetUpdateScript` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `GetUpdateScript`(in version varchar(20))
BEGIN
    SELECT AVR_FILE_LOCATION from app_versions WHERE AVR_DISPLAY_TXT = version;
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetUserDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetUserDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `GetUserDetails`(in p_uname varchar(200))
BEGIN
    SELECT * from users WHERE usr_uname = p_uname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetUsers` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetUsers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `GetUsers`()
BEGIN
    SELECT * from users;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_Family_Group_Code` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_Family_Group_Code` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `get_Family_Group_Code`(out p_pid_final VARCHAR(50))
BEGIN
DECLARE p_pid VARCHAR(50) DEFAULT NULL;
-- SELECT CONCAT('HEP ',COUNT(DISTINCT(scn_fgc_id))+1) into p_pid FROM screening WHERE scn_fgc_id IS NOT NULL AND scn_fgc_id LIKE 'HEP%';
SELECT  CONCAT('HEP ',MAX(CONVERT(SUBSTRING(scn_fgc_id,4),SIGNED))+1) INTO p_pid FROM screening;
						
						IF p_pid IS NULL THEN
						BEGIN
							SET p_pid = CONCAT('HEP ','1');
						END;
						END IF;
                        
SET p_pid_final= p_pid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Get_No_Histories_Status` */

/*!50003 DROP PROCEDURE IF EXISTS  `Get_No_Histories_Status` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Get_No_Histories_Status`(encounterId varchar(36), formCode varchar(30) )
BEGIN
	
    
	SELECT ifnull(PCD_REVIEW,0) as PCD_REVIEW FROM participant_crf_details 
    JOIN CRF_LIBRARY ON CRF_LIBRARY.CRF_ID=participant_crf_details.PCD_CRF_ID
    WHERE CRF_SHORT_CODE=formCode AND participant_crf_details.PCD_PEN_ID=encounterId
    LIMIT 1;
    
   
                        
END */$$
DELIMITER ;

/* Procedure structure for procedure `LibraryDocuments_GetAll` */

/*!50003 DROP PROCEDURE IF EXISTS  `LibraryDocuments_GetAll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `LibraryDocuments_GetAll`(siteId varchar(36), studyID varchar(36))
BEGIN
 SELECT DOC_FIELDNAME as fieldname , DOC_ORIGINALNAME as originalname , DOC_FILENAME as filename from 
 document_library WHERE DOC_STU_ID = studyID order by DOC_FILENAME;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `LibraryDocuments_Upload` */

/*!50003 DROP PROCEDURE IF EXISTS  `LibraryDocuments_Upload` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `LibraryDocuments_Upload`(siteID varchar(36), studyID varchar(36), query JSON)
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
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `Log_Create` */

/*!50003 DROP PROCEDURE IF EXISTS  `Log_Create` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Log_Create`(userId varchar(36), query JSON)
BEGIN
	
    DECLARE logDate DATETIME default null;
	DECLARE logTitle VARCHAR(255) default null;
	
	SET logDate = now();
    SET logTitle = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.title')), '');
    
	INSERT INTO api_logs ( ID, USER_ID, LOG_DATE, LOG_TITLE )
	VALUES ( uuid(), userId, logDate, logTitle );
	SELECT last_insert_id();
END */$$
DELIMITER ;

/* Procedure structure for procedure `Medication_deleteMeds` */

/*!50003 DROP PROCEDURE IF EXISTS  `Medication_deleteMeds` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Medication_deleteMeds`(pmId varchar(36))
BEGIN
    DECLARE encounterId varchar(36) default null;
    DECLARE userId varchar(36) default null;
    DECLARE isAvailable INT default 0;
    DECLARE isMedication INT default 0;
    DECLARE resID varchar(36) default 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN		
		select 0 as InsertedID;
		ROLLBACK;
	END;
    
	SELECT CASE WHEN count(*) > 0 THEN 1 ELSE 0 END INTO isAvailable
	FROM participant_medication_history
	WHERE PM_ID = pmId;
    
    SELECT PM_PEN_ID INTO encounterId FROM participant_medication_history WHERE PM_ID = pmId;
	SELECT PM_LAST_USR_ID INTO userId FROM participant_medication_history WHERE PM_ID = pmId;
	
	START TRANSACTION;
    if isAvailable = 1 then
		begin
			DELETE FROM participant_medication_history WHERE `PM_ID` = pmId;
			set resID =  pmId;
            
            SELECT CASE WHEN count(*) > 0 THEN 1 ELSE 0 END INTO isMedication
			FROM participant_medication_history WHERE PM_PEN_ID = encounterId;
			if isMedication = 0 then
				begin
					CALL Menu_UpdateStatus(encounterId, 'MED_HIS', userId, null, 0);
				end;
			end if;
		end;
    else 
		begin
			set resID =   '-1';
		end;
    end if;
	COMMIT;
	select resID as InsertedID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Menu_UpdateStatus` */

/*!50003 DROP PROCEDURE IF EXISTS  `Menu_UpdateStatus` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Menu_UpdateStatus`(encounterId varchar(36), formCode varchar(45), userId varchar(36), submitStatus varchar(40),p_review varchar(1))
BEGIN
DECLARE l_pcd_id varchar(36) default null;
    DECLARE l_crf_id varchar(36) default null;
	DECLARE review bit default null;
    IF p_review = '1' THEN
    BEGIN
		SET review= true;
    END;
    ELSE 
    BEGIN
		SET review= false;
    END;
    END IF;
    
    select CRF_ID into l_crf_id from CRF_LIBRARY where CRF_SHORT_CODE=formCode; 
     
    if l_crf_id is not null THEN
    
			
            select PCD_ID into l_pcd_id from participant_crf_details where PCD_CRF_ID = l_crf_id and PCD_PEN_ID = encounterId;
            
			if l_pcd_id is null THEN 
			begin
				set l_pcd_id = uuid();
				
                INSERT INTO participant_crf_details (PCD_ID, PCD_PEN_ID, PCD_CRF_ID, PCD_CRF_ENTRY_DT, PCD_CRF_STATUS, PCD_LAST_USR_ID, PCD_LAST_CHANGE_DT,PCD_REVIEW)
				VALUES (l_pcd_id, encounterId, l_crf_id, CURRENT_TIMESTAMP(), submitStatus, userId, CURRENT_TIMESTAMP(),review);
				
			end;
            else 
            begin 
				UPDATE participant_crf_details SET PCD_CRF_STATUS = submitStatus, PCD_LAST_CHANGE_DT = CURRENT_TIMESTAMP(),PCD_REVIEW=review
                WHERE PCD_ID = l_pcd_id;
			end;
			end if;
    
    end if;
    select true as FLAG;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Orders_CreateOrder` */

/*!50003 DROP PROCEDURE IF EXISTS  `Orders_CreateOrder` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Orders_CreateOrder`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN

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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Orders_DeleteOrder` */

/*!50003 DROP PROCEDURE IF EXISTS  `Orders_DeleteOrder` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Orders_DeleteOrder`(orderId varchar(36))
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Orders_GetAll` */

/*!50003 DROP PROCEDURE IF EXISTS  `Orders_GetAll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Orders_GetAll`(encounterId varchar(36))
BEGIN
	SELECT ETO_ID as ID, ETO_TEST_CD as testCode, TES_TEST_NAMES as testName,
    ETO_ORD_PLACE_DT as orderPlaceDate, ETO_ORD_EFF_DT as orderEffectiveDate
    FROM encounter_test_orders
	LEFT join tests on ETO_TEST_CD = TES_TEST_CD WHERE ETO_PEN_ID = encounterId  order by ETO_LAST_CHANGE_DT desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participants_CheckCounter` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participants_CheckCounter` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participants_CheckCounter`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
	
    SELECT 'true' as PROCEED;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participants_CheckDuplicate` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participants_CheckDuplicate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participants_CheckDuplicate`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
	
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participants_CheckEligibility` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participants_CheckEligibility` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participants_CheckEligibility`(pen_id varchar(36))
BEGIN
	DECLARE CNT INT;
    DECLARE enrollDate datetime;
    DECLARE IS_ENROLLED BIT;
	
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
			CASE WHEN (SELECT ELR_RESULT_VALUE FROM encounter_lab_result where ELR_LBT_CODE = 'HCV RNA' AND ELR_PEN_ID = pen_id LIMIT 1) = 'Detectable' 
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participants_Enroll` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participants_Enroll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participants_Enroll`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
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
		SELECT FALSE AS FLAG,'' AS PAT_ID;
		ROLLBACK;
	END;	
	    
	SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');
    SET enrollmentDate = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.enrollmentDate')), '');
	SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');	
   
    
   
    CALL getSPID(p_pid);
        			
    select PEN_SPT_ID into p_spt_id from participant_encounters where PEN_ID = encounterId;     
		if p_spt_id is not null then         
		begin
		select SPT_SCN_ID into p_scn_id from study_site_participants where SPT_ID = p_spt_id;		
			if p_scn_id is not null then
            begin
            
            set p_pat_id = uuid(); 
            
            INSERT INTO participants (`PAT_ID`,`PAT_FGC_ID`,`PAT_TNT_ID`,`PAT_MRN`,`PAT_PID`,`PAT_FNAME`,`PAT_MI`,`PAT_LNAME`,`PAT_GENDER_CURR`,`PAT_DOB`,
			`PAT_AGE`,`PAT_AGE_CRITERIA`,`PAT_ADDRESS`,`PAT_ADDRESS1`,`PAT_CITY`,`PAT_STATE`,`PAT_ZIPCODE`,
			`PAT_TB`,`PAT_COUGH`,`PAT_STATUS`,`PAT_LAST_USR_ID`,`PAT_LAST_CHANGE_DT`)  
            (select 
            p_pat_id,
            SCN_FGC_ID,
            SCN_TNT_ID,
            SCN_MRN,
            p_pid,
            SCN_FNAME,
            SCN_MI,
            SCN_LNAME,
            SCN_GENDER_CURR,
            SCN_DOB,
            SCN_AGE,
            SCN_AGE_CRITERIA,
            -- SCN_PHONE,
            -- SCN_RELATIONSHIP,
            SCN_ADDRESS,
            SCN_ADDRESS1,
            SCN_CITY,
            SCN_STATE,
            SCN_ZIPCODE,
            SCN_TB,
            SCN_COUGH,
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
		CALL Menu_UpdateStatus(encounterId, 'ENROLL', userId, 'Completed', 0);
	end;
	else
	begin
		select false as FLAG,'' AS PAT_ID;
    end;
    end if;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participants_getMedications` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participants_getMedications` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participants_getMedications`(pen_id varchar(36))
BEGIN
SELECT PM_ID AS pmId, PM_MEDICATION medication , PM_DOSE dose, PM_UNITS unit, PM_FREQUENCY pmFreq,PM_FREQUENCY_IN freqIn
	,PM_PEN_ID AS penId
	FROM participant_medication_history WHERE PM_PEN_ID = pen_id ORDER BY PM_LAST_CHANGE_DT;	
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participants_saveLabResults` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participants_saveLabResults` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participants_saveLabResults`(siteId varchar(36), studyId varchar(36), query JSON)
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
            ELR_LAST_CHANGED_DT = now(),
            ELR_RESULT_RANGE = IFNULL(JSON_UNQUOTE(JSON_EXTRACT(QUERY, CONCAT( '$[', i, '].ELR_RESULT_RANGE'))),'')
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
		`encounter_group_id`,
		`ELR_RESULT_RANGE`)
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
		JSON_UNQUOTE(JSON_EXTRACT(query, CONCAT( '$[', i, '].encounter_group_id'))),
		JSON_UNQUOTE(JSON_EXTRACT(QUERY, CONCAT( '$[', i, '].ELR_RESULT_RANGE'))));
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participant_AddDischarge` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participant_AddDischarge` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participant_AddDischarge`(siteId varchar(36), studyId varchar(36), query JSON)
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participant_Discharge` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participant_Discharge` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participant_Discharge`(siteId varchar(36), studyId varchar(36), query JSON)
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
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `participant_encounters_GetAllVitals` */

/*!50003 DROP PROCEDURE IF EXISTS  `participant_encounters_GetAllVitals` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `participant_encounters_GetAllVitals`(encounterId varchar(36))
BEGIN
	select VTL_CODE AS code, vtl_display_text as vitalDisplayText, 
    (Select group_concat(UOM_UNIT SEPARATOR '~') from unit_of_measurements where UOM_DESCRIPTION = vtl_uom_id) 'units',
     PEV_VTL_VALUE AS responseValue, 'radio' as UnitType
    FROM vitals
    
    left join participant_encounter_vitals on PEV_VTL_CODE = VTL_CODE AND PEV_PEN_ID  = encounterId
    order by VTL_DISPLAY_ORDER;
END */$$
DELIMITER ;

/* Procedure structure for procedure `participant_encounter_SaveAllVitals` */

/*!50003 DROP PROCEDURE IF EXISTS  `participant_encounter_SaveAllVitals` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `participant_encounter_SaveAllVitals`(siteId varchar(36), studyId varchar(36), query JSON, userId varchar(36))
BEGIN


    
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
    
    SET l_query = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.vitalsData')), '');
SET jCount = jCount + JSON_LENGTH( l_query, '$' );
  WHILE ( i <= jCount ) DO
	SELECT PEV_ID INTO l_pev_id
	FROM participant_encounter_vitals
	WHERE pev_pen_id = encounterId and PEV_VTL_CODE = JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].CODE')));
	
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participant_GetAllLabTests` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participant_GetAllLabTests` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participant_GetAllLabTests`(encounterId varchar(36), spt_id varchar(36))
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participant_GetDischarge` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participant_GetDischarge` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participant_GetDischarge`(encid varchar(36))
BEGIN
	SELECT PDC_EDC_PROVIDE as dischargeDetails , PDC_NOTE as  dischargeNotes from participant_discharge WHERE PDC_ECO_ID = encid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Participant_UPDATE_SPID` */

/*!50003 DROP PROCEDURE IF EXISTS  `Participant_UPDATE_SPID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Participant_UPDATE_SPID`(SPID varchar(50),PATID VARCHAR(50))
BEGIN
  
  UPDATE participants SET PAT_PID=SPID WHERE PAT_ID=PATID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `PatientVitals_SaveVitals` */

/*!50003 DROP PROCEDURE IF EXISTS  `PatientVitals_SaveVitals` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `PatientVitals_SaveVitals`(siteId varchar(36), studyId varchar(36), query JSON, userId varchar(36))
BEGIN


    
    DECLARE userId varchar(36) default null;
    DECLARE encounterId varchar(36) default null;
    DECLARE i      INT DEFAULT  0;
	DECLARE jCount INT DEFAULT -1;
	declare l_pev_id varchar(36) default null;
    declare l_query longtext default null;
    
    SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');
    SET l_query = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.vitalsData')), '');
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
SET jCount = jCount + JSON_LENGTH( l_query, '$' );
  WHILE ( i <= jCount ) DO
	SELECT PEV_ID INTO l_pev_id
	FROM participant_encounter_vitals
	WHERE pev_pen_id = encounterId and PEV_VTL_CODE = JSON_UNQUOTE(JSON_EXTRACT(l_query, CONCAT( '$[', i, '].CODE')));
	
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `procedure_History_Create_Update` */

/*!50003 DROP PROCEDURE IF EXISTS  `procedure_History_Create_Update` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `procedure_History_Create_Update`(query JSON)
BEGIN
    DECLARE p_PPH_ID varchar(36) default null;
    DECLARE p_PPH_NAME varchar(100) default null;
    DECLARE p_PPH_DAY int(2) default null;
	DECLARE p_PPH_MONTH int(2) default null;
    DECLARE p_PPH_YEAR int(4) default null;
    DECLARE p_PPH_DESCRIPTION varchar(500) default null;
    DECLARE p_PPH_LAST_USR_ID varchar(36) default null;
    DECLARE p_record_status char(1) DEFAULT NULL;
	DECLARE p_participantId varchar(36) DEFAULT NULL;
   
    SET p_PPH_ID = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.PPH_ID')), '');
    SET p_PPH_NAME = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.PPH_NAME')), '');
    SET p_PPH_DAY = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.PPH_DAY')), 0);
	SET p_PPH_MONTH = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.PPH_MONTH')), 0);
    SET p_PPH_YEAR = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.PPH_YEAR')), 0);
    SET p_PPH_DESCRIPTION = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.PPH_DESCRIPTION')), '');
	SET p_PPH_LAST_USR_ID = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.PPH_LAST_USR_ID')), '');
    SET p_record_status = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.record_status')), '');
	SET p_participantId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.participantId')), '');
    
   
		if p_PPH_ID <> '' then 
        begin
			UPDATE participant_procedure_history
			SET
			`PPH_NAME` = p_PPH_NAME,
			`PPH_DAY` = p_PPH_DAY,
			`PPH_MONTH` = p_PPH_MONTH,
            `PPH_YEAR` = p_PPH_YEAR,
            `PPH_DESCRIPTION` = p_PPH_DESCRIPTION,
			`PPH_LAST_USR_ID` = p_PPH_LAST_USR_ID,
			`PPH_LAST_CHANGE_DT` = curdate(),
            `participantId`=p_participantId
			WHERE `PPH_ID` = p_PPH_ID;
           
        end;
        else 
          set p_PPH_ID =  uuid();
        INSERT INTO participant_procedure_history 
        (`PPH_ID`,`PPH_NAME`,`PPH_DAY`,`PPH_MONTH`,`PPH_YEAR`,`PPH_DESCRIPTION`,`PPH_LAST_USR_ID`,`PPH_LAST_CHANGE_DT`,`participantId`)
        VALUES(p_PPH_ID,p_PPH_NAME,p_PPH_DAY,p_PPH_MONTH,p_PPH_YEAR,p_PPH_DESCRIPTION,p_PPH_LAST_USR_ID,curdate(),p_participantId);
        
        end if;
        
        SELECT * FROM participant_procedure_history WHERE `PPH_ID`= p_PPH_ID;
        
END */$$
DELIMITER ;

/* Procedure structure for procedure `procedure_History_DELETE` */

/*!50003 DROP PROCEDURE IF EXISTS  `procedure_History_DELETE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `procedure_History_DELETE`(P_PPH_ID varchar(36))
BEGIN
DELETE FROM participant_procedure_history where `PPH_ID`=P_PPH_ID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `procedure_History_GetAll` */

/*!50003 DROP PROCEDURE IF EXISTS  `procedure_History_GetAll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `procedure_History_GetAll`(encId varchar(36))
BEGIN
SELECT * FROM participant_procedure_history WHERE participantId  = encId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `PR_DATA_IMPORT` */

/*!50003 DROP PROCEDURE IF EXISTS  `PR_DATA_IMPORT` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `PR_DATA_IMPORT`()
BEGIN

  DECLARE v_sr_no, no_more_time     INT;
  DECLARE V_HEP_Code, V_Patient_ID, V_Col_name, v_scn_age_crit, V_Per_Name, V_Relation, V_Age, V_Rapid_Test, V_Sex, V_Cell, V_CNIC, V_Address VARCHAR(500);
  DECLARE v_scn_id, v_spt_id, v_pen_id, v_sit_id, v_stu_id,v_sve_id, v_tnt_id varchar(36); 
  
  DECLARE cur_all_data CURSOR FOR 
    SELECT sr_no, HEP_Code, Patient_ID, Col_name, Per_Name, Relation, Age, Rapid_Test, Sex, Cell, CNIC, Address 
    FROM data_migration ;
    -- WHERE hep_code = 'HEP 3' ;
  DECLARE CONTINUE HANDLER FOR NOT FOUND set no_more_time = 1;
  
  set no_more_time = 0 ;
    
  OPEN cur_all_data ;
   FETCH cur_all_data INTO v_sr_no, V_HEP_Code, V_Patient_ID, V_Col_name, V_Per_Name, V_Relation, V_Age, V_Rapid_Test, V_Sex, V_Cell, V_CNIC, V_Address;
   
   IF no_more_time <> 1 THEN
   
   REPEAT
   
	IF V_Age > 18 THEN
		set v_scn_age_crit = 'Adult' ;
    ELSEIF v_age between 12 and 18 then 
    	set v_scn_age_crit = 'Child' ;
	ELSE
    	set v_scn_age_crit = 'not eligible';
	END IF;
    
    select stu_id into v_stu_id from studies;    
    select sit_id into v_sit_id from sites;
    select sve_id into v_sve_id from study_versions;
    select tnt_id into v_tnt_id from tenants;
	
	set v_scn_id = uuid();

    INSERT INTO SCREENING
	(scn_id, scn_fgc_id, scn_tnt_id, scn_mrn, scn_fname, scn_Relationship, scn_age, scn_age_criteria, scn_gender_curr, scn_address, scn_address1,  scn_phone, scn_screen_status ) 
	values
	(v_scn_id, V_HEP_Code, v_tnt_id, V_Patient_ID, V_Per_Name, V_Relation, V_Age, v_scn_age_crit, V_Sex, V_Address, V_Col_name, V_Cell, 'In Progress');
    
    set v_spt_id = uuid();

	INSERT INTO STUDY_SITE_PARTICIPANTS 
	(SPT_ID, SPT_PAT_ID, SPT_SCN_ID, SPT_SIT_ID, SPT_STU_ID, SPT_ENROLL_STATUS )
	VALUES (v_spt_id, NULL, v_scn_id, v_sit_id, v_stu_id, 'In Progress' );
    
    set v_pen_id = uuid();

	INSERT INTO PARTICIPANT_ENCOUNTERS (PEN_ID, PEN_SPT_ID, PEN_ENC_SVE_ID, PEN_EVENT_NAME )
	VALUES (v_pen_id, v_spt_id, v_sve_id, 'Day 0 Visit');
    
   FETCH cur_all_data INTO v_sr_no, V_HEP_Code, V_Patient_ID, V_Col_name, V_Per_Name, V_Relation, V_Age, V_Rapid_Test, V_Sex, V_Cell, V_CNIC, V_Address;
   UNTIL no_more_time  = 1
   END REPEAT;
   
   set no_more_time = 0 ;
   Close cur_all_data ;
   
   END IF;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `PR_FULL_DATA_IMPORT` */

/*!50003 DROP PROCEDURE IF EXISTS  `PR_FULL_DATA_IMPORT` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `PR_FULL_DATA_IMPORT`()
BEGIN

  DECLARE v_sr_no, no_more_time, cnt_pat     INT;
  DECLARE V_HEP_Code, V_Patient_ID, V_Col_name, v_scn_age_crit, V_Per_Name, V_Relation, V_Age, V_Rapid_Test, V_Sex, V_Cell, V_CNIC, v_rf_tb_comm VARCHAR(500);
  DECLARE v_trt_1_med_date,  v_trt_1_due_date, v_trt_2_med_date,  v_trt_2_due_date, v_trt_3_med_date, v_trt_3_due_date varchar(100);
  DECLARE v_vac_1_date, v_vac_1_due_date, v_vac_2_date,  v_vac_2_due_date, v_vac_3_date, v_vac_3_due_date varchar(100);
  DECLARE v_trt_1_mon , v_trt_2_mon, v_trt_3_mon, v_vac_1_mon, v_vac_2_mon, v_vac_3_mon, v_pid varchar(100);   
  DECLARE v_scr_rdt_report, v_scr_gene_report, v_trt_outcome, v_comments, V_Address, v_status, v_spid VARCHAR(500);
  DECLARE v_pat_id, v_scn_id, v_spt_id, v_pen_id, v_sit_id, v_stu_id,v_sve_id, v_tnt_id, v_pcd_id varchar(100);  
  DECLARE v_rf_source_shaving , v_rf_sharing_blade, v_rf_sharing_brush, v_rf_hist_srugery, v_rf_hist_blood, v_rf_hist_inj, v_rf_hist_dental, v_rf_hist_hospital VARCHAR(100);
  DECLARE v_rf_hist_drug_abuse, v_rf_hist_drug_yes, v_rf_hep_b_vac, v_rf_hep_b_vac_yes, v_rf_job_hosp, v_rf_cough_hist, v_rf_tb_hist VARCHAR(100);
  
  
  DECLARE cur_all_data CURSOR FOR 
    SELECT sr_no, HEP_Code, Patient_ID, Col_name, Per_Name, Relation, Age, Rapid_Test, Sex, Cell, CNIC, Address,
    	   scr_rdt_report, scr_gene_report,  
		   trt_1_mon , trt_1_med_date,  trt_1_due_date,  trt_2_mon,  trt_2_med_date,  trt_2_due_date,  trt_3_mon,  trt_3_med_date,  trt_3_due_date,  
	       vac_1_mon,  vac_1_date,  vac_1_due_date,    vac_2_mon,  vac_2_date,  vac_2_due_date, vac_3_mon,  vac_3_date,  vac_3_due_date,
	       trt_outcome, comments,
           rf_source_shaving , rf_sharing_blade, rf_sharing_brush, rf_hist_srugery, rf_hist_blood, rf_hist_inj, rf_hist_dental, rf_hist_hospital,
		   rf_hist_drug_abuse, rf_hist_drug_yes, rf_hep_b_vac, rf_hep_b_vac_yes, rf_job_hosp, rf_cough_hist, rf_tb_hist, rf_tb_comm
      FROM data_import WHERE sr_no >= 1 and sr_no <= 52 ; 
   DECLARE CONTINUE HANDLER FOR NOT FOUND set no_more_time = 1;
  
   set no_more_time = 0 ;
   
   select stu_id into v_stu_id from studies;    
   select sit_id into v_sit_id from sites;
   select sve_id into v_sve_id from study_versions;
   select tnt_id into v_tnt_id from tenants;

    
  OPEN cur_all_data ;
   FETCH cur_all_data INTO v_sr_no, V_HEP_Code, V_Patient_ID, V_Col_name, V_Per_Name, V_Relation, 
		 v_Age, V_Rapid_Test, V_Sex, V_Cell, V_CNIC, V_Address, v_scr_rdt_report, v_scr_gene_report,  
		 v_trt_1_mon ,  v_trt_1_med_date,  v_trt_1_due_date,  v_trt_2_mon,  v_trt_2_med_date,  v_trt_2_due_date,  v_trt_3_mon,  v_trt_3_med_date,  v_trt_3_due_date,    
		 v_vac_1_mon,  v_vac_1_date, v_vac_1_due_date,    v_vac_2_mon,  v_vac_2_date,  v_vac_2_due_date, v_vac_3_mon, v_vac_3_date,  v_vac_3_due_date,  
		 v_trt_outcome, v_comments,
         v_rf_source_shaving , v_rf_sharing_blade, v_rf_sharing_brush, v_rf_hist_srugery, v_rf_hist_blood, v_rf_hist_inj, v_rf_hist_dental, v_rf_hist_hospital,
		 v_rf_hist_drug_abuse, v_rf_hist_drug_yes, v_rf_hep_b_vac, v_rf_hep_b_vac_yes, v_rf_job_hosp, v_rf_cough_hist, v_rf_tb_hist, v_rf_tb_comm;
   IF no_more_time <> 1 THEN
   
   REPEAT
   
	IF V_Age > 18 THEN
		set v_scn_age_crit = 'Adult' ;
    ELSEIF v_age between 12 and 18 then 
    	set v_scn_age_crit = 'Child' ;
	ELSE
    	set v_scn_age_crit = 'not eligible';
	END IF;
    
    select count(*) into cnt_pat from participants ;
    
    IF cnt_pat = 0 then
		set v_pid := 'ISL00001' ;
	ELSE
		SELECT concat('ISL',lpad(max(SUBSTRING(PAT_PID, 4)+1),5,'0')) into v_pid from participants ; 
    END IF;     
    
    IF v_scr_rdt_report = 'Positive' and v_scr_gene_report = 'Detected' THEN
		set v_status = 'Enrolled' ;
        set v_spid = v_pid ;
    Else
		set v_status = 'In Progress' ;
        set v_spid = null ;
    End If;     		
          
	set v_scn_id = uuid();
    
	set v_trt_1_med_date = STR_TO_DATE(v_trt_1_med_date,'%d-%b-%y') ;

    INSERT INTO SCREENING
	(scn_id, scn_fgc_id, scn_tnt_id, scn_mrn, scn_fname, scn_lname, scn_Relationship, scn_age, scn_age_criteria, 
     scn_gender_curr, scn_address, scn_address1,  scn_phone, scn_screen_status, scn_screen_dt ) 
	values
	(v_scn_id, V_HEP_Code, v_tnt_id, V_CNIC, V_Per_Name, null, V_Relation, V_Age, v_scn_age_crit, 
     V_Sex, V_Address, V_Col_name, V_Cell, v_status, v_trt_1_med_date); 
    
    If v_status = 'Enrolled' then
		set v_pat_id = uuid();
		insert into participants 
		(pat_id, pat_tnt_id, pat_fgc_id, pat_mrn, pat_pid, pat_fname, pat_lname, pat_gender_curr, 
        pat_age, pat_Age_criteria, pat_phone, pat_relationship, pat_address, pat_address1)
		values
		(v_pat_id, v_tnt_id, V_HEP_Code, V_CNIC, v_pid, V_Per_Name, null, V_Sex, 
        V_Age, v_scn_age_crit, V_Cell, V_Relation, V_Address, V_Col_name);
    ELSE
		set v_pat_id = null ;
    END IF;
    
    set v_spt_id = uuid();
    
	INSERT INTO STUDY_SITE_PARTICIPANTS 
	(SPT_ID, SPT_PAT_ID, SPT_SCN_ID, SPT_SIT_ID, SPT_STU_ID, SPT_SPID, SPT_ENROLL_STATUS, spt_enroll_Dt )
	VALUES (v_spt_id, v_pat_id, v_scn_id, v_sit_id, v_stu_id, v_spid, v_status, v_trt_1_med_date);  
    
    set v_pen_id = uuid();

	INSERT INTO PARTICIPANT_ENCOUNTERS (PEN_ID, PEN_SPT_ID, PEN_ENC_SVE_ID, PEN_EVENT_NAME, PEN_ENC_DT )
	VALUES (v_pen_id, v_spt_id, v_sve_id, 'Day 0 Visit', v_trt_1_med_date);
    
    IF v_trt_1_mon = 'Yes' THEN
		INSERT INTO PARTICIPANT_ENCOUNTERS (PEN_ID, PEN_SPT_ID, PEN_ENC_SVE_ID, PEN_EVENT_NAME, PEN_ENC_DT )
		VALUES (uuid(), v_spt_id, v_sve_id, '4 WEEK Visit',v_trt_1_med_date); 
	END IF;	   
    
    IF v_trt_2_mon = 'Yes' THEN
		set v_trt_2_med_date = STR_TO_DATE(v_trt_2_med_date,'%d-%b-%y') ;
		INSERT INTO PARTICIPANT_ENCOUNTERS (PEN_ID, PEN_SPT_ID, PEN_ENC_SVE_ID, PEN_EVENT_NAME, PEN_ENC_DT )
		VALUES (uuid(), v_spt_id, v_sve_id, '8 WEEK Visit',v_trt_2_med_date); 
	END IF;	
    
    IF v_trt_3_mon = 'Yes' THEN
		set v_trt_3_med_date = STR_TO_DATE(v_trt_3_med_date,'%d-%b-%y') ;
		INSERT INTO PARTICIPANT_ENCOUNTERS (PEN_ID, PEN_SPT_ID, PEN_ENC_SVE_ID, PEN_EVENT_NAME, PEN_ENC_DT )
		VALUES (uuid(), v_spt_id, v_sve_id, '12 WEEK Visit',v_trt_3_med_date); 
	END IF;	 
    
    
    If V_Rapid_Test = 'Tested' THEN
    
		-- Risk Factors insert --    
		set v_pcd_id = uuid();
		
		INSERT INTO participant_crf_details 
		(PCD_ID, PCD_PEN_ID, PCD_CRF_ID, PCD_CRF_STATUS) 
		values
		(v_pcd_id, v_pen_id, 'a1adf8ab-8429-11e8-9538-00155d0a851b', 'Completed');

		-- Que 1
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '20d6d43d-842a-11e8-9538-00155d0a851b', v_rf_source_shaving, v_pen_id, v_pcd_id);

		-- Que 2
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '20d6d4be-842a-11e8-9538-00155d0a851b', v_rf_sharing_blade, v_pen_id, v_pcd_id);
        
		-- Que 3
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '20d6d541-842a-11e8-9538-00155d0a851b', v_rf_sharing_brush, v_pen_id, v_pcd_id);
        
		-- Que 4
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '20d6d5c3-842a-11e8-9538-00155d0a851b', v_rf_hist_srugery, v_pen_id, v_pcd_id);
        
		-- Que 5
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '20d6d646-842a-11e8-9538-00155d0a851b', v_rf_hist_blood, v_pen_id, v_pcd_id);
        
		-- Que 6
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', 'fc7d2310-b737-11e8-ae48-00155d0a851b', v_rf_hist_inj, v_pen_id, v_pcd_id);
        
		-- Que 7
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', 'fcac007f-842a-11e8-9538-00155d0a851b', v_rf_hist_dental, v_pen_id, v_pcd_id);
        
		-- Que 8
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', 'fc97d96e-b737-11e8-ae48-00155d0a851b', v_rf_hist_hospital, v_pen_id, v_pcd_id);
        
		-- Que 9
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', 'fc9a388e-b737-11e8-ae48-00155d0a851b', v_rf_hist_drug_abuse, v_pen_id, v_pcd_id);
        
		-- Que 10
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '291e25c4-9e56-11e9-9de9-00059a3c7a00', v_rf_hist_drug_yes, v_pen_id, v_pcd_id);
        
		-- Que 11
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '2da22b28-9e56-11e9-9de9-00059a3c7a00', v_rf_hep_b_vac, v_pen_id, v_pcd_id);
        
		-- Que 12
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '3166bbb4-9e56-11e9-9de9-00059a3c7a00', v_rf_hep_b_vac_yes , v_pen_id, v_pcd_id);
        
		-- Que 13
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '361d733c-9e56-11e9-9de9-00059a3c7a00', v_rf_job_hosp, v_pen_id, v_pcd_id);
        
		-- Que 14
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '39516ae3-9e56-11e9-9de9-00059a3c7a00', v_rf_cough_hist, v_pen_id, v_pcd_id);
        
		-- Que 15
        INSERT INTO participant_crf_responses 
		(PCR_ID, PCR_CRF_CODE, PCR_QUE_ID, PCR_RESPONSE_VALUE, PCR_PEN_ID, PCR_PCD_ID) 
		values
		(uuid(), 'RIS_FAC', '3c56fdd3-9e56-11e9-9de9-00059a3c7a00', v_rf_tb_hist, v_pen_id, v_pcd_id);        
        
    END IF;     

    
   FETCH cur_all_data INTO v_sr_no, V_HEP_Code, V_Patient_ID, V_Col_name, V_Per_Name, V_Relation, 
		 v_Age, V_Rapid_Test, V_Sex, V_Cell, V_CNIC, V_Address, v_scr_rdt_report, v_scr_gene_report,  
		 v_trt_1_mon ,  v_trt_1_med_date,  v_trt_1_due_date,  v_trt_2_mon,  v_trt_2_med_date,  v_trt_2_due_date,  v_trt_3_mon,  v_trt_3_med_date,  v_trt_3_due_date,    
		 v_vac_1_mon,  v_vac_1_date, v_vac_1_due_date,    v_vac_2_mon,  v_vac_2_date,  v_vac_2_due_date, v_vac_3_mon, v_vac_3_date,  v_vac_3_due_date,  
		 v_trt_outcome, v_comments,
         v_rf_source_shaving , v_rf_sharing_blade, v_rf_sharing_brush, v_rf_hist_srugery, v_rf_hist_blood, v_rf_hist_inj, v_rf_hist_dental, v_rf_hist_hospital,
		 v_rf_hist_drug_abuse, v_rf_hist_drug_yes, v_rf_hep_b_vac, v_rf_hep_b_vac_yes, v_rf_job_hosp, v_rf_cough_hist, v_rf_tb_hist, v_rf_tb_comm;
   UNTIL no_more_time  = 1
   END REPEAT;
   
   set no_more_time = 0 ;
   Close cur_all_data ;
   
   END IF;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `Referrals_CreateReferral` */

/*!50003 DROP PROCEDURE IF EXISTS  `Referrals_CreateReferral` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Referrals_CreateReferral`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN

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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Referrals_DeleteReferral` */

/*!50003 DROP PROCEDURE IF EXISTS  `Referrals_DeleteReferral` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Referrals_DeleteReferral`(referralId varchar(36))
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Referrals_GetAll` */

/*!50003 DROP PROCEDURE IF EXISTS  `Referrals_GetAll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Referrals_GetAll`(encounterId varchar(36))
BEGIN
	SELECT ERE_ID as ID, ERE_REF_CD as testCode, ERE_REF_DT as referralDate
    FROM encounter_referrals WHERE ERE_PEN_ID = encounterId  order by ERE_LAST_CHANGE_DT desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Referrals_GetAllTests` */

/*!50003 DROP PROCEDURE IF EXISTS  `Referrals_GetAllTests` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Referrals_GetAllTests`()
BEGIN
	SELECT REF_ID TestId, REF_CD TestCode, REF_NAMES TestName
    FROM referrals;
END */$$
DELIMITER ;

/* Procedure structure for procedure `saveParicipantMedication` */

/*!50003 DROP PROCEDURE IF EXISTS  `saveParicipantMedication` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `saveParicipantMedication`(siteId varchar(36), studyId varchar(36), query JSON)
BEGIN
    DECLARE encounterId varchar(36) default null;
    DECLARE medication VARCHAR(80) default null;
    DECLARE dose VARCHAR(80) default null;
    DECLARE unit varchar(80) default null;    
    DECLARE pmFreq VARCHAR(80) default null; 
    DECLARE freqIn VARCHAR(80) default null; 
    DECLARE userId varchar(36) default null;
    DECLARE pmId varchar(36) default null;
    DECLARE id BIT default 0;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING
	BEGIN
		select false as FLAG;
		ROLLBACK;
	END;
	    
    SET encounterId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.encounterId')), '');
    SET medication = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.medication')), '');
    SET dose = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.dose')), '');	
    SET unit = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.unit')), '');
    SET pmFreq = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.pmFreq')), '');
    SET freqIn = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.freqIn')), '');	
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.userId')), '');
    SET pmId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(query, '$.pmId')), '');
    
    START TRANSACTION;
    if pmId <> '' then
    begin
		update participant_medication_history
		set
		`PM_MEDICATION`= medication,
		`PM_DOSE`= dose,
		`PM_UNITS`= unit,
		`PM_FREQUENCY`= pmFreq,
		`PM_FREQUENCY_IN`= freqIn,
		`PM_PEN_ID`= encounterId,
		`PM_LAST_USR_ID`= userId,
		`PM_LAST_CHANGE_DT`= now() where PM_ID = pmId;		
	end;
    else
    begin
		INSERT INTO participant_medication_history
		(`PM_ID`,
		`PM_MEDICATION`,
		`PM_DOSE`,
		`PM_UNITS`,
		`PM_FREQUENCY`,
		`PM_FREQUENCY_IN`,
		`PM_PEN_ID`,
		`PM_LAST_USR_ID`,
		`PM_LAST_CHANGE_DT`
		)
		VALUES
		(uuid(),
		medication,
		dose,
		unit,
		pmFreq,
		freqIn,
		encounterId,
		userId,
		NOW());
		
		CALL Menu_UpdateStatus(encounterId, 'MED_HIS', userId, 'Completed', 0);
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
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `Sites_GetAll` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sites_GetAll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Sites_GetAll`()
BEGIN
	SELECT SIT_ID as id, SIT_SITE_NAME as site
    FROM sites WHERE SIT_STATUS = 'Active';
END */$$
DELIMITER ;

/* Procedure structure for procedure `specimen_createSpecimen` */

/*!50003 DROP PROCEDURE IF EXISTS  `specimen_createSpecimen` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `specimen_createSpecimen`(siteId varchar(36), studyId varchar(40), query JSON)
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Specimen_GetDetailsById` */

/*!50003 DROP PROCEDURE IF EXISTS  `Specimen_GetDetailsById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Specimen_GetDetailsById`(sId VARCHAR(40))
BEGIN
	SELECT participant participant, encounter encounter, specimen_number specimenNumber, 
		specimen_date specimenDate, specimen_sent_to specimenSentTo, lab_result_date labResultDate, 
        specimen_type specimenType, comments comm, ssp.SPT_SPID pid, pe.PEN_EVENT_NAME encounter FROM specimen_tracking 
        join study_site_participants ssp on ssp.SPT_ID = participant
        JOIN participant_encounters pe ON pe.PEN_ID = encounter
        WHERE id = sId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Specimen_Search` */

/*!50003 DROP PROCEDURE IF EXISTS  `Specimen_Search` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Specimen_Search`(searchTxt varchar(100))
BEGIN
    select st.id id, st.specimen_number specimenNumber, st.specimen_sent_to specimenSentTo, st.lab_result_date labResultDate, st.specimen_type specimenType ,
    st.specimen_date specimenDate,
st.participant participant, ssp.SPT_SPID participantSptId,
st.encounter encounter, pe.PEN_EVENT_NAME encounterEventName, pe.PEN_ENC_DT encounterEventDate
from specimen_tracking st
join study_site_participants ssp on st.participant = ssp.SPT_ID
join participant_encounters pe on st.encounter = pe.PEN_ID
WHERE specimen_number LIKE concat('%',searchTxt,'%') or
specimen_sent_to LIKE concat('%',searchTxt,'%') or
lab_result_date LIKE concat('%',searchTxt,'%') or
specimen_type LIKE concat('%',searchTxt,'%') or
specimen_date LIKE concat('%',searchTxt,'%') or
SPT_SPID LIKE concat('%',searchTxt,'%') or
PEN_EVENT_NAME LIKE concat('%',searchTxt,'%') or
PEN_ENC_DT LIKE concat('%',searchTxt,'%');
END */$$
DELIMITER ;

/* Procedure structure for procedure `StudyConsents_GetAllConsents` */

/*!50003 DROP PROCEDURE IF EXISTS  `StudyConsents_GetAllConsents` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `StudyConsents_GetAllConsents`(studyId varchar(36))
BEGIN
	Select sco_id scoId, sco_ver_txt scoVerText, sco_consent_url scoConsentUrl from Study_consents
where SCO_STATUS = 'Active' and SCO_STU_ID =  studyId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `StudyEncounters_GetAllEncounters` */

/*!50003 DROP PROCEDURE IF EXISTS  `StudyEncounters_GetAllEncounters` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `StudyEncounters_GetAllEncounters`(studyId varchar(36))
BEGIN
	SELECT SEV_EVENT_NAME eventName, sev_id sevId, sev_short_cd sevShortCd,sev_event_order sevEventOrder, sev_duration sevDuration, sev_unit_duration sevUnitDuration
    FROM study_events where sev_stu_id = studyId
    order by sev_event_order asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `StudyEncounters_GetAllEncounterSteps` */

/*!50003 DROP PROCEDURE IF EXISTS  `StudyEncounters_GetAllEncounterSteps` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `StudyEncounters_GetAllEncounterSteps`(studyId varchar(36), eventName varchar(40), encounterId varchar(36))
BEGIN
	
    Select DCS_STEP_CD dcsStepCd, DCS_DISPLAY_NAME dcsDisplayName, SVS_GROUP_ID svsGroupId
    ,SVS_DISPLAY_ORDER as displayOrder, SVS_ID as id, PCD_CRF_STATUS as menuStatus
    from data_capture_steps 
    join study_event_steps on SVS_STEP_CD = DCS_STEP_CD
    left join CRF_LIBRARY on CRF_SHORT_CODE = DCS_STEP_CD
    left join participant_crf_details on PCD_CRF_ID = CRF_ID and PCD_PEN_ID = encounterId
	where SVS_EVENT_NAME = eventName and SVS_STU_ID = studyId
    order by SVS_DISPLAY_ORDER asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `StudyEncounters_GetParticipantEncounterOrders` */

/*!50003 DROP PROCEDURE IF EXISTS  `StudyEncounters_GetParticipantEncounterOrders` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `StudyEncounters_GetParticipantEncounterOrders`(encounterId varchar(36))
BEGIN
	
   Select ETO_TEST_CD as etoTestCd, ETO_ORD_PLACE_DT etoOrdPlaceDt, TES_TEST_NAMES tesTestNames FROM encounter_test_orders
   JOIN tests on tests.TES_TEST_CD = encounter_test_orders.ETO_TEST_CD
   where eto_pen_id = encounterId;
   
END */$$
DELIMITER ;

/* Procedure structure for procedure `StudySite_FindParticipants` */

/*!50003 DROP PROCEDURE IF EXISTS  `StudySite_FindParticipants` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `StudySite_FindParticipants`(siteId VARCHAR(36), studyId VARCHAR(36), QUERY JSON)
BEGIN
	#sample query format: '{ "userId": "1", "studyId": "3", "siteId": "5" }'
    DECLARE userId VARCHAR(36) DEFAULT NULL;
    DECLARE sortBy VARCHAR(200) DEFAULT NULL;
    DECLARE filterBy VARCHAR(200) DEFAULT NULL;
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.userId')), '');
    SET sortBy = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.sortBy')), '');
    SET filterBy = IFNULL(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.filterBy')), '');
	-- set sortBy = 'gender DESC';
	SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, pat_fname fname, pat_mi mi, pat_lname lname, pat_gender_curr gender, pat_dob dob, pat_age age,pat_age_criteria ageCriteria,
	pat_fgc_id fgcId,PAT_RELATIONSHIP relation,NULL AS consentDate, NULL AS consentVersion, pat_mrn mrn, spt_spid spid, c.pen_id encounterId,
	 b.spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, SPT_ENROLL_DT enrollmentDate, PEN_LAST_CHANGE_DT lastEdited
    ,spt_pat_id, b.sev_event_name, b.sev_short_cd,
    (SELECT elr_result_value  FROM encounter_lab_result WHERE elr_lbt_code = 'APRI'
    AND elr_pen_id = (SELECT pen_id FROM participant_encounters WHERE pen_spt_id = b.spt_id  
    AND pen_event_name = 'Day 0 Visit')) apri_val,
    CASE WHEN (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) > 0 THEN 
    (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) ELSE 0 END AS issues ,sev_event_order
	FROM     
    (
		SELECT spt_id, sev_event_name, sev_short_cd ,
			pen_id, sev_event_order
			FROM study_events
			JOIN study_site_participants 
			LEFT JOIN (SELECT pen_id, pen_spt_id, pen_event_name, PEN_ENC_DT FROM participant_encounters) b ON pen_spt_id = spt_id AND pen_event_name = sev_event_name 
			ORDER BY study_site_participants.created_dt, IFNULL(PEN_ENC_DT, '2100-01-01')) b
    LEFT JOIN participant_encounters c ON b.pen_id = c.pen_id AND b.spt_id = c.pen_spt_id
	JOIN study_site_participants d ON d.spt_id = b.spt_id 
	JOIN participants ON spt_pat_id = pat_id
    JOIN screening ON spt_scn_id = scn_id
	AND spt_stu_id = studyId AND spt_sit_id = siteId AND (spt_spid LIKE CONCAT('%',filterBy,'%') OR scn_fname LIKE CONCAT('%',filterBy,'%') OR scn_lname LIKE CONCAT('%',filterBy,'%') OR scn_fgc_id LIKE CONCAT('%',filterBy,'%'))
	UNION
	
    SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, scn_fname fname, scn_mi mi, scn_lname lname, scn_gender_curr gender, 
    scn_dob dob,scn_age age,scn_age_criteria ageCriteria,scn_fgc_id fgcId,SCN_RELATIONSHIP relation, NULL AS consentDate, NULL AS consentVersion, scn_mrn mrn, scn_fname spid, c.pen_id encounterId,
    b.spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, NULL AS enrollmentDate, PEN_LAST_CHANGE_DT lastEdited
	,spt_pat_id, b.sev_event_name, b.sev_short_cd,
(SELECT elr_result_value  FROM encounter_lab_result WHERE elr_lbt_code = 'APRI'
    AND elr_pen_id = (SELECT pen_id FROM participant_encounters WHERE pen_spt_id = b.spt_id  
    AND pen_event_name = 'Day 0 Visit')) apri_val,	
	
    CASE WHEN (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) > 0 THEN 
    (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) ELSE 0 END AS issues , sev_event_order
    FROM (
		SELECT spt_id, sev_event_name, sev_short_cd ,
			pen_id , sev_event_order
			FROM study_events
			JOIN study_site_participants 
			LEFT JOIN (SELECT pen_id, pen_spt_id, pen_event_name, PEN_ENC_DT FROM participant_encounters) b ON pen_spt_id = spt_id AND pen_event_name = sev_event_name 
			ORDER BY study_site_participants.created_dt, IFNULL(PEN_ENC_DT, '2100-01-01')) b
    LEFT JOIN participant_encounters c ON b.pen_id = c.pen_id AND b.spt_id = c.pen_spt_id
	JOIN study_site_participants d ON d.spt_id = b.spt_id AND spt_pat_id IS NULL
    JOIN screening ON spt_scn_id = scn_id
	AND spt_stu_id = studyId AND spt_sit_id = siteId AND (spt_spid LIKE CONCAT('%',filterBy,'%') OR scn_fname LIKE CONCAT('%',filterBy,'%') OR scn_lname LIKE CONCAT('%',filterBy,'%') OR scn_fgc_id LIKE CONCAT('%',filterBy,'%'))
	ORDER BY 
		CASE WHEN sortBy='lastEdited ASC' THEN lastEdited END , -- studysiteparticipantId asc, IFNULL(encounterDate,'2100-01-01')  asc, sev_event_order asc,
		CASE WHEN sortBy='gender ASC' THEN gender END ASC,
		CASE WHEN sortBy='lastEdited DESC' THEN lastEdited END DESC,
		CASE WHEN sortBy='gender DESC' THEN gender END DESC,
		CASE WHEN sortBy='enrollmentDate ASC' THEN enrollmentDate END ASC,
		CASE WHEN sortBy='enrollmentDate DESC' THEN enrollmentDate END DESC,
        studysiteparticipantId , encounterDate IS NULL, encounterDate ASC, sev_event_order  ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `StudySite_FindParticipants_New` */

/*!50003 DROP PROCEDURE IF EXISTS  `StudySite_FindParticipants_New` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `StudySite_FindParticipants_New`(siteId VARCHAR(36), studyId VARCHAR(36), QUERY JSON, start_pos int(10), rec_cnt int(10))
BEGIN
	#sample query format: '{ "userId": "1", "studyId": "3", "siteId": "5" }'
    DECLARE userId VARCHAR(36) DEFAULT NULL;
    DECLARE sortBy VARCHAR(200) DEFAULT NULL;
    DECLARE filterBy VARCHAR(200) DEFAULT NULL;
    DECLARE v_cnt int(10);
    SET userId = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.userId')), '');
    SET sortBy = NULLIF(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.sortBy')), '');
    SET filterBy = IFNULL(JSON_UNQUOTE(JSON_EXTRACT(QUERY, '$.filterBy')), '');
	-- set sortBy = 'gender DESC';
    
   SELECT count(*) into v_cnt from ( 
	SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, pat_fname fname, pat_mi mi, pat_lname lname, pat_gender_curr gender, pat_dob dob, pat_age age,pat_age_criteria ageCriteria,
	pat_fgc_id fgcId,PAT_RELATIONSHIP relation,NULL AS consentDate, NULL AS consentVersion, pat_mrn mrn, spt_spid spid, c.pen_id encounterId,
	 b.spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, SPT_ENROLL_DT enrollmentDate, PEN_LAST_CHANGE_DT lastEdited
    ,spt_pat_id, b.sev_event_name, b.sev_short_cd,
    (SELECT elr_result_value  FROM encounter_lab_result WHERE elr_lbt_code = 'APRI'
    AND elr_pen_id = (SELECT pen_id FROM participant_encounters WHERE pen_spt_id = b.spt_id  
    AND pen_event_name = 'Day 0 Visit')) apri_val,
    CASE WHEN (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) > 0 THEN 
    (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) ELSE 0 END AS issues ,sev_event_order
	FROM     
    (
		SELECT spt_id, sev_event_name, sev_short_cd ,
			pen_id, sev_event_order
			FROM study_events
			JOIN study_site_participants 
			LEFT JOIN (SELECT pen_id, pen_spt_id, pen_event_name, PEN_ENC_DT FROM participant_encounters) b ON pen_spt_id = spt_id AND pen_event_name = sev_event_name 
			ORDER BY study_site_participants.created_dt, IFNULL(PEN_ENC_DT, '2100-01-01')) b
    LEFT JOIN participant_encounters c ON b.pen_id = c.pen_id AND b.spt_id = c.pen_spt_id
	JOIN study_site_participants d ON d.spt_id = b.spt_id 
	JOIN participants ON spt_pat_id = pat_id
    JOIN screening ON spt_scn_id = scn_id
	AND spt_stu_id = studyId AND spt_sit_id = siteId AND (spt_spid LIKE CONCAT('%',filterBy,'%') OR scn_fname LIKE CONCAT('%',filterBy,'%') OR scn_lname LIKE CONCAT('%',filterBy,'%') OR scn_fgc_id LIKE CONCAT('%',filterBy,'%') OR PAT_AGE_CRITERIA LIKE CONCAT('%',filterBy,'%'))
	UNION	
    SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, scn_fname fname, scn_mi mi, scn_lname lname, scn_gender_curr gender, 
    scn_dob dob,scn_age age,scn_age_criteria ageCriteria,scn_fgc_id fgcId,SCN_RELATIONSHIP relation, NULL AS consentDate, NULL AS consentVersion, scn_mrn mrn, scn_fname spid, c.pen_id encounterId,
    b.spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, NULL AS enrollmentDate, PEN_LAST_CHANGE_DT lastEdited
	,spt_pat_id, b.sev_event_name, b.sev_short_cd,
	(SELECT elr_result_value  FROM encounter_lab_result WHERE elr_lbt_code = 'APRI'
    AND elr_pen_id = (SELECT pen_id FROM participant_encounters WHERE pen_spt_id = b.spt_id  
    AND pen_event_name = 'Day 0 Visit')) apri_val,		
    CASE WHEN (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) > 0 THEN 
    (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) ELSE 0 END AS issues , sev_event_order
    FROM (
		SELECT spt_id, sev_event_name, sev_short_cd ,
			pen_id , sev_event_order
			FROM study_events
			JOIN study_site_participants 
			LEFT JOIN (SELECT pen_id, pen_spt_id, pen_event_name, PEN_ENC_DT FROM participant_encounters) b ON pen_spt_id = spt_id AND pen_event_name = sev_event_name 
			ORDER BY study_site_participants.created_dt, IFNULL(PEN_ENC_DT, '2100-01-01')) b
    LEFT JOIN participant_encounters c ON b.pen_id = c.pen_id AND b.spt_id = c.pen_spt_id
	JOIN study_site_participants d ON d.spt_id = b.spt_id AND spt_pat_id IS NULL
    JOIN screening ON spt_scn_id = scn_id
	AND spt_stu_id = studyId AND spt_sit_id = siteId AND (spt_spid LIKE CONCAT('%',filterBy,'%') OR scn_fname LIKE CONCAT('%',filterBy,'%') OR scn_lname LIKE CONCAT('%',filterBy,'%') OR scn_fgc_id LIKE CONCAT('%',filterBy,'%') OR scn_age_criteria LIKE CONCAT('%',filterBy,'%'))
	) a ;
    
    
   SELECT a.*, (v_cnt/9) total_count from ( 
	SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, pat_fname fname, pat_mi mi, pat_lname lname, pat_gender_curr gender, pat_dob dob, pat_age age,pat_age_criteria ageCriteria,
	pat_fgc_id fgcId,PAT_RELATIONSHIP relation,NULL AS consentDate, NULL AS consentVersion, pat_mrn mrn, spt_spid spid, c.pen_id encounterId,
	 b.spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, SPT_ENROLL_DT enrollmentDate, PEN_LAST_CHANGE_DT lastEdited
    ,spt_pat_id, b.sev_event_name, b.sev_short_cd,
    (SELECT elr_result_value  FROM encounter_lab_result WHERE elr_lbt_code = 'APRI'
    AND elr_pen_id = (SELECT pen_id FROM participant_encounters WHERE pen_spt_id = b.spt_id  
    AND pen_event_name = 'Day 0 Visit')) apri_val,
    CASE WHEN (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) > 0 THEN 
    (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) ELSE 0 END AS issues ,sev_event_order
	FROM     
    (
		SELECT spt_id, sev_event_name, sev_short_cd ,
			pen_id, sev_event_order
			FROM study_events
			JOIN study_site_participants 
			LEFT JOIN (SELECT pen_id, pen_spt_id, pen_event_name, PEN_ENC_DT FROM participant_encounters) b ON pen_spt_id = spt_id AND pen_event_name = sev_event_name 
			ORDER BY study_site_participants.created_dt, IFNULL(PEN_ENC_DT, '2100-01-01')) b
    LEFT JOIN participant_encounters c ON b.pen_id = c.pen_id AND b.spt_id = c.pen_spt_id
	JOIN study_site_participants d ON d.spt_id = b.spt_id 
	JOIN participants ON spt_pat_id = pat_id
    JOIN screening ON spt_scn_id = scn_id
	AND spt_stu_id = studyId AND spt_sit_id = siteId AND (spt_spid LIKE CONCAT('%',filterBy,'%') OR scn_fname LIKE CONCAT('%',filterBy,'%') OR scn_lname LIKE CONCAT('%',filterBy,'%') OR scn_fgc_id LIKE CONCAT('%',filterBy,'%') OR PAT_AGE_CRITERIA LIKE CONCAT('%',filterBy,'%'))
	UNION	
    SELECT pen_enc_dt encounterDate, pen_event_name encounterType, pen_enc_reason encounterReason, scn_fname fname, scn_mi mi, scn_lname lname, scn_gender_curr gender, 
    scn_dob dob,scn_age age,scn_age_criteria ageCriteria,scn_fgc_id fgcId,SCN_RELATIONSHIP relation, NULL AS consentDate, NULL AS consentVersion, scn_mrn mrn, scn_fname spid, c.pen_id encounterId,
    b.spt_id studySiteParticipantId, pen_enc_sve_id studyVersionId, NULL AS enrollmentDate, PEN_LAST_CHANGE_DT lastEdited
	,spt_pat_id, b.sev_event_name, b.sev_short_cd,
	(SELECT elr_result_value  FROM encounter_lab_result WHERE elr_lbt_code = 'APRI'
    AND elr_pen_id = (SELECT pen_id FROM participant_encounters WHERE pen_spt_id = b.spt_id  
    AND pen_event_name = 'Day 0 Visit')) apri_val,		
    CASE WHEN (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) > 0 THEN 
    (SELECT COUNT(*) AS totalCount FROM encounter_data_details WHERE EDD_EDS_PEN_ID = c.pen_id ) ELSE 0 END AS issues , sev_event_order
    FROM (
		SELECT spt_id, sev_event_name, sev_short_cd ,
			pen_id , sev_event_order
			FROM study_events
			JOIN study_site_participants 
			LEFT JOIN (SELECT pen_id, pen_spt_id, pen_event_name, PEN_ENC_DT FROM participant_encounters) b ON pen_spt_id = spt_id AND pen_event_name = sev_event_name 
			ORDER BY study_site_participants.created_dt, IFNULL(PEN_ENC_DT, '2100-01-01')) b
    LEFT JOIN participant_encounters c ON b.pen_id = c.pen_id AND b.spt_id = c.pen_spt_id
	JOIN study_site_participants d ON d.spt_id = b.spt_id AND spt_pat_id IS NULL
    JOIN screening ON spt_scn_id = scn_id
	AND spt_stu_id = studyId AND spt_sit_id = siteId AND (spt_spid LIKE CONCAT('%',filterBy,'%') OR scn_fname LIKE CONCAT('%',filterBy,'%') OR scn_lname LIKE CONCAT('%',filterBy,'%') OR scn_fgc_id LIKE CONCAT('%',filterBy,'%') OR scn_age_criteria LIKE CONCAT('%',filterBy,'%'))
	ORDER BY 
		CASE WHEN sortBy='lastEdited ASC' THEN lastEdited END , -- studysiteparticipantId asc, IFNULL(encounterDate,'2100-01-01')  asc, sev_event_order asc,
		CASE WHEN sortBy='gender ASC' THEN gender END ASC,
		CASE WHEN sortBy='lastEdited DESC' THEN lastEdited END DESC,
		CASE WHEN sortBy='gender DESC' THEN gender END DESC,
		CASE WHEN sortBy='enrollmentDate ASC' THEN enrollmentDate END ASC,
		CASE WHEN sortBy='enrollmentDate DESC' THEN enrollmentDate END DESC,
        studysiteparticipantId , encounterDate IS NULL, encounterDate ASC, sev_event_order  ASC ) a
        limit start_pos, rec_cnt ;
        
END */$$
DELIMITER ;

/* Procedure structure for procedure `Study_GetAllTests` */

/*!50003 DROP PROCEDURE IF EXISTS  `Study_GetAllTests` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Study_GetAllTests`()
BEGIN
	SELECT TES_ID TestId, TES_TEST_CD TestCode, TES_TEST_NAMES TestName
    FROM tests where TES_STATUS = 'Active';
END */$$
DELIMITER ;

/* Procedure structure for procedure `Study_site_participants_update_spid` */

/*!50003 DROP PROCEDURE IF EXISTS  `Study_site_participants_update_spid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Study_site_participants_update_spid`(SPTID varchar(50))
BEGIN
    SELECT SPT_PAT_ID into @SPT_PAT_ID from  study_site_participants WHERE SPT_ID=SPTID;
    
		   if @SPT_PAT_ID is NOT null then
			begin
				 
                 SELECT PAT_PID INTO @PAT_PID from participants WHERE PAT_ID=@SPT_PAT_ID;
                 
                 IF @PAT_PID IS NOT NULL THEN
                 BEGIN
					UPDATE study_site_participants SET SPT_SPID=@PAT_PID where SPT_ID=SPTID;
                  
                 END;
                 END IF;
                 
			end;
			end if;
  END */$$
DELIMITER ;

/* Procedure structure for procedure `Summary_GetEncounterDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `Summary_GetEncounterDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Summary_GetEncounterDetail`(penId VARCHAR(16383))
SELECT data_capture_steps.DCS_DISPLAY_NAME AS formName,
    participant_crf_details.pcd_crf_status AS `status`,
    participant_crf_details.PCD_CRF_ENTRY_DT AS entryDate,
    LOWER(REPLACE(data_capture_steps.DCS_DISPLAY_NAME,' ','-'))  AS link,
    participant_encounters.PEN_EVENT_NAME AS encounterType,
    pcd_pen_id AS penId
    FROM participant_crf_details
    JOIN participant_encounters ON pen_id = participant_crf_details.pcd_pen_id
    JOIN crf_library  ON crf_library.crf_id = participant_crf_details.pcd_crf_id
    JOIN data_capture_steps ON data_capture_steps.DCS_STEP_CD = crf_library.CRF_SHORT_CODE
    WHERE FIND_IN_SET(pcd_pen_id,penId)
    ORDER BY entryDate asc */$$
DELIMITER ;

/* Procedure structure for procedure `Summary_GetEncounterSummary` */

/*!50003 DROP PROCEDURE IF EXISTS  `Summary_GetEncounterSummary` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Summary_GetEncounterSummary`(patId VARCHAR(36))
SELECT pen_id AS penId, pen_event_name AS visitType,
    pen_enc_dt visitDate FROM participant_encounters
    WHERE pen_spt_id IN (SELECT spt_id FROM study_site_participants
    WHERE spt_pat_id = patId) ORDER BY PEN_ENC_DT ASC */$$
DELIMITER ;

/* Procedure structure for procedure `Summary_GetMedicationDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `Summary_GetMedicationDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Summary_GetMedicationDetail`(penId VARCHAR(16383))
SELECT pm_medication AS `medication`, pm_dose AS `dose`, pm_units AS `unit`, 
pm_frequency AS `frequency`, pm_frequency_in AS `duration`, pm_pen_id AS `penId`
FROM participant_medication_history WHERE FIND_IN_SET(pm_pen_id,penId) 
ORDER BY pm_last_change_dt DESC */$$
DELIMITER ;

/* Procedure structure for procedure `Summary_GetOrderDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `Summary_GetOrderDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Summary_GetOrderDetail`(penId VARCHAR(16383))
SELECT t.tes_test_names AS `name`,e.eto_ord_place_dt AS `orderdate`, e.eto_ord_eff_dt AS `effectivedate`, e.eto_pen_id AS `penId` 
FROM encounter_test_orders e 
JOIN tests t ON e.eto_test_cd = t.tes_test_cd
WHERE FIND_IN_SET(e.eto_pen_id,penId)
ORDER BY eto_last_change_dt */$$
DELIMITER ;

/* Procedure structure for procedure `Summary_GetParticipantDischargeDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `Summary_GetParticipantDischargeDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Summary_GetParticipantDischargeDetail`(penId VARCHAR(16383))
SELECT PDC_EDC_PROVIDE AS VALUE, PDC_NOTE AS note, PDC_ECO_ID AS penId FROM participant_discharge WHERE FIND_IN_SET(PDC_ECO_ID,penId) */$$
DELIMITER ;

/* Procedure structure for procedure `Summary_GetPatientInfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `Summary_GetPatientInfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Summary_GetPatientInfo`(patId VARCHAR(36))
SELECT pat_id AS patId, CONCAT(pat_fname, ' ', pat_lname,' (',SPT_SPID,')') AS `name`,
    pat_gender_curr AS gender, pat_dob AS dob, spt_id AS studyParticipantId FROM participants
    JOIN study_site_participants ON pat_id=spt_pat_id WHERE pat_id = patId */$$
DELIMITER ;

/* Procedure structure for procedure `Summary_GetReferralDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `Summary_GetReferralDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Summary_GetReferralDetail`(penId VARCHAR(16383))
SELECT ERE_REF_CD AS `referral`, ere_ref_dt AS `referraldate`, ere_pen_id AS `penId`
FROM encounter_referrals
WHERE FIND_IN_SET(ere_pen_id,penId)
ORDER BY ere_ref_dt DESC */$$
DELIMITER ;

/* Procedure structure for procedure `Summary_GetSpecimenCollectionDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `Summary_GetSpecimenCollectionDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Summary_GetSpecimenCollectionDetail`(penId VARCHAR(16383))
SELECT specimen_type AS `type`, specimen_date AS collectionDate,
	specimen_sent_to AS labName, lab_result_date AS resultDate,
	encounter AS penId
	FROM specimen_tracking WHERE FIND_IN_SET(encounter,penId) ORDER BY collectionDate */$$
DELIMITER ;

/* Procedure structure for procedure `Sync_GetAll` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sync_GetAll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Sync_GetAll`(fromDate datetime)
BEGIN
	
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
    CALL Sync_GetJsonFromTable('medications', CONCAT('MED_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @medications);
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
    CALL Sync_GetJsonFromTable('encounter_lab_tests', CONCAT('ELT_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @encounter_lab_tests);
    CALL Sync_GetJsonFromTable('specimen_tracking', CONCAT('ST_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @specimen_tracking);
    CALL Sync_GetJsonFromTable('participant_procedure_history', CONCAT('PPH_LAST_CHANGE_DT >= ', '\'' , fromDate, '\''), @participant_procedure_history);
    
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
        @participant_discharge as participant_discharge,
        @encounter_lab_tests as encounter_lab_tests,
        @specimen_tracking as specimen_tracking,
        @participant_procedure_history as participant_procedure_history;
        
END */$$
DELIMITER ;

/* Procedure structure for procedure `Sync_GetAllPrimaryKeys` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sync_GetAllPrimaryKeys` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Sync_GetAllPrimaryKeys`(OUT results JSON)
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
        'participant_discharge', 'PDC_ID',
        'specimen_tracking','id',
        'encounter_lab_tests', 'ELT_ID',
		'participant_procedure_history', 'PPH_ID'
    );
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `Sync_GetJsonFromTable` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sync_GetJsonFromTable` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Sync_GetJsonFromTable`(pTableName text, whereCondi text, OUT outvar json)
BEGIN
	SET SESSION group_concat_max_len = 10000000;
	
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `Sync_Update` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sync_Update` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Sync_Update`(jsonData json)
BEGIN
	
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
    
    
    CALL Sync_GetAllPrimaryKeys(@primaryKeys);   
    
    
    WHILE ( counter < JSON_LENGTH(insertTblNames) ) DO

		
        SET @tblName = JSON_UNQUOTE(JSON_EXTRACT(insertTblNames, CONCAT( '$[', counter, ']')));

        
        SET @tblPrimaryKey = JSON_UNQUOTE(JSON_EXTRACT(@primaryKeys, CONCAT( '$.', @tblName)));
        SET dataCounter = 0;
        
        SET @tblData = JSON_UNQUOTE(JSON_EXTRACT(insertData, CONCAT( '$.', @tblName)));


        WHILE ( dataCounter < JSON_LENGTH(@tblData) ) DO

            SET @tblRec = JSON_UNQUOTE(JSON_EXTRACT(@tblData, CONCAT( '$[', dataCounter, ']')));

            
            SET @tblPrimaryValue = JSON_UNQUOTE(JSON_EXTRACT(@tblRec, CONCAT( '$.', @tblPrimaryKey)));
            
            
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

			WHILE ( @columnCounter < JSON_LENGTH(@columnsArray) ) DO
				
				IF @countRec = 0 THEN
					
					IF @column = '' then
						SET @column = JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']')));
						SET @value = JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']'));
					ELSE
						SET @column = REPLACE(TRIM(CONCAT(@column,'~',JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']'))))), '~', ',');
						SET @value = REPLACE(TRIM(CONCAT(@value,'~',JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']')))), '~', ',');
					END IF;
				ELSE
					
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
				
					
                                     
               	
				SET @insertQuery = CONCAT('INSERT INTO ', @tblName, ' (', @column, ') VALUES (', @value, ')');
				
				PREPARE statement FROM @insertQuery;
				EXECUTE statement;
				DEALLOCATE PREPARE statement;
                                	
                                
            ELSE
				
				SET @updateQuery = CONCAT('UPDATE ', @tblName,' SET ', @columnValue, ' WHERE ', @tblPrimaryKey, ' = "', @tblPrimaryValue, '";');
				
				PREPARE statement FROM @updateQuery;
				EXECUTE statement;    
				DEALLOCATE PREPARE statement;
            END IF;
            
			SET dataCounter = dataCounter + 1;
            
		END WHILE;
        
		SET counter = counter + 1;
	END WHILE;
    
    
    
    SET counter = 0;
    SET dataCounter = 0;
    
    WHILE ( counter < JSON_LENGTH(deleteTblNames) ) DO
		
        SET @tblName = JSON_UNQUOTE(JSON_EXTRACT(deleteTblNames, CONCAT( '$[', counter, ']')));
        
        
        SET @tblPrimaryKey = JSON_UNQUOTE(JSON_EXTRACT(@primaryKeys, CONCAT( '$.', @tblName)));
        
        
        SET @tblData = JSON_UNQUOTE(JSON_EXTRACT(deleteData, CONCAT( '$.', @tblName)));
        
        WHILE ( dataCounter < JSON_LENGTH(@tblData) ) DO
            
            
            SET @tblPrimaryValue = JSON_UNQUOTE(JSON_EXTRACT(@tblData, CONCAT( '$[', dataCounter, ']')));
            
            
            SET @deleteQuery = CONCAT('DELETE FROM ', @tblName, ' WHERE ', @tblPrimaryKey, ' = "', @tblPrimaryValue, '";');
            
            PREPARE statement FROM @deleteQuery;
			EXECUTE statement;
			DEALLOCATE PREPARE statement;
            SET dataCounter = dataCounter + 1;
            
        END WHILE;
        SET counter = counter + 1;
        
    END WHILE;
    
    
    SET @deviceId = JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT( '$.device.DEVICEID')));
    
    SELECT SYN_ID into @syncId from sync_database where DEVICEID = @deviceId;
    
    IF (@syncId IS NULL || @syncId = '' ) THEN
		INSERT INTO sync_database ( SYN_ID, DEVICEID ) VALUES (uuid(), @deviceId);
    ELSE 
		UPDATE sync_database SET LAST_UPDATED_DATE = NOW() WHERE SYN_ID = @syncId;
    END IF;
    
    SELECT * from sync_database where DEVICEID = @deviceId;
    


	SET SESSION FOREIGN_KEY_CHECKS = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Sync_Update_Unique_SPID` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sync_Update_Unique_SPID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Sync_Update_Unique_SPID`(jsonData json)
BEGIN
	
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
    
    
    CALL Sync_GetAllPrimaryKeys(@primaryKeys);   
    
    
    WHILE ( counter < JSON_LENGTH(insertTblNames) ) DO

		
        SET @tblName = JSON_UNQUOTE(JSON_EXTRACT(insertTblNames, CONCAT( '$[', counter, ']')));

        
        SET @tblPrimaryKey = JSON_UNQUOTE(JSON_EXTRACT(@primaryKeys, CONCAT( '$.', @tblName)));
        SET dataCounter = 0;
        
        SET @tblData = JSON_UNQUOTE(JSON_EXTRACT(insertData, CONCAT( '$.', @tblName)));


        WHILE ( dataCounter < JSON_LENGTH(@tblData) ) DO

            SET @tblRec = JSON_UNQUOTE(JSON_EXTRACT(@tblData, CONCAT( '$[', dataCounter, ']')));

            
            SET @tblPrimaryValue = JSON_UNQUOTE(JSON_EXTRACT(@tblRec, CONCAT( '$.', @tblPrimaryKey)));
            
            
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

			WHILE ( @columnCounter < JSON_LENGTH(@columnsArray) ) DO
				
				IF @countRec = 0 THEN
					
					IF @column = '' then
						SET @column = JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']')));
						SET @value = JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']'));
					ELSE
						SET @column = REPLACE(TRIM(CONCAT(@column,'~',JSON_UNQUOTE(JSON_EXTRACT(@columnsArray, CONCAT( '$[', @columnCounter, ']'))))), '~', ',');
						SET @value = REPLACE(TRIM(CONCAT(@value,'~',JSON_EXTRACT(@valuesArray, CONCAT( '$[', @columnCounter, ']')))), '~', ',');
					END IF;
				ELSE
					
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
					
                        CALL Study_site_participants_update_spid(@tblPrimaryValue);
                    
                    END;
					END IF;
                                
            ELSE
				
				SET @updateQuery = CONCAT('UPDATE ', @tblName,' SET ', @columnValue, ' WHERE ', @tblPrimaryKey, ' = "', @tblPrimaryValue, '";');
				
				PREPARE statement FROM @updateQuery;
				EXECUTE statement;    
				DEALLOCATE PREPARE statement;
                
                IF lower(@tblName) = 'study_site_participants' THEN
                    BEGIN
                  					
                        CALL Study_site_participants_update_spid(@tblPrimaryValue);
                    
                    END;
					END IF;
            END IF;
            
			SET dataCounter = dataCounter + 1;
            
		END WHILE;
        
		SET counter = counter + 1;
	END WHILE;
    
    
    
    SET counter = 0;
    SET dataCounter = 0;
    
    WHILE ( counter < JSON_LENGTH(deleteTblNames) ) DO
		
        SET @tblName = JSON_UNQUOTE(JSON_EXTRACT(deleteTblNames, CONCAT( '$[', counter, ']')));
        
        
        SET @tblPrimaryKey = JSON_UNQUOTE(JSON_EXTRACT(@primaryKeys, CONCAT( '$.', @tblName)));
        
        
        SET @tblData = JSON_UNQUOTE(JSON_EXTRACT(deleteData, CONCAT( '$.', @tblName)));
        
        WHILE ( dataCounter < JSON_LENGTH(@tblData) ) DO
            
            
            SET @tblPrimaryValue = JSON_UNQUOTE(JSON_EXTRACT(@tblData, CONCAT( '$[', dataCounter, ']')));
            
            
            SET @deleteQuery = CONCAT('DELETE FROM ', @tblName, ' WHERE ', @tblPrimaryKey, ' = "', @tblPrimaryValue, '";');
            
            PREPARE statement FROM @deleteQuery;
			EXECUTE statement;
			DEALLOCATE PREPARE statement;
            SET dataCounter = dataCounter + 1;
            
        END WHILE;
        SET counter = counter + 1;
        
    END WHILE;
    
    
    SET @deviceId = JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT( '$.device.DEVICEID')));
    
    SELECT SYN_ID into @syncId from sync_database where DEVICEID = @deviceId;
    
    IF (@syncId IS NULL || @syncId = '' ) THEN
		INSERT INTO sync_database ( SYN_ID, DEVICEID ) VALUES (uuid(), @deviceId);
    ELSE 
		UPDATE sync_database SET LAST_UPDATED_DATE = NOW() WHERE SYN_ID = @syncId;
    END IF;
    
    SELECT * from sync_database where DEVICEID = @deviceId;
    


	SET SESSION FOREIGN_KEY_CHECKS = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `test` */

/*!50003 DROP PROCEDURE IF EXISTS  `test` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `test`(
start_sr int,
end_sr int)
BEGIN
select * from screening  limit start_sr, end_sr; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `teste` */

/*!50003 DROP PROCEDURE IF EXISTS  `teste` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `teste`()
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
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `TEST_procedure` */

/*!50003 DROP PROCEDURE IF EXISTS  `TEST_procedure` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `TEST_procedure`()
BEGIN
DECLARE TEMP_INSERT VARCHAR(500) DEFAULT NULL;
                
                INSERT INTO api_logs (ID,USER_ID,LOG_DATE,LOG_TITLE,record_status)
                VALUES(uuid(),'79edc2fd-843a-11e8-9538-00155d0a851b', curDate(),'test','a');
                select last_insert_id() as insertedId;
                
				DEALLOCATE PREPARE statement;
                
                
END */$$
DELIMITER ;

/* Procedure structure for procedure `Users_GetById` */

/*!50003 DROP PROCEDURE IF EXISTS  `Users_GetById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Users_GetById`(userId varchar(36))
BEGIN
    SELECT USR_ID as id, USR_DISPLAY_TXT as fullName, USR_EMAIL as email, USR_STATUS as status, USR_TYPE as type, USR_UNAME as username 
    FROM users 
    WHERE USR_ID = userId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Users_SignIn` */

/*!50003 DROP PROCEDURE IF EXISTS  `Users_SignIn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `Users_SignIn`(tenantId varchar(36), uname varchar(100), pwd varchar(100))
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `User_CheckEmail` */

/*!50003 DROP PROCEDURE IF EXISTS  `User_CheckEmail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `User_CheckEmail`(uname varchar(100))
BEGIN
	SELECT USR_ID as id, USR_EMAIL as email from users WHERE USR_UNAME = uname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `User_Check_Token` */

/*!50003 DROP PROCEDURE IF EXISTS  `User_Check_Token` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `User_Check_Token`(tk varchar(100))
BEGIN
	        
    SELECT RSE_USR_ID as usrId , RSE_LAST_CHANGE_DT as  lastDate from reset_password WHERE RSE_RESET_TOKEN = tk;
   
END */$$
DELIMITER ;

/* Procedure structure for procedure `User_GetAll` */

/*!50003 DROP PROCEDURE IF EXISTS  `User_GetAll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `User_GetAll`()
BEGIN
	SELECT USR_ID uuid, USR_UNAME uname, USR_DISPLAY_TXT fullname, USR_EMAIL email, USR_TYPE utype, USR_STATUS ustatus
    FROM users;
END */$$
DELIMITER ;

/* Procedure structure for procedure `User_GetDetailsById` */

/*!50003 DROP PROCEDURE IF EXISTS  `User_GetDetailsById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `User_GetDetailsById`(uu_id varchar(36))
BEGIN
	SELECT USR_ID uuid, USR_DISPLAY_TXT fullname, USR_TYPE utype, USR_STATUS ustatus
    FROM users WHERE USR_ID = uu_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `User_Registration_Data` */

/*!50003 DROP PROCEDURE IF EXISTS  `User_Registration_Data` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `User_Registration_Data`(tenantId varchar(36),siteId varchar(36), studyId varchar(36),pwd varchar(50), query JSON)
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
			-- `USR_UNAME` = uname,
			`USR_DISPLAY_TXT` = fullname,
			-- `USR_EMAIL` = useremail,
			`USR_TYPE` = utype,
            `USR_STATUS` = ustatus,
            `USR_LAST_CHANGE_DT`= now()
			WHERE `USR_ID` = uu_ID;
		end;
	end if;
  select resID as InsertedID;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `User_Reset_Password` */

/*!50003 DROP PROCEDURE IF EXISTS  `User_Reset_Password` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `User_Reset_Password`(usrId varchar(36), pwd varchar(50))
BEGIN
	    
    DECLARE resID varchar(36) default 0;
   
   	update users set usr_password = sha1(pwd), usr_last_change_dt = now() where usr_id = usrId;
    
	set resID =  usrId;
	select resID as InsertedID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `User_Reset_token` */

/*!50003 DROP PROCEDURE IF EXISTS  `User_Reset_token` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`hepcmysql`@`%` PROCEDURE `User_Reset_token`(uname varchar(100) , token varchar(100))
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
    
    
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
