FROM node:18-alpine

WORKDIR /nuxt

RUN apk update && apk upgrade
RUN apk add git

COPY ./package*.json /nuxt/

COPY . ./nuxt

ENV PATH ./node_modules/.bin/:$PATH

RUN npm install
RUN npm run build

EXPOSE 3000

CMD [ "node", "nuxt/.output/server/index.mjs" ]