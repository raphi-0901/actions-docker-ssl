FROM node:18

WORKDIR /app
ADD wait /wait
COPY . /app
RUN chmod +x /wait

CMD ['npm', 'run', 'start']
