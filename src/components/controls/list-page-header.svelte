<script>
  import { goto, stores } from "@sapper/app";
  import { ListConstants } from "../../conf/config";
  export let headertitle;
  export let sView;
  export let headerAddon;
</script>

<style lang="scss">
  @import "../../style/global/index";
  .active {
    color: #fff;
    background-color: #7987a1 !important;
    box-shadow: none !important;
  }
  .dashboard-header {
    background: $surface;
    border-radius: 2px;
    padding: 20px;
    margin: 0 4px 20px 4px;
    border: 1px solid $border-main;
    box-shadow: 0 1px 10px rgba(0, 0, 0, 0.05), 0 1px 2px rgba(0, 0, 0, 0.1);
  }
</style>

<div class="dashboard-header d-flex flex-column grid-margin">
  <div class="d-flex align-items-center justify-content-between flex-wrap">
    <div class="d-flex align-items-center">
      <h4 class="mb-0 font-weight-bold">{headertitle}</h4>
      <button class="btn btn-inverse-info tx-12 btn-sm btn-rounded mx-3">
        Add New
      </button>
    </div>
    <div
      class="d-md-flex ml-2 align-items-center justify-content-between flex-wrap">
      <div class="d-flex mt-3 mt-lg-0">
        <div
          class="btn-group mt-3 mt-md-0"
          role="group"
          aria-label="Button group">
          <button
            type="button"
            on:click|preventDefault={e => {
              sView.set(ListConstants.VIEW_TYPE_ROLL);
              goto('/pipeline');
            }}
            class:active={$sView === ListConstants.VIEW_TYPE_ROLL}
            class="btn btn-outline-secondary border">
            <i class="mdi mdi-view-grid text-body" />
          </button>
          <button
            type="button"
            on:click|preventDefault={e => {
              sView.set(ListConstants.VIEW_TYPE_BOARD);
              goto('/pipeline');
            }}
            class:active={$sView === ListConstants.VIEW_TYPE_BOARD}
            class="btn btn-outline-secondary border">
            <i class="mdi mdi-view-week text-body" />
          </button>
          <button
            type="button"
            on:click|preventDefault={e => {
              sView.set(ListConstants.VIEW_TYPE_LIST);
              goto('/pipeline');
            }}
            class:active={$sView === ListConstants.VIEW_TYPE_LIST}
            class="btn btn-outline-secondary border">
            <i class="mdi mdi-view-list text-body" />
          </button>
        </div>
      </div>
    </div>
    <div class="d-flex col">
      {#if headerAddon}
        <svelte:component this={headerAddon} />
      {/if}
    </div>
  </div>
</div>
