FROM node:latest as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build
RUN ["/bin/bash", "-c", "set -o pipefail && npm run build"]
ENTRYPOINT ["entrypoint.sh"]
