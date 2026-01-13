<script lang="ts">
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';
	import { ScrollTrigger } from 'gsap/dist/ScrollTrigger';

	gsap.registerPlugin(ScrollTrigger);

	const features = [
		{
			id: 'anc',
			title: 'Acoustic Void',
			subtitle: 'Neural ANC',
			description:
				'Neutralize external chaos with dual-core frequency negation. Studio silence anywhere.',
			icon: '🤫',
			gradient: 'from-blue-600/30 to-purple-600/30'
		},
		{
			id: 'battery',
			title: 'Endless Power',
			subtitle: '90h Reserve',
			description:
				'Solid-state energy architecture for weeks of pure listening on a single charge.',
			icon: '⚡',
			gradient: 'from-amber-600/30 to-orange-600/30'
		},
		{
			id: 'spatial',
			title: 'Spatial Sphere',
			subtitle: '360° Realism',
			description: 'Binaural processing that places you at the center of the recording studio.',
			icon: '🌐',
			gradient: 'from-emerald-600/30 to-teal-600/30'
		},
		{
			id: 'drivers',
			title: 'Pure Motion',
			subtitle: 'Graphene Core',
			description: 'Zero-distortion drivers engineered at the molecular level for absolute purity.',
			icon: '💎',
			gradient: 'from-pink-600/30 to-rose-600/30'
		},
		{
			id: 'chassis',
			title: 'Titanium Shell',
			subtitle: 'Aerospace Grade',
			description: 'Resonance-free acoustic enclosure forged from high-density titanium.',
			icon: '🦾',
			gradient: 'from-slate-500/30 to-zinc-600/30'
		},
		{
			id: 'link',
			title: 'Neural Link',
			subtitle: 'Instant Sync',
			description: 'Ultra-low latency connectivity that bonds with your entire hardware ecosystem.',
			icon: '🧠',
			gradient: 'from-cyan-500/30 to-blue-600/30'
		}
	];

	onMount(() => {
		const cards = gsap.utils.toArray<Element>('.feature-card');

		cards.forEach((card) => {
			return gsap.from(card, {
				scrollTrigger: {
					trigger: card,
					start: 'top 80%',
					end: 'top 20%',
					scrub: 1
				},
				y: 100,
				opacity: 0,
				scale: 0.9
			});
		});
	});
</script>

<div
	id="features"
	class="features-container relative z-2 bg-background shadow-[0_-20px_50px_rgba(0,0,0,0.5)]"
	aria-label="Technical Innovations"
>
	<div class="relative container mx-auto px-4 pb-32 md:px-6 md:pb-48">
		<header
			class="mb-12 flex flex-col items-center gap-6 pt-12 text-center md:mb-32 md:gap-8 md:pt-32"
		>
			<span
				class="inline-block rounded-full border border-border bg-card/50 px-6 py-1.5 text-[10px] font-bold tracking-[0.4em] text-muted-foreground uppercase ring-1 ring-border backdrop-blur-2xl md:px-8 md:py-2 md:text-xs md:tracking-[0.5em]"
			>
				The Engineering Matrix
			</span>
			<h2
				class="text-4xl leading-tight font-bold tracking-tight text-foreground uppercase md:text-6xl lg:text-7xl"
			>
				Beyond <br />
				<span
					class="bg-linear-to-r from-foreground/40 via-foreground/80 to-foreground/40 bg-clip-text tracking-normal text-transparent italic"
					>Limits.</span
				>
			</h2>
		</header>

		<ul class="grid grid-cols-1 gap-4 md:grid-cols-2 md:gap-6 lg:grid-cols-3">
			{#each features as feature (feature.id)}
				<li>
					<article
						class="overflow-hidden rounded-xl border border-border bg-card p-3 shadow-xl md:rounded-2xl md:p-4"
					>
						<span
							class="mb-4 flex aspect-square w-12 items-center justify-center rounded-lg bg-muted/50 text-2xl shadow-lg ring-1 ring-border md:w-14 md:text-3xl"
							>{feature.icon}</span
						>

						<h3 class="mb-1.5 text-xs font-black tracking-[0.3em] text-primary/60 uppercase">
							{feature.title}
						</h3>
						<h4 class="mb-2 text-xl font-black tracking-tight text-foreground md:text-2xl">
							{feature.subtitle}
						</h4>

						<p class="text-xs leading-relaxed text-muted-foreground md:text-sm">
							{feature.description}
						</p>
					</article>
				</li>
			{/each}
		</ul>
	</div>
</div>
