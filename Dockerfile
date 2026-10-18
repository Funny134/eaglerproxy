
FROM node:22-alpine

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

RUN npm install --no-save --package-lock=false typescript@5.8.3
RUN npx tsc -p tsconfig.json

CMD ["node", "build/index.js"]
