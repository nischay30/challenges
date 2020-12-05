FROM node:lts-alpine3.10

WORKDIR /app

COPY build .

RUN yarn global add serve

RUN ls -lart

CMD ["serve", "-s", "."]
