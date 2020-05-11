<script>
	import { goto, stores } from '@sapper/app';

    const { session } = stores();
    $session = {};
    goto("/login");
</script>
