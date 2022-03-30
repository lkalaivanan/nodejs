FROM node:12-alpine as builder
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
RUN npm config set unsafe-perm true
USER node
RUN npm install
COPY --chown=node:node . .
RUN npm run 
EXPOSE 8080
CMD [ "node", "server.js" ]
