<script lang="ts">
	let { progress = 0, isReady = false } = $props();
</script>

{#if !isReady}
	<div
		class="fixed inset-0 z-100 flex flex-col items-center justify-center gap-4 bg-background font-mono text-muted-foreground transition-opacity duration-700"
		class:opacity-0={isReady}
		class:pointer-events-none={isReady}
	>
		<div class="h-1 w-48 overflow-hidden rounded-full bg-border">
			<div
				class="h-full bg-foreground transition-all duration-300"
				style="width: {progress}%"
			></div>
		</div>
		<span class="text-xs tracking-widest uppercase">
			Loading Zulu Pro {Math.round(progress)}%
		</span>
	</div>
{/if}
