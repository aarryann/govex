<script>
  import Ac from "../controls/ac.svelte";
  import sortData from "../../../data/dogs.js";

  export let placeholder;
</script>

<style lang="scss">
  @import "../../style/global/index";
  :global(#navsearch-tag-list) {
    border: 0;
  }
</style>

<Ac id="navsearch" listSort={sortData} {placeholder} />
