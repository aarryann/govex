<script>
  import { onMount } from "svelte";
  import { sPipelineViewType } from "../../stores";
  import { TitleConstants } from "../../conf/constants";
  import PageHeader from "../../components/controls/list-page-header.svelte";
  import ListItems from "../../components/listitems/index.svelte";

  import data from "../../../data/listpatients.js";
  import sortList from "../../../data/dogs.js";

  let title = TitleConstants.TITLE_PIPELINE;
  let siteTitle = TitleConstants.TITLE_SITE;
  let config = { cardheight: 125, cardwidth: 220, minBoardWidth: 20 };

  export let id = undefined;

  let handler, pane;
  let isHandlerDragging = false;
  onMount(() => {
    if (!isNaN(id)) {
      handler.addEventListener("mousedown", startDrag, false);
      window.addEventListener("mouseup", endDrag, false);
    }
  });

  function startDrag(event) {
    event.preventDefault();
    window.addEventListener("mousemove", drag, false);
    isHandlerDragging = true;
  }

  function endDrag(event) {
    event.preventDefault();
    window.removeEventListener("mousemove", drag, false);
    isHandlerDragging = false;
  }

  function drag(event) {
    event.preventDefault();
    if (!isHandlerDragging) {
      return false;
    }
    var currentWidth = pane.offsetWidth;
    var currentLeft = pane.offsetLeft;
    pane.style.width = currentWidth - (event.clientX - currentLeft + 8) + "px";
  }
</script>

<style>
  .content-body {
    display: flex;
  }

  .pane {
    /* transition: width 0.5s; */
    min-width: 20px;
    /* width: 0px; */
  }

  .handler {
    width: 20px;
    cursor: ew-resize;
    padding: 0;
    flex: 0 0 auto;
  }

  .handler::before {
    content: "";
    display: block;
    width: 4px;
    height: 100%;
    background: #7571f9;
    margin: 0 auto;
  }
</style>

<svelte:head>
  <title>{title} - {siteTitle}</title>
</svelte:head>

<PageHeader {sortList} {title} view={sPipelineViewType} />

<div class="content-body list-container animated hide">
  <ListItems {data} view={sPipelineViewType} {config} />
  {#if !isNaN(id)}
    <div id="handler" class="handler" bind:this={handler} />
    <div id="pane" class="pane" bind:this={pane} />
  {/if}
</div>
