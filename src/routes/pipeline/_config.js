import { TitleConstants, ListConstants } from "../../conf/config";
import { writable } from "svelte/store";

export default {
  pagetitle: `${TitleConstants.TITLE_PIPELINE} - ${TitleConstants.TITLE_SITE}`,
  headertitle: TitleConstants.TITLE_PIPELINE,
  cardheight: 125,
  cardwidth: 220,
  minboardwidth: 20,
  viewtype: writable(ListConstants.VIEW_TYPE_ROLL)
};