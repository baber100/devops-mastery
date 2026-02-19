# Étape 1 : Build
FROM node:18-alpine AS build
WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app/ .

# Étape 2 : Production
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["node", "app.js"]
