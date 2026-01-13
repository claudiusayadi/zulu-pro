<script lang="ts">
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';
	import { ScrollTrigger } from 'gsap/dist/ScrollTrigger';

	gsap.registerPlugin(ScrollTrigger);

	let { isReady = $bindable(false), imagesLoaded = $bindable(0) } = $props();

	const frameCount = 193;
	const frames = { frame: 0 };
	const images: HTMLImageElement[] = [];

	let canvas: HTMLCanvasElement;
	let ctx: CanvasRenderingContext2D | null = null;

	const currentFrame = (index: number) => `/frames/frame_${index.toString().padStart(4, '0')}.webp`;

	onMount(() => {
		ctx = canvas.getContext('2d');

		const render = () => {
			if (!ctx || !images[frames.frame]) return;

			const img = images[frames.frame];
			const canvasWidth = window.innerWidth;
			const canvasHeight = window.innerHeight;

			canvas.width = canvasWidth;
			canvas.height = canvasHeight;

			const hRatio = canvasWidth / img.width;
			const vRatio = canvasHeight / img.height;
			const ratio = window.innerWidth < 768 ? Math.min(hRatio, vRatio) : Math.max(hRatio, vRatio);

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

		// Preload
		for (let i = 1; i <= frameCount; i++) {
			const img = new Image();
			img.src = currentFrame(i);
			img.onload = () => {
				imagesLoaded++;
				if (imagesLoaded === frameCount) {
					isReady = true;
					initScroll();
				}
			};
			images.push(img);
		}

		const initScroll = () => {
			const tl = gsap.timeline({
				scrollTrigger: {
					trigger: '.scroll-container',
					start: 'top top',
					end: 'bottom bottom',
					scrub: 0.5 // Smooth interpolation
				},
				onUpdate: render
			});

			// Frame Sequence
			tl.to(
				frames,
				{
					frame: frameCount - 1,
					snap: 'frame',
					ease: 'none',
					duration: 1
				},
				0
			);

			// Text Story Overlays
			// 0% Scroll: "Zulu Pro. Pure Sound." (Centered Title)
			tl.to('.text-0', { opacity: 1, duration: 0.1 }, 0).to(
				'.text-0',
				{ opacity: 0, duration: 0.1 },
				0.2
			);

			// 30% Scroll: "Precision Engineering." (Left aligned)
			tl.to('.text-1', { opacity: 1, duration: 0.1 }, 0.25).to(
				'.text-1',
				{ opacity: 0, duration: 0.1 },
				0.45
			);

			// 60% Scroll: "Titanium Drivers." (Right aligned)
			tl.to('.text-2', { opacity: 1, duration: 0.1 }, 0.55).to(
				'.text-2',
				{ opacity: 0, duration: 0.1 },
				0.75
			);

			// 90% Scroll: "Hear Everything." (Centered CTA)
			tl.to('.text-3', { opacity: 1, duration: 0.1 }, 0.85);

			render();
		};

		const handleResize = () => render();
		window.addEventListener('resize', handleResize);

		return () => {
			window.removeEventListener('resize', handleResize);
			ScrollTrigger.getAll().forEach((st) => st.kill());
		};
	});
</script>

<div class="scroll-container relative h-[300dvh] w-full md:h-[500dvh]">
	<div
		class="sticky-hero sticky top-0 flex h-screen w-full items-center justify-center overflow-hidden"
	>
		<canvas bind:this={canvas} class="h-full w-full"></canvas>

		<ul
			class="pointer-events-none absolute inset-0 flex items-center justify-center px-6 md:px-10 lg:px-20"
		>
			<li class="text-0 absolute flex flex-col items-center text-center opacity-0">
				<h1 class="text-4xl font-bold tracking-tighter text-foreground md:text-6xl lg:text-8xl">
					Zulu Pro.
				</h1>
				<p class="mt-3 text-lg text-muted-foreground md:mt-4 md:text-xl lg:text-2xl">Pure Sound.</p>
			</li>

			<li
				class="text-1 absolute left-6 flex max-w-md flex-col items-start opacity-0 md:left-10 lg:left-20"
			>
				<h2 class="text-3xl font-bold tracking-tight text-foreground md:text-5xl lg:text-6xl">
					Precision <br /> Engineering.
				</h2>
			</li>

			<li
				class="text-2 absolute right-6 flex max-w-md flex-col items-end text-right opacity-0 md:right-10 lg:right-20"
			>
				<h2 class="text-3xl font-bold tracking-tight text-foreground md:text-5xl lg:text-6xl">
					Titanium <br /> Drivers.
				</h2>
			</li>

			<li class="text-3 absolute flex flex-col items-center text-center opacity-0">
				<h2
					class="mb-6 text-4xl leading-tight font-bold tracking-tight text-foreground uppercase md:mb-8 md:text-6xl lg:text-7xl"
				>
					Hear <br />
					<span
						class="bg-linear-to-r from-foreground/40 via-foreground/80 to-foreground/40 bg-clip-text tracking-normal text-transparent italic"
						>Everything.</span
					>
				</h2>
				<button
					id="pre-order"
					class="pointer-events-auto rounded-full bg-foreground px-6 py-3 font-bold tracking-tight text-background transition-transform hover:scale-105 active:scale-95 md:px-8 md:py-4"
				>
					Pre-order Now
				</button>
			</li>
		</ul>
	</div>
</div>
