FROM node:18-alpine

WORKDIR /nuxt

RUN apk update && apk upgrade
RUN apk add git

COPY ./package*.json /nuxt/

COPY . ./nuxt

ENV PATH ./node_modules/.bin/:$PATH

EXPOSE 3000

# build and serve
CMD [ "npm", "run", "build" ,"&&", "node", ".output/server/index.mjs" ]