<script lang="ts">
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';
	import { ScrollTrigger } from 'gsap/dist/ScrollTrigger';

	gsap.registerPlugin(ScrollTrigger);

	const specifications = [
		{
			id: 'drivers',
			label: 'Driver Technology',
			value: '50mm Titanium',
			description: 'Aerospace-grade titanium diaphragm with graphene coating for zero distortion',
			metric: '4-40kHz'
		},
		{
			id: 'impedance',
			label: 'Impedance',
			value: '32Ω',
			description: 'Optimized for both studio equipment and mobile devices',
			metric: 'Universal'
		},
		{
			id: 'sensitivity',
			label: 'Sensitivity',
			value: '110dB SPL',
			description: 'High-efficiency drivers deliver powerful sound at lower power consumption',
			metric: '@1kHz'
		},
		{
			id: 'battery',
			label: 'Battery Life',
			value: '90 Hours',
			description: 'Solid-state battery technology with rapid 15-minute fast charge',
			metric: 'ANC On'
		},
		{
			id: 'weight',
			label: 'Weight',
			value: '285g',
			description: 'Perfectly balanced titanium chassis with memory foam cushions',
			metric: 'Ultra-Light'
		},
		{
			id: 'connectivity',
			label: 'Connectivity',
			value: 'BT 5.4 + LDAC',
			description: 'Ultra-low latency wireless with lossless audio codec support',
			metric: '<20ms'
		}
	];

	onMount(() => {
		const specCards = gsap.utils.toArray('.spec-card') as Element[];

		specCards.forEach((card) => {
			gsap.from(card, {
				scrollTrigger: {
					trigger: card,
					start: 'top 85%',
					end: 'top 30%',
					scrub: 1.5
				},
				y: 80,
				opacity: 0,
				scale: 0.95,
				rotateX: 15
			});
		});
	});
</script>

<div
	id="specs"
	class="specs-container shadow-[0_-20px_50px_rgba(0,0,0,0.5) relative z-3 w-full overflow-hidden bg-background"
	aria-label="Technical Specifications"
>
	<div class="relative z-10 container mx-auto px-4 pb-32 md:px-6 md:pb-48">
		<header
			class="mb-12 flex flex-col items-center gap-6 pt-12 text-center md:mb-16 md:gap-8 md:pt-32"
		>
			<span
				class="inline-block rounded-full border border-border bg-card/50 px-6 py-1.5 text-[10px] font-bold tracking-[0.4em] text-primary uppercase ring-1 ring-border backdrop-blur-3xl md:px-8 md:py-2 md:text-xs md:tracking-[0.5em]"
			>
				Technical Mastery
			</span>
			<h2
				class="text-4xl leading-tight font-bold tracking-tight text-foreground uppercase md:text-6xl lg:text-7xl"
			>
				Precision <br />
				<span
					class="bg-linear-to-r from-foreground/40 via-foreground/80 to-foreground/40 bg-clip-text tracking-normal text-transparent italic"
					>Engineered.</span
				>
			</h2>
		</header>

		<div class="mb-20 overflow-hidden p-8 md:mb-32 md:p-12 lg:p-16">
			<img
				src="/zulu-pro-labels.webp"
				alt="Zulu Pro Technical Specifications Showcase"
				class="h-auto w-full mask-[radial-gradient(ellipse_at_center,black_70%,transparent_100%)] object-contain opacity-90 transition-opacity duration-500 hover:opacity-100"
			/>
			<div class="mt-8 text-center md:mt-12">
				<h3 class="mb-3 text-2xl font-black tracking-tight text-foreground md:text-3xl lg:text-4xl">
					Aerospace-Grade Construction
				</h3>
				<p class="mx-auto max-w-3xl text-sm leading-relaxed text-muted-foreground md:text-base">
					Every component is precision-engineered to deliver uncompromising audio fidelity. From the
					titanium chassis to the graphene drivers, Zulu Pro represents the pinnacle of acoustic
					engineering.
				</p>
			</div>
		</div>

		<ul class="grid grid-cols-1 gap-6 md:grid-cols-2 md:gap-8 lg:grid-cols-3 lg:gap-10">
			{#each specifications as spec (spec.id)}
				<li class="spec-card group">
					<article
						class="overflow-hidden rounded-2xl border border-border bg-card/50 p-6 shadow-xl backdrop-blur-sm transition-all duration-500 hover:border-primary/30 hover:shadow-2xl hover:shadow-primary/10 md:rounded-3xl md:p-8"
					>
						<div
							class="pointer-events-none absolute inset-0 bg-linear-to-br from-primary/0 via-primary/0 to-primary/5 opacity-0 transition-opacity duration-500 group-hover:opacity-100"
						></div>

						<div class="relative mb-5 flex items-center justify-between">
							<h3
								class="text-xs font-black tracking-[0.3em] text-primary/60 uppercase md:tracking-[0.4em]"
							>
								{spec.label}
							</h3>
							<span
								class="rounded-full bg-primary/10 px-3 py-1 text-[10px] font-bold tracking-wider text-primary uppercase ring-1 ring-primary/20 md:text-xs"
							>
								{spec.metric}
							</span>
						</div>

						<h4
							class="mb-3 text-3xl font-black tracking-tight text-foreground transition-colors duration-300 group-hover:text-primary md:text-4xl"
						>
							{spec.value}
						</h4>
						<p class="text-sm leading-relaxed text-muted-foreground md:text-base">
							{spec.description}
						</p>

						<div
							class="absolute bottom-0 left-0 h-1 w-0 bg-linear-to-r from-primary via-primary/80 to-transparent transition-all duration-700 group-hover:w-full"
						></div>
					</article>
				</li>
			{/each}
		</ul>

		<div class="mt-16 flex flex-col items-center gap-4 p-6 text-center md:mt-24 md:gap-6 md:p-8">
			<img
				src="/zulu-pro-labels.webp"
				alt="Zulu Pro Technical Certification"
				class="h-16 w-auto object-contain opacity-80 md:h-20"
			/>
			<p class="max-w-2xl text-sm leading-relaxed text-muted-foreground md:text-base">
				Every specification is the result of obsessive engineering. Each component is
				precision-tuned to work in perfect harmony, delivering an audio experience that transcends
				conventional limits.
			</p>
			<div class="flex flex-wrap items-center justify-center gap-6 text-xs text-primary md:gap-8">
				<span class="flex items-center gap-2">
					<span class="h-1.5 w-1.5 rounded-full bg-primary"></span>
					Hi-Res Certified
				</span>
				<span class="flex items-center gap-2">
					<span class="h-1.5 w-1.5 rounded-full bg-primary"></span>
					THX Spatial Audio
				</span>
				<span class="flex items-center gap-2">
					<span class="h-1.5 w-1.5 rounded-full bg-primary"></span>
					MQA Renderer
				</span>
			</div>
		</div>
	</div>
</div>

<style>
	.spec-card {
		perspective: 1000px;
	}

	.spec-card article {
		transform-style: preserve-3d;
		position: relative;
	}

	/* Removed sticky positioning and index-based scaling */
	/* .spec-card:nth-child(1) article {
		--index: 0;
	}
	.spec-card:nth-child(2) article {
		--index: 1;
	}
	.spec-card:nth-child(3) article {
		--index: 2;
	}
	.spec-card:nth-child(4) article {
		--index: 3;
	}
	.spec-card:nth-child(5) article {
		--index: 4;
	}
	.spec-card:nth-child(6) article {
		--index: 5;
	} */

	@media (prefers-reduced-motion: reduce) {
		.spec-card article {
			transition: none;
		}
	}
</style>
