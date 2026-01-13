<script lang="ts">
	import { onMount } from 'svelte';
	import gsap from 'gsap';
	import { ScrollTrigger } from 'gsap/dist/ScrollTrigger';
	import Lenis from 'lenis';

	import Header from '$lib/components/header.svelte';
	import Loading from '$lib/components/loading.svelte';
	import Hero from '$lib/components/hero.svelte';
	import Features from '$lib/components/features.svelte';
	import Specifications from '$lib/components/specifications.svelte';
	import Footer from '$lib/components/footer.svelte';

	let isReady = $state(false);
	let imagesLoaded = $state(0);
	const frameCount = 193;
	let progress = $derived((imagesLoaded / frameCount) * 100);

	gsap.registerPlugin(ScrollTrigger);

	$effect(() => {
		if (!isReady) return;

		const lenis = new Lenis({ lerp: 0.1, smoothWheel: true });
		lenis.on('scroll', ScrollTrigger.update);
		gsap.ticker.add((time) => lenis.raf(time * 1000));

		const sections = gsap.utils.toArray<HTMLElement>('.stack');

		sections.forEach((section, i) => {
			// We only pin Hero and Features
			if (i < sections.length - 1) {
				ScrollTrigger.create({
					trigger: section,
					start: 'top top',
					pin: true,
					pinSpacing: false,
					scrub: true
				});

				gsap.to(section, {
					scrollTrigger: {
						trigger: section,
						// Hero waits for the headphone animation to finish, others start immediately
						start: i === 0 ? 'bottom top' : 'top top',
						end: '+=100%',
						scrub: true
					},
					scale: 0.85,
					opacity: 0,
					pointerEvents: 'none',
					// Use autoAlpha for performance: toggles opacity and visibility:hidden
					autoAlpha: 0,
					onComplete: () => {
						// Force visibility hidden to ensure it doesn't block clicks or show up later
						gsap.set(section, { visibility: 'hidden', display: 'none' });
					},
					onReverseComplete: () => {
						gsap.set(section, { visibility: 'visible', display: 'block' });
					}
				});
			}
		});

		const handleAnchorClick = (e: MouseEvent) => {
			const target = e.target as HTMLElement;
			const link = target.closest('a');
			if (link?.hash) {
				e.preventDefault();
				const targetId = link.hash.substring(1);
				const targetElem = document.getElementById(targetId);

				if (targetId === 'pre-order') {
					const heroST = ScrollTrigger.getAll().find(
						(st) => st.vars.trigger === '.scroll-container'
					);
					if (heroST) lenis.scrollTo(heroST.end);
				} else if (targetElem) {
					lenis.scrollTo(targetElem, { offset: 0 });
				}
			}
		};

		window.addEventListener('click', handleAnchorClick);
		return () => {
			lenis.destroy();
			ScrollTrigger.getAll().forEach((t) => t.kill());
		};
	});
</script>

<div class="flex h-full w-full flex-col overflow-x-clip">
	<Loading {progress} {isReady} />
	<Header />

	<main class="relative flex flex-1 flex-col">
		<div class="stack z-1">
			<Hero bind:isReady bind:imagesLoaded />
		</div>

		<div id="features" class="stack z-2 shadow-[0_-50px_100px_rgba(0,0,0,1)]">
			<Features />
		</div>

		<div id="specs" class="stack z-3 shadow-[0_-50px_100px_rgba(0,0,0,1)]">
			<Specifications />
		</div>
	</main>

	<div class="relative z-50">
		<Footer />
	</div>
</div>
