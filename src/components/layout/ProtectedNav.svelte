<script>
  import { setContext } from "svelte";
  import { goto, stores } from "@sapper/app";
  import { GetGroupNav } from "../../conf/nav";
  import { sNavItems } from "../../stores";
  import NavSearch from "./NavSearch.svelte";

  export let segment;
  let navItems = GetGroupNav();
  $: selected = segment == undefined ? "dashboard" : segment;
  const unsubscribe = sNavItems.subscribe(value => {
    navItems = value;
  });

  const { page, preloading, session } = stores();

  const decorateOption = item => {
    // All items start with a "/", so ignore "/" while returning
    return !item || item.length == 1
      ? "Dashboard"
      : item.charAt(1).toUpperCase() + item.slice(2);
  };

  const changeSearchEntity = item => {
    searchEntity = item;
  };

  const logout = async () => {
    const r = await fetch(`/auth/logout`, {
      credentials: "include"
    });

    if (r.ok) $session.user = null;
    goto("/home");
  };
</script>

<style lang="scss">
  .navbar {
    border-bottom: 1px solid #eaeaea;
    .navbar-brand-wrapper {
      width: 180px;
      height: 56px;
      background: #f7f9fa;
      border-right: 1px solid #eaeaea;
    }
    .navbar-menu-wrapper {
      height: 56px;
      width: calc(100% - 360px);
      padding-left: 0;
      box-shadow: none;
      .navbar-nav .nav-item.nav-search {
        margin-left: 0;
        .input-group {
          padding-left: 5px;
          border: 0;
          background: transparent;
        }
      }
    }
    .navbar-header-link {
      padding: 6px;
      border-right: 1px solid #eaeaea;
      background: #f7f9fa;
      cursor: pointer;
      width: 60px;
      height: 56px;
      &:hover {
        background: #ffffff;
      }
    }
    .navbar-search-cat {
      width: 120px;
      border-right: 1px solid #eaeaea;
      text-align: right;
      height: 56px;
      background: #f7f9fa;
      select {
        margin-left: auto;
        margin-right: 1px;
        background: transparent;
        border: none;
        text-align-last: right;
        color: #6a6c6f;
        font-size: 0.8125rem;
        color: #6a6c6f;
        text-transform: uppercase;
        font-weight: 700;
        font-size: 0.8125rem;
        width: 100%;
        option {
          direction: rtl;
          text-transform: capitalize;
        }
      }
    }
  }
</style>

<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
  <div class="text-center navbar-brand-wrapper d-flex align-items-center">
    <a class="navbar-brand brand-logo" href="index.html">
      <img src="/img/logo.png" alt="logo" />
    </a>
    <a class="navbar-brand brand-logo-mini" href="index.html">
      <img src="/img/logo.png" alt="logo" />
    </a>
  </div>
  <div class="navbar-header-link d-flex align-items-center">
    <button
      class="navbar-toggler navbar-toggler align-self-center"
      type="button"
      data-toggle="minimize">
      <span class="mdi mdi-menu" />
    </button>
  </div>
  <div class="navbar-search-cat d-flex">
    <select bind:value={selected}>
      <option>Website</option>
      {#each navItems as item}
        <option value={item['caption']}>{item['title']}</option>
      {/each}
    </select>
  </div>
  <div
    class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
    <ul class="navbar-nav mr-lg-2">
      <li class="nav-item nav-search d-none d-lg-block">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text" id="search">
              <i class="mdi mdi-magnify" />
            </span>
          </div>
          <!-- input type="text" class="form-control" placeholder="Search in {selected}..." aria-label="search" aria-describedby="search" / -->
          <NavSearch placeholder="Search in {selected}..." />
        </div>
      </li>
    </ul>
    <ul class="navbar-nav navbar-nav-right">
      <li class="nav-item dropdown">
        <!-- svelte-ignore a11y-missing-attribute -->
        <a
          class="nav-link count-indicator dropdown-toggle d-flex
          justify-content-center align-items-center"
          id="messageDropdown"
          data-toggle="dropdown">
          <i class="mdi mdi-email-outline mx-0" />
        </a>
        <div
          class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
          aria-labelledby="messageDropdown">
          <p class="mb-0 font-weight-normal float-left dropdown-header">
            Messages
          </p>
          <!-- svelte-ignore a11y-missing-attribute -->
          <a class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-primary">
                <i class="mdi mdi-account-outline mx-0" />
              </div>
            </div>
            <div class="preview-item-content flex-grow">
              <h6 class="preview-subject ellipsis font-weight-normal">
                David Grey
              </h6>
              <p class="font-weight-light small-text text-muted mb-0">
                The meeting is cancelled
              </p>
            </div>
          </a>
          <!-- svelte-ignore a11y-missing-attribute -->
          <a class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-primary">
                <i class="mdi mdi-account-outline mx-0" />
              </div>
            </div>
            <div class="preview-item-content flex-grow">
              <h6 class="preview-subject ellipsis font-weight-normal">
                Tim Cook
              </h6>
              <p class="font-weight-light small-text text-muted mb-0">
                New product launch
              </p>
            </div>
          </a>
          <!-- svelte-ignore a11y-missing-attribute -->
          <a class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-primary">
                <i class="mdi mdi-account-outline mx-0" />
              </div>
            </div>
            <div class="preview-item-content flex-grow">
              <h6 class="preview-subject ellipsis font-weight-normal">
                Johnson
              </h6>
              <p class="font-weight-light small-text text-muted mb-0">
                Upcoming board meeting
              </p>
            </div>
          </a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <!-- svelte-ignore a11y-missing-attribute -->
        <a
          class="nav-link count-indicator dropdown-toggle d-flex
          align-items-center justify-content-center"
          id="notificationDropdown"
          data-toggle="dropdown">
          <i class="mdi mdi-bell-outline mx-0" />
          <span class="count" />
        </a>
        <div
          class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
          aria-labelledby="notificationDropdown">
          <p class="mb-0 font-weight-normal float-left dropdown-header">
            Notifications
          </p>
          <!-- svelte-ignore a11y-missing-attribute -->
          <a class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-success">
                <i class="mdi mdi-information mx-0" />
              </div>
            </div>
            <div class="preview-item-content">
              <h6 class="preview-subject font-weight-normal">
                Application Error
              </h6>
              <p class="font-weight-light small-text mb-0 text-muted">
                Just now
              </p>
            </div>
          </a>
          <!-- svelte-ignore a11y-missing-attribute -->
          <a class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-warning">
                <i class="mdi mdi-settings mx-0" />
              </div>
            </div>
            <div class="preview-item-content">
              <h6 class="preview-subject font-weight-normal">Settings</h6>
              <p class="font-weight-light small-text mb-0 text-muted">
                Private message
              </p>
            </div>
          </a>
          <!-- svelte-ignore a11y-missing-attribute -->
          <a class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-info">
                <i class="mdi mdi-account-box mx-0" />
              </div>
            </div>
            <div class="preview-item-content">
              <h6 class="preview-subject font-weight-normal">
                New user registration
              </h6>
              <p class="font-weight-light small-text mb-0 text-muted">
                2 days ago
              </p>
            </div>
          </a>
        </div>
      </li>
      <li class="nav-item nav-profile dropdown">
        <!-- svelte-ignore a11y-missing-attribute -->
        <a
          class="nav-link count-indicator"
          data-toggle="dropdown"
          id="profileDropdown">
          <i class="mdi mdi-account-circle mx-0" />
        </a>
        <div
          class="dropdown-menu dropdown-menu-right navbar-dropdown"
          aria-labelledby="profileDropdown">
          <!-- svelte-ignore a11y-missing-attribute -->
          <a class="dropdown-item">
            <i class="mdi mdi-settings" />
            Settings
          </a>
          <!-- svelte-ignore a11y-missing-attribute -->
          <a class="dropdown-item">
            <i class="mdi mdi-settings" />
            Personalize
          </a>
          <!-- svelte-ignore a11y-missing-attribute -->
          <a class="dropdown-item">
            <i class="mdi mdi-logout" />
            <a on:click|preventDefault={logout} href="/logout">Logout</a>
          </a>
        </div>
      </li>
      <li class="nav-item nav-settings d-none d-lg-flex">
        <!-- svelte-ignore a11y-missing-attribute -->
        <a class="nav-link">
          <i class="mdi mdi-dots-horizontal" />
        </a>
      </li>
    </ul>
    <button
      class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
      type="button"
      data-toggle="offcanvas">
      <span class="mdi mdi-menu" />
    </button>
  </div>
</nav>
