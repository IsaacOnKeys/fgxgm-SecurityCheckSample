FROM node:23.3.0-alpine3.19 AS node_base

RUN npm install -g npm@9.1.3

ADD package.json .
ADD index.js .
ADD build .
COPY . .

RUN npm install

FROM python:3.14.0a2-alpine3.21 AS python_base

COPY --from=node_base / .

EXPOSE 8080

CMD [ "node", "index.js" ]
