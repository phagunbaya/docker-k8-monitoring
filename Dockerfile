FROM ubuntu

# Install Node.js
RUN apt-get update && apt-get install -y curl

RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/v0.10.39/node-v0.10.39-linux-x64.tar.gz && \
  tar -C /usr/local --strip-components 1 -xzf node-v0.10.39-linux-x64.tar.gz && \
  /usr/local/bin/node -v && \
  /usr/local/bin/npm -v

COPY metrics.js /metrics.js
COPY package.json /package.json

RUN npm install

CMD ["node", "/metrics.js"]