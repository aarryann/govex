<script>
  import { Nav } from "../../config/config";
  import { GetGroupNav } from "../../config/nav";
  import { sNavItems } from "../../stores";

  export let segment;
  //let navItems = Object.values(Nav);
  let navItems = GetGroupNav();
  sNavItems.set(navItems);
  $: selected = segment == undefined ? "/" : "/" + segment;
  const unsubscribe = sNavItems.subscribe(value => {
    navItems = value;
  });
</script>

<style lang="scss">
  @import "../../style/global/index";
  .sidebar {
    width: 180px !important;
    padding: 0;
    border-right: 0;
    background: transparent;
    .nav {
      > .nav-item {
        padding: 4px 10px !important;
        &.active {
          .nav-link .menu-title,
          .nav-link .menu-icon {
            color: $primary;
          }
        }
        &::before {
          left: 0px !important;
          border-top: 0;
        }
        .nav-link {
          .menu-title {
            color: $on-background;
            font-weight: 400;
            font-size: 0.8125rem;
            &:hover {
              font-weight: 700;
            }
          }
        }
      }
    }
  }
</style>

<nav class="sidebar sidebar-offcanvas ps" id="sidebar">
  <ul class="nav">
    {#each navItems as item}
      <li class="nav-item {item['route'] === selected ? 'active' : ''}">
        <a class="nav-link" href={item['route']}>
          <i class="mdi {item['css']} menu-icon" />
          <span class="menu-title">{item['title']}</span>
        </a>
      </li>
    {/each}
  </ul>
  <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
    <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;" />
  </div>
  <div class="ps__rail-y" style="top: 0px; right: 0px;">
    <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;" />
  </div>
</nav>
