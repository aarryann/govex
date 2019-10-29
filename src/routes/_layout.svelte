<script>
  import { stores } from "@sapper/app";
  import Nav from "../components/layout/Nav.svelte";
  import ProtectedNav from "../components/layout/ProtectedNav.svelte";
  import ThemeSettings from "../components/layout/ThemeSettings.svelte";
  import SidebarRight from "../components/layout/SidebarRight.svelte";
  import SidebarLeft from "../components/layout/SidebarLeft.svelte";
  import PreloadingIndicator from "../components/layout/PreloadingIndicator.svelte";

  export let segment;
  const { page, preloading, session } = stores();
</script>

{#if $preloading}
  <PreloadingIndicator />
{/if}

<div class="container-scroller">
  {#if $page.path === '/login' || $page.path === '/register'}
    <!--TODO: For some reason not equals not working hence put Nav segment in else clause-->
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="main-panel">
        <div class="content-wrapper d-flex align-items-center auth px-0">
          <slot />
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  {:else}
    {#if $session.user}
      <ThemeSettings {segment} />
      <SidebarRight {segment} />
      <SidebarLeft {segment} />
      <ProtectedNav {segment} />
    {:else}
      <Nav {segment} />
    {/if}
    <div class="container-fluid page-body-wrapper">
      <div class="main-panel">
        <div class="content-wrapper">
          <slot />
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  {/if}
</div>
<!-- container-scroller -->
