FROM node:8-alpine

WORKDIR /var/app/awesome_devops

COPY package.json ./

RUN npm install

COPY app.js ./

EXPOSE 3000

CMD npm start
