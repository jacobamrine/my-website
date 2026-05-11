# Build Astro site
FROM node:22-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

# Serve static output with Nginx
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html