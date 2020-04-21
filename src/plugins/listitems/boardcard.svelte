<script>
  export let item;
</script>

<style lang="scss">
  @import "../../style/global/index";
  $cardheight: 65px;
  .card {
    &:focus {
      border: 2px solid $primary;
    }
    &:hover {
      border: 2px solid $primary;
    }
    &.card-tile {
      color: $on-surface;
      cursor: pointer;
      height: $cardheight;
      padding: 4px;
      border: 1px solid $border-main;

      &:hover {
        text-decoration: none;
      }

      .card-body {
        animation-duration: 0.3s;
        animation-name: fadeIn;
        padding: 10px;
        h4 {
          text-transform: capitalize;
        }
      }
    }
  }
</style>

<a
  id={item.id}
  class="card card-tile draggable"
  data-testid="entity-card"
  href="/pipeline/{item.id}"
  sapper-noscroll>
  <div class="card-body inner">
    <h4>{item.unique}</h4>
  </div>
</a>
