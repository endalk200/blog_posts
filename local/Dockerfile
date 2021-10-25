# Dependency installation stage.
FROM node:alpine AS dependencies

# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine 
# to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

# React app build stage.
FROM node:alpine AS runner

WORKDIR /app

COPY . .

COPY --from=dependencies /app/node_modules ./node_modules

ENTRYPOINT ["npm", "run", "start"]
