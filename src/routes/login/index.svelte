<script>
  import { goto, stores } from "@sapper/app";
  import ListErrors from "../../components/scaffold/ListErrors.svelte";
  import { post } from "../../lib/utils.js";

  const { session } = stores();

  let email = "";
  let password = "";
  let errors = null;

  async function submit(event) {
    if (!event.target.checkValidity()) {
      return;
    }
    try {
      const r = await post(`/auth/login`, { username: email, password });

      if (r.errors) {
        errors = r.errors;
      } else {
        session.set({ user: r });
        goto("/");
      }
    } catch (error) {
      console.error(
        "You have an error in your code or there are Network issues.",
        error
      );
    }
  }
</script>

<svelte:head>
  <title>Sign in - EDAC</title>
</svelte:head>

<div class="row w-100 mx-0">
  <div class="col-lg-4 mx-auto">
    <div class="auth-form-light text-center py-5 px-4 px-sm-5 border">
      <div class="brand-logo">
        <img src="/img/logo.png" alt="logo" />
      </div>
      <h4>Hello! let's get started</h4>
      <h6 class="font-weight-light">Sign in to continue.</h6>
      <ListErrors {errors} />
      <form on:submit|preventDefault={submit} class="pt-3">
        <div class="form-group">
          <input
            name="username"
            type="email"
            class="form-control form-control-lg"
            placeholder="Email"
            bind:value={email} />
        </div>
        <div class="form-group">
          <input
            name="password"
            type="password"
            class="form-control form-control-lg"
            placeholder="Password"
            bind:value={password} />
        </div>
        <div class="mt-3">
          <button
            class="btn btn-block btn-primary btn-lg font-weight-medium
            auth-form-btn"
            type="submit"
            disabled={!email || !password}>
            SIGN IN
          </button>
        </div>
        <div class="my-2 d-flex justify-content-between align-items-center">
          <div class="form-check">
            <label class="form-check-label text-muted">
              <input type="checkbox" class="form-check-input" />
              Keep me signed in
            </label>
          </div>
          <a href="/forgotpassword" class="auth-link text-black">
            Forgot password?
          </a>
        </div>
        <div class="mb-2">
          <button
            type="button"
            class="btn btn-block btn-facebook auth-form-btn">
            <i class="mdi mdi-facebook mr-2" />
            Connect using facebook
          </button>
        </div>
        <div class="text-center mt-4 font-weight-light">
          Don't have an account?
          <a href="/register" class="text-primary">Create</a>
        </div>
      </form>
    </div>
  </div>
</div>
