FROM node:slim
WORKDIR /app
COPY package*.json ./
RUN ["/bin/bash", "-c", "set -o pipefail && npm install"]
COPY ./ .
RUN ["/bin/bash", "-c", "set -o pipefail && npm run build"]
ENTRYPOINT ["/entrypoint.sh"]
