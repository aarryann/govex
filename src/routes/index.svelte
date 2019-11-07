<script>
  import { TitleConstants } from "../conf/config";
  import PageHeader from "../components/controls/simple-page-header.svelte";
  import LandingPage from "../components/layout/Home.svelte";

  let title = TitleConstants.TITLE_HOME;
</script>

<svelte:head>
  <title>{title} - EDAC</title>
</svelte:head>
<PageHeader {title} />
<LandingPage />
