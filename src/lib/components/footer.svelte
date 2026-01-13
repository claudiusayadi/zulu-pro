<script lang="ts">
	import { resolve } from '$app/paths';
	import * as Icons from 'simple-icons';

	const footerLinks = {
		product: [
			{ label: 'Features', href: '#features' },
			{ label: 'Specifications', href: '#specs' },
			{ label: 'Pre-order', href: '#pre-order' }
		],
		company: [
			{ label: 'About', href: '/about' },
			{ label: 'Contact', href: '/contact' },
			{ label: 'Press', href: '/press' }
		],
		legal: [
			{ label: 'Privacy', href: '/privacy' },
			{ label: 'Terms', href: '/terms' },
			{ label: 'Warranty', href: '/warranty' }
		]
	};

	const socialLinks = [
		{ label: 'Twitter', href: 'https://twitter.com', icon: Icons.siX },
		{ label: 'Instagram', href: 'https://instagram.com', icon: Icons.siInstagram },
		{ label: 'YouTube', href: 'https://youtube.com', icon: Icons.siYoutube }
	];
</script>

<footer class="relative z-10 w-full border-t border-border/20 bg-black">
	<div class="container mx-auto px-4 py-16 md:px-6 md:py-20 lg:py-24">
		<!-- Top Section: Logo + Links -->
		<div class="mb-12 grid grid-cols-1 gap-12 md:grid-cols-2 lg:grid-cols-5 lg:gap-8">
			<!-- Brand Column -->
			<div class="lg:col-span-2">
				<a href={resolve('/')} class="mb-4 inline-flex items-center gap-2.5">
					<div class="flex h-8 w-8 items-center justify-center rounded-md bg-foreground">
						<span class="text-xl font-black text-background">Z</span>
					</div>
					<span class="text-xl font-black tracking-tight text-foreground">Zulu Pro</span>
				</a>
				<p class="mt-4 max-w-sm text-sm leading-relaxed text-muted-foreground">
					Precision-engineered headphones that transcend conventional limits. Experience pure sound.
				</p>

				<!-- Social Links -->
				<div class="mt-6 flex items-center gap-4">
					{#each socialLinks as social (social.href)}
						<a
							href={social.href}
							target="_blank"
							rel="noopener noreferrer"
							class="flex h-9 w-9 items-center justify-center rounded-lg border border-border bg-card/50 text-muted-foreground transition-colors hover:border-primary/30 hover:bg-card hover:text-primary"
							aria-label={social.label}
						>
							<svg role="img" viewBox="0 0 24 24" class="size-4 fill-current">
								<path d={social.icon.path} />
							</svg>
						</a>
					{/each}
				</div>
			</div>

			<!-- Product Links -->
			<nav aria-label="Product links">
				<h3 class="mb-4 text-xs font-black tracking-[0.3em] text-primary/60 uppercase">Product</h3>
				<ul class="space-y-3">
					{#each footerLinks.product as link (link.href)}
						<li>
							<a
								href={link.href}
								class="text-sm text-muted-foreground transition-colors hover:text-foreground"
							>
								{link.label}
							</a>
						</li>
					{/each}
				</ul>
			</nav>

			<!-- Company Links -->
			<nav aria-label="Company links">
				<h3 class="mb-4 text-xs font-black tracking-[0.3em] text-primary/60 uppercase">Company</h3>
				<ul class="space-y-3">
					{#each footerLinks.company as link (link.href)}
						<li>
							<a
								href={link.href}
								class="text-sm text-muted-foreground transition-colors hover:text-foreground"
							>
								{link.label}
							</a>
						</li>
					{/each}
				</ul>
			</nav>

			<!-- Legal Links -->
			<nav aria-label="Legal links">
				<h3 class="mb-4 text-xs font-black tracking-[0.3em] text-primary/60 uppercase">Legal</h3>
				<ul class="space-y-3">
					{#each footerLinks.legal as link (link.href)}
						<li>
							<a
								href={link.href}
								class="text-sm text-muted-foreground transition-colors hover:text-foreground"
							>
								{link.label}
							</a>
						</li>
					{/each}
				</ul>
			</nav>
		</div>

		<div
			class="flex flex-col items-center justify-between gap-4 border-t border-border/20 pt-8 md:flex-row"
		>
			<p class="text-xs text-muted-foreground">
				© {new Date().getFullYear()} Zulu Pro. All rights reserved.
			</p>

			<div
				class="flex flex-wrap items-center justify-center gap-4 text-[10px] text-primary md:gap-6"
			>
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
</footer>
