FROM node:latest as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build
ENTRYPOINT /bin/bash -c "npm install -g serve && serve -l tcp://0.0.0.0:3000"
