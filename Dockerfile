FROM node:slim as build-stage
WORKDIR /app
COPY package*.json ./
RUN ["/bin/bash", "-c", "set -o pipefail && npm install"]
COPY ./ .
RUN ["/bin/bash", "-c", "sed -i 's/#efcac3/#424242/g' vue.config.js"]
RUN ["/bin/bash", "-c", "sed -i 's/#efcac3/#424242/g' src/App.vue"]
RUN ["/bin/bash", "-c", "set -o pipefail && npm run build"]

FROM nginx:1.22.1-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
