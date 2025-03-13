<script>
  import NumberFlow from "@number-flow/svelte";
  import { fade } from "svelte/transition";

  export let counter = 0;
</script>

<div>
  <h1 class="text-center text-9xl font-bold" in:fade out:fade>
    <NumberFlow value={counter} />
  </h1>
</div>
