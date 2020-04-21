<script>
  import { s_isSettingsOpen, s_isSidebarRightOpen } from "../../stores.js";
  let isSettingsOpen = false;

  function openSettings() {
    s_isSettingsOpen.set(true);
    s_isSidebarRightOpen.set(false);
  }

  function closeSettings() {
    s_isSettingsOpen.set(false);
  }

  const unsubscribe = s_isSettingsOpen.subscribe(value => {
    isSettingsOpen = value;
  });
</script>

<div class="theme-setting-wrapper">
  <div id="settings-trigger" on:click={openSettings}>
    <i class="mdi mdi-settings" />
  </div>
  <div id="theme-settings" class="settings-panel" class:open={isSettingsOpen}>
    <i class="settings-close mdi mdi-close" on:click={closeSettings} />
    <p class="settings-heading">SIDEBAR SKINS</p>
    <div class="sidebar-bg-options selected" id="sidebar-light-theme">
      <div class="img-ss rounded-circle bg-light border mr-3" />
      Light
    </div>
    <div class="sidebar-bg-options" id="sidebar-dark-theme">
      <div class="img-ss rounded-circle bg-dark border mr-3" />
      Dark
    </div>
    <p class="settings-heading mt-2">HEADER SKINS</p>
    <div class="color-tiles mx-0 px-4">
      <div class="tiles primary" />
      <div class="tiles secondary" />
      <div class="tiles dark" />
      <div class="tiles default" />
    </div>
  </div>
</div>
