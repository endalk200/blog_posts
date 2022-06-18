# Dependency installation stage.
FROM node:alpine AS dependencies

# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine 
# to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

# React app build stage.
FROM node:alpine AS builder

WORKDIR /app

COPY . .

COPY --from=dependencies /app/node_modules ./node_modules

## Install build toolchain, install node deps and compile native add-ons
RUN apk add --no-cache python3 make g++

RUN npm run build && npm install --production --ignore-scripts --prefer-offline

# Nginx configuration and runing stage.
FROM nginx:alpine AS runner

# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy static assets from builder stage
COPY --from=builder /app/build .

EXPOSE 80

# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
