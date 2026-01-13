# syntax=docker/dockerfile:1.7
FROM oven/bun:1 AS base
WORKDIR /app

# Install dependencies
FROM base AS deps
COPY package.json bun.lock ./

RUN --mount=type=cache,target=/root/.bun/install/cache \
	bun install --frozen-lockfile

# Build the application
FROM base AS build
WORKDIR /app

ENV NODE_ENV=production
ENV PUBLIC_API_URL=https://giftcardvendor.dovely.tech/api/v1
ENV PUBLIC_WS_URL=https://giftcardvendor.dovely.tech

COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN bun run build

# Production runtime
FROM oven/bun:1-slim AS runtime
WORKDIR /app

ENV NODE_ENV=production
ENV PORT=5202

# Copy built application
COPY --from=build /app/build ./build
COPY --from=build /app/package.json ./package.json

EXPOSE 5202

CMD ["bun", "run", "./build/index.js"]
