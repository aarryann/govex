# IMPORTANT: Don't use this Dockerfile in your own Sapper projects without also looking at the .dockerignore file.
# Without an appropriate .dockerignore, this Dockerfile will copy a large number of unneeded files into your image.

# FROM mhart/alpine-node:12 AS builder
FROM centos/nodejs-12-centos7 AS builder
USER root
#RUN groupadd -r node && adduser -g node 
RUN groupadd -r node -g 901 && useradd -u 901 -r -g node node
RUN mkdir -p /home/node/app && chown -R 901:901 /home/node/app && chown -R 901:901 "/opt/app-root/src/"
ENV NPM_CONFIG_PREFIX=/home/node/app/.npm-global
ENV PATH=$PATH:/home/node/app/.npm-global/bin
WORKDIR /home/node/app
COPY package.json package-lock.json ./
USER node
# Needs to be in development mode to install sapper from devDependencies
RUN npm ci --unsafe-perm --allow-root
# Define NODE_ENV after installing npm modules
ARG NODE_ENV
COPY --chown=node:node . .
#RUN ["chmod", "755", "npm run build"]
RUN npm run build

RUN npm ci --production

# Only copy over the Node pieces we need saves 35MB
# FROM mhart/alpine-node:slim-12
FROM centos/nodejs-12-centos7 

WORKDIR /app
COPY --from=builder /home/node/app .

CMD ["node", "__sapper__/build"]