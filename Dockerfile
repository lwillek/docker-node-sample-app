FROM node:18-alpine

LABEL org.opencontainers.image.source=https://github.com/lwillek/docker-node-sample-app
LABEL org.opencontainers.image.description="Sample node app docker"
LABEL org.opencontainers.image.licenses=MIT

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/my-app

COPY ./my-app /home/my-app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/my-app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]

