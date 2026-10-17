FROM node:22-alpine

WORKDIR /usr/src/app

RUN corepack enable

COPY package.json yarn.lock ./

RUN yarn install

RUN yarn add --dev typescript@~5.8.3

COPY . .

RUN yarn exec tsc

CMD ["node", "build/index.js"]
