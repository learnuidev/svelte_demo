<script>
  export let counter = 0;
  import NumberFlow from "@number-flow/svelte";
</script>

<div>
  <h1 class="text-center text-9xl">
    <NumberFlow value={counter} />
  </h1>

  <div class="flex justify-center items-center gap-12 mt-12 text-3xl">
    <button phx-click="increment">Increment</button>
    <button phx-click="decrement">Decrement</button>
    <button phx-click="reset">Reset</button>
  </div>
</div>
