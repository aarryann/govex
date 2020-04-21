<script>
  import { ListConstants } from "../../conf/config";
  export let title;
</script>

<style>
  .dashboard-header {
    background: #fff;
    border: 1px solid #eaeaea;
    border-radius: 2px;
    padding: 20px;
  }
</style>

<div class="dashboard-header d-flex flex-column grid-margin">
  <div class="d-flex align-items-center justify-content-between flex-wrap">
    <div class="d-flex align-items-center">
      <h4 class="mb-0 font-weight-bold">{title}</h4>
    </div>
  </div>
</div>
