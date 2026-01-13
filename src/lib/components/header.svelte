<!-- eslint-disable svelte/no-navigation-without-resolve -->
<script lang="ts">
	let mobileMenuOpen = false;

	const menuItems = [
		{ name: 'Features', href: '#features' },
		{ name: 'Specs', href: '#specs' },
		{ name: 'Pre-order', href: '#pre-order' }
	];

	const toggleMenu = () => {
		mobileMenuOpen = !mobileMenuOpen;
	};

	const closeMenu = () => {
		mobileMenuOpen = false;
	};
</script>

<header class="fixed z-50 w-full">
	<div
		class="mx-auto my-4 flex h-14 max-w-5xl items-center justify-between rounded-xl border-b bg-background/20 px-8 backdrop-blur-3xl backdrop-saturate-200 lg:h-16"
	>
		<a href="/" class="flex items-center gap-2.5">
			<div class="flex h-7 w-7 items-center justify-center rounded-md bg-foreground md:h-8 md:w-8">
				<span class="text-lg font-black text-background md:text-xl">Z</span>
			</div>
			<span class="text-base font-bold tracking-tight text-foreground md:text-lg">Zulu Pro</span>
		</a>

		<nav aria-label="Main navigation">
			<ul class="hidden items-center gap-1 md:flex">
				{#each menuItems as item (item.href)}
					<li>
						<a
							href={item.href}
							class="rounded-lg px-3 py-2 text-sm font-medium text-muted-foreground transition-colors hover:bg-white/5 hover:text-foreground"
						>
							{item.name}
						</a>
					</li>
				{/each}
			</ul>
		</nav>

		<button
			on:click={toggleMenu}
			class="flex h-8 w-8 items-center justify-center rounded-lg text-foreground transition-colors hover:bg-white/5 md:hidden"
			aria-label="Menu"
			aria-expanded={mobileMenuOpen}
		>
			{#if mobileMenuOpen}
				<svg
					class="h-5 w-5"
					fill="none"
					stroke="currentColor"
					viewBox="0 0 24 24"
					xmlns="http://www.w3.org/2000/svg"
				>
					<path
						stroke-linecap="round"
						stroke-linejoin="round"
						stroke-width="2"
						d="M6 18L18 6M6 6l12 12"
					/>
				</svg>
			{:else}
				<svg
					class="h-5 w-5"
					fill="none"
					stroke="currentColor"
					viewBox="0 0 24 24"
					xmlns="http://www.w3.org/2000/svg"
				>
					<path
						stroke-linecap="round"
						stroke-linejoin="round"
						stroke-width="2"
						d="M4 6h16M4 12h16M4 18h16"
					/>
				</svg>
			{/if}
		</button>
	</div>
</header>

{#if mobileMenuOpen}
	<nav class="fixed inset-0 z-40 bg-background/95 backdrop-blur-2xl md:hidden">
		<ul
			class="flex h-full flex-col items-center justify-center gap-8"
			aria-label="Mobile navigation"
		>
			{#each menuItems as item (item.href)}
				<li>
					<a
						href={item.href}
						on:click={closeMenu}
						class="text-2xl font-medium text-foreground transition-colors hover:text-muted-foreground"
					>
						{item.name}
					</a>
				</li>
			{/each}
		</ul>
	</nav>
{/if}
