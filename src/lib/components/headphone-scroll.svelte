<script lang="ts">
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';
	import { ScrollTrigger } from 'gsap/ScrollTrigger';

	let canvas: HTMLCanvasElement | undefined = $state();
	let container: HTMLDivElement | undefined = $state();
	let isLoading = $state(true);
	let frameCount = 193;
	let images: HTMLImageElement[] = [];
	let currentFrame = $state(0);

	const frameUrl = (index: number) => `/frames/frame_${(index + 1).toString().padStart(4, '0')}.webp`;

	const preloadImages = async () => {
		const promises = [];
		for (let i = 0; i < frameCount; i++) {
			const img = new Image();
			const promise = new Promise((resolve) => {
				img.onload = () => resolve(img);
				img.onerror = () => resolve(null); // Continue even if one fails
				img.src = frameUrl(i);
			});
			images.push(img);
			promises.push(promise);
		}
		await Promise.all(promises);
		isLoading = false;
	};

	const render = () => {
		if (!canvas || images.length === 0) return;
		const ctx = canvas.getContext('2d');
		if (!ctx) return;

		const img = images[currentFrame];
		if (!img) return;

		const canvasWidth = window.innerWidth;
		const canvasHeight = window.innerHeight;

		canvas.width = canvasWidth * window.devicePixelRatio;
		canvas.height = canvasHeight * window.devicePixelRatio;
		ctx.scale(window.devicePixelRatio, window.devicePixelRatio);

		// Contain fit
		const hRatio = canvasWidth / img.width;
		const vRatio = canvasHeight / img.height;
		const ratio = Math.min(hRatio, vRatio);
		const centerShift_x = (canvasWidth - img.width * ratio) / 2;
		const centerShift_y = (canvasHeight - img.height * ratio) / 2;

		ctx.clearRect(0, 0, canvasWidth, canvasHeight);
		ctx.drawImage(
			img,
			0,
			0,
			img.width,
			img.height,
			centerShift_x,
			centerShift_y,
			img.width * ratio,
			img.height * ratio
		);
	};

	onMount(() => {
		gsap.registerPlugin(ScrollTrigger);

		preloadImages().then(() => {
			render();

			const frames = { frame: 0 };
			const tl = gsap.timeline({
				scrollTrigger: {
					trigger: container,
					start: 'top top',
					end: 'bottom bottom',
					scrub: 0.5,
					onUpdate: (self) => {
						currentFrame = Math.round(frames.frame);
						render();
					}
				}
			});

			// Animate frames
			tl.to(frames, {
				frame: frameCount - 1,
				ease: 'none',
				duration: 1
			}, 0);

			// Text Story Overlays
			// 0% Scroll: "Zulu Pro. Pure Sound."
			tl.fromTo('.text-0', { opacity: 0, y: 20 }, { opacity: 1, y: 0, duration: 0.1 }, 0);
			tl.to('.text-0', { opacity: 0, y: -20, duration: 0.1 }, 0.2);

			// 30% Scroll: "Precision Engineering."
			tl.fromTo('.text-1', { opacity: 0, x: -50 }, { opacity: 1, x: 0, duration: 0.1 }, 0.25);
			tl.to('.text-1', { opacity: 0, x: -50, duration: 0.1 }, 0.45);

			// 60% Scroll: "Titanium Drivers."
			tl.fromTo('.text-2', { opacity: 0, x: 50 }, { opacity: 1, x: 0, duration: 0.1 }, 0.55);
			tl.to('.text-2', { opacity: 0, x: 50, duration: 0.1 }, 0.75);

			// 90% Scroll: "Hear Everything."
			tl.fromTo('.text-3', { opacity: 0, scale: 0.9 }, { opacity: 1, scale: 1, duration: 0.1 }, 0.85);
		});

		window.addEventListener('resize', render);
		return () => {
			window.removeEventListener('resize', render);
			ScrollTrigger.getAll().forEach((t) => t.kill());
		};
	});
</script>

<div bind:this={container} class="relative h-[400vh] w-full bg-[#050505]">
	<div class="sticky top-0 h-screen w-full overflow-hidden">
		{#if isLoading}
			<div class="absolute inset-0 z-50 flex flex-col items-center justify-center bg-[#050505]">
				<div class="h-16 w-16 animate-spin rounded-full border-4 border-white/10 border-t-white"></div>
				<p class="mt-4 font-mono text-xs tracking-widest text-white/40 uppercase">Loading Experience</p>
			</div>
		{/if}

		<canvas bind:this={canvas} class="h-full w-full"></canvas>

		<!-- Overlays -->
		<div class="pointer-events-none absolute inset-0 z-10">
			<!-- 0% - Center -->
			<div class="text-0 absolute inset-0 flex flex-col items-center justify-center px-6 opacity-0">
				<h1 class="text-5xl font-bold tracking-tighter text-white/90 md:text-7xl lg:text-9xl">
					Zulu Pro.
				</h1>
				<p class="mt-4 text-xl tracking-tight text-white/60 md:text-2xl">Pure Sound.</p>
			</div>

			<!-- 30% - Left -->
			<div class="text-1 absolute inset-y-0 left-0 flex flex-col justify-center px-10 opacity-0 md:px-20 lg:px-32">
				<h2 class="max-w-md text-4xl font-bold tracking-tight text-white/90 md:text-6xl">
					Precision <br /> Engineering.
				</h2>
			</div>

			<!-- 60% - Right -->
			<div class="text-2 absolute inset-y-0 right-0 flex flex-col justify-center px-10 text-right opacity-0 md:px-20 lg:px-32">
				<h2 class="max-w-md text-4xl font-bold tracking-tight text-white/90 md:text-6xl">
					Titanium <br /> Drivers.
				</h2>
			</div>

			<!-- 90% - Center CTA -->
			<div class="text-3 absolute inset-0 flex flex-col items-center justify-center px-6 opacity-0">
				<h2 class="text-center text-5xl font-bold tracking-tighter text-white/90 uppercase md:text-7xl lg:text-8xl">
					Hear <br /> Everything.
				</h2>
				<button class="pointer-events-auto mt-12 rounded-full bg-white px-10 py-4 text-lg font-bold tracking-tight text-black transition-transform hover:scale-105 active:scale-95">
					Pre-order Now
				</button>
			</div>
		</div>
	</div>
</div>

<style>
	canvas {
		display: block;
		width: 100%;
		height: 100vh;
		object-fit: contain;
	}
</style>