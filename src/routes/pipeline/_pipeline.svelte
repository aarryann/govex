<script context="module">
  export function preload(page, session) {
    if (!session || !session.user) this.redirect(302, "/");
  }
</script>

<script>
  import config from "./_config";
  import PageHeader from "../../components/controls/list-page-header.svelte";
  import ListItems from "../../plugins/listitems/index.svelte";
  import Pane from "../../plugins/paneform/index.svelte";

  import data from "../../../data/listpatients.js";
  import sortData from "../../../data/dogs.js";

  export let id = undefined;
  const {
    pagetitle,
    headertitle,
    cardheight,
    cardwidth,
    minboardwidth,
    viewtype
  } = config;
</script>

<style>
  .content-body {
    display: flex;
  }
</style>

<svelte:head>
  <title>{pagetitle}</title>
</svelte:head>

<PageHeader {sortData} {headertitle} view={viewtype} />

<div class="content-body list-container animated hide">
  <ListItems {data} view={viewtype} {config} {id} />
  <Pane {id} />

</div>
