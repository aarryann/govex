<script>
  import { stores } from "@sapper/app";
  import Nav from "../components/layout/Nav.svelte";
  import ProtectedNav from "../components/layout/ProtectedNav.svelte";
  import ThemeSettings from "../components/layout/ThemeSettings.svelte";
  import SidebarRight from "../components/layout/SidebarRight.svelte";
  import SidebarLeft from "../components/layout/SidebarLeft.svelte";
  import PreloadingIndicator from "../components/layout/PreloadingIndicator.svelte";
  // import ApolloClient from "apollo-boost";
  import { createApolloClient } from "../_apollo";
  import { setClient } from "svelte-apollo";

  export let segment;
  const { page, preloading, session } = stores();
  console.log(session);
  const { user, token } = session;
  // const client = new ApolloClient({ uri: "http://localhost:4000/graphql" });
  const client = new createApolloClient(token);
  setClient(client);
</script>

{#if $preloading}
  <PreloadingIndicator />
{/if}

<!-- container-scroller from template.html-->
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
    <ProtectedNav {segment} />
  {:else}
    <Nav {segment} />
  {/if}
  <div class="container-fluid page-body-wrapper">
    {#if $session.user}
      <ThemeSettings {segment} />
      <SidebarRight {segment} />
      <SidebarLeft {segment} />
    {/if}
    <div class="main-panel">
      <div class="content-wrapper">
        <slot />
      </div>
      <footer class="footer">
        <div
          class="d-sm-flex justify-content-center justify-content-sm-between">
          <span
            class="text-muted text-center text-sm-left d-block d-sm-inline-block">
            Copyright © 2018
            <a
              href="https://www.urbanui.com/"
              target="_blank"
              class="text-muted">
              Urbanui
            </a>
            . All rights reserved.
          </span>
          <span
            class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">
            Hand-crafted &amp; made with
            <i class="mdi mdi-heart-outline text-primary" />
          </span>
        </div>
      </footer>
      <!-- main-panel ends -->
    </div>
    <!-- content-wrapper ends -->
  </div>
  <!-- page-body-wrapper ends -->
{/if}
<!-- container-scroller -->
