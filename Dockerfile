FROM node:22-alpine AS base

#Install some dependencies

WORKDIR /usr/app
COPY ./ /usr/app
RUN npm install

CMD [ "npm", "run", "dev" ]
