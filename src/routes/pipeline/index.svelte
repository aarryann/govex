<script context="module">
  export function preload(page, session) {
    if (!session || !session.user) this.redirect(302, "/");
  }
</script>

<script>
  import { sPipelineViewType } from "../../stores";
  import { TitleConstants } from "../../conf/constants";
  import data from "../../../data/listpatients.js";
  import sortList from "../../../data/dogs.js";
  import PageHeader from "../../components/controls/list-page-header.svelte";
  import ListItems from "../../components/listitems/index.svelte";

  let title = TitleConstants.TITLE_PIPELINE;
  let config = { cardheight: 125, cardwidth: 220, minBoardWidth: 20 };
</script>

<svelte:head>
  <title>{title} - EDAC</title>
</svelte:head>
<PageHeader {sortList} {title} view={sPipelineViewType} />
<ListItems {data} view={sPipelineViewType} {config} />
