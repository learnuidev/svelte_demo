<script>
  import Title from "./title.svelte";
  import ActionButtons from "./action-buttons.svelte";

  export let counter = 0;
</script>

<Title {counter} />
<ActionButtons />
