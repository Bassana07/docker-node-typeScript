# Étape 1 : build (compilation TypeScript)
FROM node:20-alpine AS build

WORKDIR /app

# Installe les dépendances nécessaires pour build TS si besoin
RUN apk add --no-cache libc6-compat

COPY package*.json ./
RUN npm install

COPY tsconfig.json ./
COPY src ./src

RUN npm run build

# Étape 2 : image finale
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY --from=build /app/dist ./dist

CMD ["node", "dist/index.js"]
