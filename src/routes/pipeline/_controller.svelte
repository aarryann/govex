<script context="module">
  export function preload(page, session) {
    if (!session || !session.user) this.redirect(302, "/");
  }
</script>

<script>
  import config from "./_config";
  import { ListConstants as LC } from "../../conf/config";
  import { sHeaderAddon } from "../../stores.js";
  import PageHeader from "../../components/controls/list-page-header.svelte";
  import Roll from "../../plugins/listitems/roll.svelte";
  import Board from "../../plugins/listitems/board.svelte";
  import List from "../../plugins/listitems/list.svelte";
  import ListHeader from "../../plugins/listitems/listheader.partial.svelte";
  import Pane from "../../plugins/paneform/index.svelte";

  import data from "../../../data/listpatients.js";
  import sortData from "../../../data/dogs.js";

  export let id = undefined;
  let containerWidth;
  const {
    pagetitle,
    headertitle,
    cardheight,
    cardwidth,
    minboardwidth,
    sView
  } = config;

  const options = {};
  options[LC.VIEW_TYPE_ROLL] = { component: Roll, data };
  options[LC.VIEW_TYPE_BOARD] = { component: Board, data };
  options[LC.VIEW_TYPE_LIST] = { component: List, header: ListHeader, data };

  let viewType = $sView;
  let selected = options[$sView];
  sView.subscribe(current => {
    viewType = current;
    selected = options[current];
    if (viewType === LC.VIEW_TYPE_BOARD) {
      sHeaderAddon.set(ListHeader);
    }
  });
</script>

<style>
  .content-body {
    display: flex;
  }
  /* min-width allows for faster resizing to smaller sizes */
  .content-section {
    min-width: 100px;
    flex: 1;
    display: flex;
  }
  .wrapper {
    display: flex;
    flex: 1;
    border: none;
    margin: 0;
    padding: 0;
    overflow-y: auto;
    max-height: calc(100vh - 242px);
  }
</style>

<svelte:head>
  <title>{pagetitle}</title>
</svelte:head>

<PageHeader {headertitle} {sView} headerAddon={selected.header} />

<div class="content-body list-container animated hide">
  <section bind:offsetWidth={containerWidth} class="content-section">
    <div class="wrapper">
      <svelte:component
        this={selected.component}
        data={selected.data}
        {config}
        {containerWidth}
        {id} />
    </div>
  </section>

  <Pane {id} />

</div>
