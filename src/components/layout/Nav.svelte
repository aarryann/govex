<script>
  import { onMount } from "svelte";
  import { goto, stores } from "@sapper/app";
  import { post } from "@lib/utils.js";
  import { getClient, query, mutate } from "svelte-apollo";
  import { mutations, queries } from "../../routes/auth/_queries.js";
  import { SessionCache } from "../../config/config.js";

  const { session } = stores();

  let email = "";
  let emailInput;
  let password = "";
  const client = getClient();

  async function submit(event) {
    if (!event.target.checkValidity()) return;

    try {
      const r = await post(`/auth/login`, { username: email, password });

      if (r.status === 200) {
        session.set({ user: r.user, token: r.token });
        goto("/pipeline");
      } else {
        throw new Error(r.errors);
      }
    } catch (error) {
      console.error(
        "You have an error in your code or there are Network issues.",
        error.message
      );
    }
  }

  onMount(() => {
    setTimeout(() => {
      emailInput.focus();
    }, 1);
  });
</script>

<style lang="scss">
  h2 {
    &.sitename {
      font-weight: 700;
      padding-top: 10px;
      margin-left: 15px;
      color: #7571f9;
      font-variant: all-small-caps;
    }
  }
</style>

<div class="horizontal-menu">
  <nav class="navbar top-navbar col-lg-12 col-12 p-0">
    <div class="container">
      <div
        class="text-center navbar-brand-wrapper d-flex align-items-center
        justify-content-center">
        <a class="navbar-brand brand-logo" href="/">
          <img src="/img/logo.png" alt="logo" />
        </a>
        <a class="navbar-brand brand-logo-mini" href="/">
          <img src="/img/logo.png" alt="logo" />
        </a>
      </div>
      <div
        class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <h2 class="sitename mr-auto">Electronic Data Capture</h2>
        <form
          on:submit|preventDefault={submit}
          class="form-inline mt-2 mt-md-0">
          <input
            name="username"
            class="form-control mr-sm-2"
            type="text"
            placeholder="email"
            aria-label="email"
            bind:this={emailInput}
            bind:value={email} />
          <input
            name="password"
            class="form-control mr-sm-2"
            type="password"
            placeholder="password"
            aria-label="password"
            bind:value={password} />
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
            Sign in
          </button>
          <button
            class="navbar-toggler navbar-toggler-right d-lg-none
            align-self-center"
            type="submit"
            data-toggle="horizontal-menu-toggle">
            <span class="mdi mdi-menu" />
          </button>
        </form>
      </div>
    </div>
  </nav>
  <nav class="bottom-navbar">
    <div
      class="container d-flex flex-column flex-md-row align-items-center pt-2
      pb-2">
      <nav class="my-2 my-md-0 mr-md-3 ml-auto">
        <a href="#features" class="p-2 text-dark">Features</a>
        <a href="#enterprise" class="p-2 text-dark">Enterprise</a>
        <a href="#support" class="p-2 text-dark">Support</a>
        <a href="#pricing" class="p-2 text-dark">Pricing</a>
      </nav>
      <a href="/register" class="btn btn-outline-primary">Sign up</a>
    </div>
  </nav>
</div>
