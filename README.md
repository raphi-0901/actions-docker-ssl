# Testing docker and actions for SSL

## Development setup
```js
cp nuxt/.env.example nuxt/.env

docker-compose up --build --no-start
docker-compose run --rm nuxt npm i
docker-compose up -d
```

## Production setup
```js
cp nuxt/.env.example nuxt/.env

docker-compose -f docker-compose.production.yml up --build --no-start
docker-compose -f docker-compose.production.yml run --rm nuxt npm i
docker-compose -f docker-compose.production.yml up -d
```