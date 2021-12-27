FROM node:14.18-alpine

RUN npm config set progress false

RUN mkdir -p /app
WORKDIR /app
ADD . .
RUN npm install

EXPOSE 3000
