# Zulu Pro Landing Page

A high-performance, immersive "scrollytelling" experience for the fictional Zulu Pro audiophile headphones. This project utilizes advanced web technologies to deliver a premium digital showcase.

## Overview

The Zulu Pro landing page is designed to provide users with a seamless, interactive journey through the product's engineering and features. The core experience centers around a scroll-linked animation sequence that disassembles the headphones in high detail as the user navigates the page.

## Technical Architecture

### Core Technologies

- **Svelte 5**: Leverages the latest Svelte features, including Runes ($state, $derived, $effect) for efficient state management and reactive logic.
- **SvelteKit**: High-performance application framework providing optimized routing and server-side rendering.
- **GSAP (GreenSock Animation Platform)**: Powering the advanced scrollytelling mechanics through ScrollTrigger and frame-by-frame image sequence manipulation.
- **Tailwind CSS**: Utility-first styling with a custom Pure Dark Mode design system
- **Lenis**: Smooth scrolling engine providing a fluid, consistent user experience across different devices and browsers.

### Performance Optimizations

- **HTML5 Canvas Rendering**: The image sequence is rendered directly to a canvas element to ensure 60fps performance during complex disassembly animations.
- **Image Preloading**: Intelligent preloading of high-resolution frame sequences to eliminate flickering and ensure visual consistency.
- **Native Spring Physics**: Micro-interactions utilizing Svelte 5's native animation capabilities for a responsive, tactile feel.
- **Semantic HTML**: Adherence to W3C standards with appropriate use of article, section, and header tags for accessibility and SEO.

## Features

### Dynamic Scrollytelling

The "Precision Engineering" section features a 193-frame high-resolution sequence that reacts to the user's scroll position, providing a granular look at the internal components of the Zulu Pro.

### Stacked Section Layout

A layered section architecture where content panels stack and fade with depth effects as the user progresses through technical specifications and innovations.

### Performance Dashboards

Visual representation of technical mastery, including driver technology, battery specifications, and acoustic engineering metrics.

## Development

### Prerequisites

- Node.js (>=18)
- bun

### Setup

1. Clone the repository.
2. Install dependencies: `bun install`.
3. Start the development server: `bun run dev`.

### Build and Deployment

To create an optimized production build:

```bash
bun run build
```

## License

This project is proprietary and confidential. All rights reserved.
