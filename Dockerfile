FROM node:slime
WORKDIR /app
COPY package*.json ./
RUN ["/bin/bash", "-c", "set -o pipefail && npm install"]
COPY ./ .
RUN ["/bin/bash", "-c", "set -o pipefail && npm run build"]
RUN ["/bin/bash", "-c", "set -o pipefail && npm audit"]
ENTRYPOINT ["/entrypoint.sh"]
