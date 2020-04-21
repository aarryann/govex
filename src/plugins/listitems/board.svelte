<script>
  import { onMount } from "svelte";
  import Card from "./boardcard.svelte";
  export let data;
  export let config;
  let h = config.cardheight;
  let w = config.cardwidth;
  let dragged;
  onMount(() => {
    /* events fired on the draggable target */
    // window.addEventListener("drag", function(event) {}, false);

    window.addEventListener(
      "dragstart",
      function(event) {
        // store a ref. on the dragged elem
        dragged = event.target;
        // event.originalEvent.dataTransfer.setData("text/plain", event.target.id);
        // make it half transparent
        event.target.style.opacity = 0.5;
      },
      false
    );

    window.addEventListener(
      "dragend",
      function(event) {
        // reset the transparency
        event.target.style.opacity = "";
      },
      false
    );

    /* events fired on the drop targets */
    window.addEventListener(
      "dragover",
      function(event) {
        // prevent default to allow drop
        event.preventDefault();
      },
      false
    );

    window.addEventListener(
      "dragenter",
      function(event) {
        // highlight potential drop target when the draggable element enters it
        if (event.target.classList.contains("dropzone")) {
          event.target.style.background = "purple";
          // event.target.classList.add("dragover");
        } else if (event.target.classList.contains("draggable")) {
          // console.log(event.target.parentNode);
        }
      },
      false
    );

    window.addEventListener(
      "dragleave",
      function(event) {
        // reset background of potential drop target when the draggable element leaves it
        if (event.target.classList.contains("dropzone")) {
          event.target.style.background = "";
          // event.target.classList.remove("dragover");
        }
      },
      false
    );

    window.addEventListener(
      "drop",
      function(event) {
        // prevent default action (open as link for some elements)
        event.preventDefault();
        let dropzone = event.target.closest(".dropzone");
        // move dragged elem to the selected drop target
        if (!dropzone) return false;
        else if (dropzone.id === dragged.parentNode.id) {
          let dropelement = event.target.closest(".draggable");
          if (!dropelement || dropelement.id === dragged.id) return false;
          else {
            dropzone.style.background = "";
            dragged.parentNode.removeChild(dragged);
            dropzone.insertBefore(dragged, dropelement);
          }
        } else {
          dropzone.style.background = "";
          dragged.parentNode.removeChild(dragged);
          dropzone.appendChild(dragged);
        }
      },
      false
    );
  });
</script>

<style lang="scss">
  @import "../../style/global/index";
  .board {
    flex: 1 1 auto;
    border: 1px solid #eaeaea;
    margin: 0;
    padding: 0;
    height: 100%;
  }
  .title {
    font-size: 24px;
    text-align: center;
    padding: 2px 0px;
    height: 45px;
    background: #ffffff;
  }
  div:nth-of-type(4n + 1) .title {
    border-bottom: 2px solid #62cb31;
  }
  div:nth-of-type(4n + 2) .title {
    border-bottom: 2px solid #3498db;
  }
  div:nth-of-type(4n + 3) .title {
    border-bottom: 2px solid #ffb606;
  }
  div:nth-of-type(4n) .title {
    border-bottom: 2px solid #e74c3c;
  }
</style>

<div id="todo" class="board dropzone">
  <div class="title">Todo</div>
  {#each data as item, i (item.id)}
    <Card {item} />
  {/each}
</div>
<div id="inprogress" class="board dropzone">
  <div class="title">In Progress</div>
</div>
<div id="done" class="board dropzone">
  <div class="title">Done</div>
</div>
