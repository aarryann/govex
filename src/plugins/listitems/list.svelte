<script>
  import Card from "./rollcard.svelte";
  export let data;
  export let config;
  let h = config.cardheight;
  let w = config.cardwidth;
</script>

<style lang="scss">
  @import "../../style/global/index";
  .panel {
    background: $surface;
    border: 1px solid $border-main;
    border-radius: 2px;
    padding: 20px;
    margin: 0 4px 20px 4px;
    box-shadow: 0 1px 10px rgba(0, 0, 0, 0.05), 0 1px 2px rgba(0, 0, 0, 0.1);
  }
  .table-striped tr:nth-of-type(odd) {
    background-color: $secondary;
  }
  .table-hover tbody tr:hover {
    background-color: #eaeaf1;
  }
</style>

<div class="panel">
  <div class="list-roll">
    <table
      id="order-listing"
      class="table dataTable no-footer table-striped table-bordered table-hover"
      role="grid"
      aria-describedby="order-listing_info">
      <thead>
        <tr role="row">
          <th
            class="sorting_asc"
            tabindex="0"
            aria-controls="order-listing"
            rowspan="1"
            colspan="1"
            aria-sort="ascending"
            aria-label="Order #: activate to sort column descending"
            style="width: 100.016px;">
            Order #
          </th>
          <th
            class="sorting"
            tabindex="0"
            aria-controls="order-listing"
            rowspan="1"
            colspan="1"
            aria-label="Purchased On: activate to sort column ascending"
            style="width: 162.016px;">
            Purchased On
          </th>
          <th
            class="sorting"
            tabindex="0"
            aria-controls="order-listing"
            rowspan="1"
            colspan="1"
            aria-label="Customer: activate to sort column ascending"
            style="width: 121.016px;">
            Customer
          </th>
          <th
            class="sorting"
            tabindex="0"
            aria-controls="order-listing"
            rowspan="1"
            colspan="1"
            aria-label="Ship to: activate to sort column ascending"
            style="width: 102.016px;">
            Ship to
          </th>
          <th
            class="sorting"
            tabindex="0"
            aria-controls="order-listing"
            rowspan="1"
            colspan="1"
            aria-label="Base Price: activate to sort column ascending"
            style="width: 131.016px;">
            Base Price
          </th>
          <th
            class="sorting"
            tabindex="0"
            aria-controls="order-listing"
            rowspan="1"
            colspan="1"
            aria-label="Purchased Price: activate to sort column ascending"
            style="width: 187.016px;">
            Purchased Price
          </th>
          <th
            class="sorting"
            tabindex="0"
            aria-controls="order-listing"
            rowspan="1"
            colspan="1"
            aria-label="Status: activate to sort column ascending"
            style="width: 92.0156px;">
            Status
          </th>
          <th
            class="sorting"
            tabindex="0"
            aria-controls="order-listing"
            rowspan="1"
            colspan="1"
            aria-label="Actions: activate to sort column ascending"
            style="width: 103.016px;">
            Actions
          </th>
        </tr>
      </thead>
      <tbody>
        {#each data as item, i (item.id)}
          <tr role="row">
            <td class="sorting_1">
              {item.unique}
              <input type="hidden" bind:value={item.id} />
            </td>
            <td>{item.enrollmentDate}</td>
            <td>{item.gender}</td>
            <td>{item.initials}</td>
            <td>{item.visit}</td>
            <td>{item.status}</td>
            <td>
              <label class="badge badge-info">{item.status}</label>
            </td>
            <td>
              <button class="btn btn-outline-primary">View</button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</div>
