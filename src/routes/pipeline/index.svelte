<script context="module">
  export function preload(page, session) {
    if (!session || !session.user) this.redirect(302, "/");
  }
</script>

<script>
  import Pipeline from "./_controller.svelte";
</script>

<Pipeline />
