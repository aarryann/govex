<script>
  import Card from "./rollcard.svelte";
  export let data;
  export let id;
  export let config;
  export let containerWidth;
  let scrollMargin = 0;
  let m = config.margin;
  let cw = config.cardwidth;
  // NOTE: For some reason when the containerWidth used as is, causes a screen flicker when container is resized
  // NOTE: Subtracting container width by atleast 1 eliminates the screen flicker
  $: bw = containerWidth - 20;
  // bw/cw = ContainerWidth / Width of a card = number of cards in a row
  // ParseInt converts it into a whole number of cards per row
  // While doing it ensures atleast 1 card per row with minimum card / board width
  // Container width / number of cards then gives the card width required for whole number of cards at any given point
  $: w =
    Math.max(bw / Math.max(parseInt(bw / cw), 1), config.minboardwidth) - 2 * m;
  // first time when container width not available
  $: if (isNaN(w)) {
    w = cw;
  }
</script>

<style lang="scss">
  @import "../../style/global/index";
  /* min-width allows for faster resizing to smaller sizes */
  .list-roll {
    @include flexbox;
    @include flex-flow(row wrap);
  }
</style>

<div class="list-roll">
  {#each data as item, i (item.id)}
    <Card {item} {w} {id} />
  {/each}

</div>
