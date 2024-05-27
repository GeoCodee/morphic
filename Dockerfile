# FROM oven/bun:1.1.3-alpine

# RUN apk add --no-cache nodejs npm git

# RUN git clone --depth=1 https://github.com/miurla/morphic /app && \
#   rm -rf /app/.git && \
#   cd /app && \
#   bun i && \
#   bun next telemetry disable

# WORKDIR /app

# CMD ["bun", "dev"]
FROM node:18-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install 
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]