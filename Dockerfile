FROM node:22-alpine AS base

RUN npm i

CMD [ "npm", "run", "dev" ]
