<script context="module">
  export async function preload({ params }, session) {
    if (!session || !session.user) this.redirect(302, "/");
    const { id } = params;
    return { id };
  }
</script>

<script>
  import Pipeline from "./_controller.svelte";
  export let id;
</script>

<Pipeline {id} />
