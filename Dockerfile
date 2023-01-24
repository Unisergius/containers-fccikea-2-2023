FROM node:19-alpine

WORKDIR /home/node/app

COPY package.json ./

COPY package-lock.json ./

RUN npm install

RUN mkdir src

COPY ./index.js ./

ENV PORT=8080

EXPOSE 8080

CMD [ "npm", "start" ]