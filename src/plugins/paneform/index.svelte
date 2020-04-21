<script>
  import { onMount } from "svelte";

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

{#if !isNaN(id)}
  <div id="handler" class="handler" bind:this={handler} />
  <div id="pane" class="pane" bind:this={pane} />
{/if}
