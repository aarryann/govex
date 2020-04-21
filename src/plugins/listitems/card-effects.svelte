<script>
  export let w;
  export let h;
  let o = 2;
</script>

<style lang="scss">
  @import "../../style/global/index";
  :global(.box) {
    &:hover svg line {
      -webkit-transition-delay: 0.1s;
      transition-delay: 0.1s;

      &.top {
        -webkit-transform: translateX(-600px);
        transform: translateX(-600px);
      }
      &.bottom {
        -webkit-transform: translateX(600px);
        transform: translateX(600px);
      }
      &.left {
        -webkit-transform: translateY(920px);
        transform: translateY(920px);
      }
      &.right {
        -webkit-transform: translateY(-920px);
        transform: translateY(-920px);
      }
    }

    svg {
      position: absolute;
      left: 0;
      top: 0;

      line {
        fill: none;
        stroke-width: 5;
        stroke: $primary;
        -webkit-transition: all 0.8s ease-in-out;
        transition: all 0.8s ease-in-out;

        &.top,
        &.bottom {
          stroke-dasharray: 330 240;
        }
        &.left,
        &.right {
          stroke-dasharray: 490 400;
        }
      }
    }
  }
</style>

<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
  <!--line class="top" x1="0" y1="0" x2="900" y2="0" />
  <line class="left" x1="0" y1="125" x2="0" y2="-920" />
  <line class="bottom" x1="2" y1="123" x2="-500" y2="123" />
  <line class="right" x1="223" y1="125" x2="223" y2="1000" /-->
  <line class="top" x1="0" y1="0" x2={w * 4} y2="0" />
  <line class="left" x1="0" y1={h} x2="0" y2={(w * 4 + 20) * -1} />
  <line class="bottom" x1={o} y1={h - o} x2={h * -4} y2={h - o} />
  <line class="right" x1={w - o} y1={h} x2={w - o} y2={w * 4} />
</svg>
