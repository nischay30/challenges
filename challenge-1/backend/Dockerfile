FROM node:lts-alpine3.10

WORKDIR app

COPY package.json .

RUN yarn install
COPY . .

CMD ["node", "server.js"]
