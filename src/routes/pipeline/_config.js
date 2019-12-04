import { TitleConstants, ListConstants } from "../../conf/config";
import { writable } from "svelte/store";

export default {
  pagetitle: `${TitleConstants.TITLE_PIPELINE} - ${TitleConstants.TITLE_SITE}`,
  headertitle: TitleConstants.TITLE_PIPELINE,
  cardheight: 125,
  cardwidth: 220,
  margin: 4,
  minboardwidth: 20,
  sView: writable(ListConstants.VIEW_TYPE_ROLL)
};
