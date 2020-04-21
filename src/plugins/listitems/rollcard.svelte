<script>
  export let item;
  export let w;
  export let id;
  let selectedCard;
  $: if (item.id === id) {
    setTimeout(() => {
      selectedCard && selectedCard.focus();
    }, 0);
  }
</script>

<style lang="scss">
  @import "../../style/global/index";
  $cardheight: 125px;
  .c-mdi-gen-m:before {
    content: "\F29D";
    font-size: 30px;
  }
  .c-mdi-gen-f:before {
    content: "\F29C";
    font-size: 30px;
  }
  .card {
    &.card-tile {
      color: $on-surface;
      cursor: pointer;
      height: $cardheight;
      padding: 4px;
      margin: 4px;
      border: 1px solid $border-main;
      box-shadow: 0 1px 10px rgba(0, 0, 0, 0.05), 0 1px 2px rgba(0, 0, 0, 0.1);

      &:focus {
        border-bottom: 4px solid $primary !important;
        padding-bottom: 1px;
      }
      &:hover {
        text-decoration: none;
        .card-body {
          -webkit-animation-duration: 0.5s;
          animation-duration: 0.5s;
          -webkit-animation-fill-mode: both;
          animation-fill-mode: both;
          animation-name: pulse;
          -webkit-animation-name: pulse;
          z-index: 1;
        }
      }

      .card-body {
        animation-duration: 0.3s;
        animation-name: fadeIn;
        padding: 10px;
        h4 {
          text-transform: capitalize;
          padding-top: 2px;
        }
      }
    }
  }
</style>

<!-- svelte-disable a11y-autofocus -->
<a
  id={item.id}
  class="card card-tile"
  data-testid="entity-card"
  href="/pipeline/{item.id}"
  style="width:{w}px"
  sapper-noscroll
  bind:this={selectedCard}>
  <div class="card-body inner">
    <h4>{item.unique}</h4>
    <div class="container">
      <div class="row">
        <div class="col-2 p-0">
          <span class="mdi c-mdi-gen-{item.gender.toLowerCase()}" />
        </div>
        <div class="col-10">
          <div class="row">
            <div class="col-4 font-weight-bold">INIT</div>
            <div class="col-8 font-weight-bold">ENROLL DT</div>
          </div>
          <div class="row">
            <div class="col-4">{item.initials}</div>
            <div class="col-8">{item.enrollmentDate}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</a>
