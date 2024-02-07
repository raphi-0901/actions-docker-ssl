USER=$1;
HOST=$2;
KEY_PATH=$3;
PROJECT=actions-docker-ssl

set -e
echo 'See if it works'
echo user: $USER
echo host: $HOST
echo key path: $KEY_PATH

sudo ssh -o StrictHostKeyChecking=no -i "$KEY_PATH" \
 "$USER@$HOST" \
 "cd ./$PROJECT || true ; \
 git pull || true ; \
 docker-compose -f docker-compose.production.yml run --rm nuxt npm i || true ; \
 docker-compose -f docker-compose.production.yml run --rm strapi npm i || true ; \
 docker-compose -f docker-compose.production.yml up --force-recreate --build -d || true ; \
 ls -al || true"