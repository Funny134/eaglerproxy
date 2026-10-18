
FROM node:22-alpine

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm ci

RUN npm install --no-save --package-lock=false typescript@5.8.3

COPY . .

RUN npx tsc -p tsconfig.json

CMD ["node", "build/index.js"]
