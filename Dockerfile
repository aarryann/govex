# IMPORTANT: Don't use this Dockerfile in your own Sapper projects without also looking at the .dockerignore file.
# Without an appropriate .dockerignore, this Dockerfile will copy a large number of unneeded files into your image.

FROM mhart/alpine-node:12 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
# Needs to be in development mode to install sapper from devDependencies
RUN npm ci --unsafe-perm
# Define NODE_ENV after installing npm modules
ARG NODE_ENV
COPY . .
RUN npm run build

RUN npm ci --production --unsafe-perm

# Only copy over the Node pieces we need saves 35MB
FROM mhart/alpine-node:slim-12

WORKDIR /app
COPY --from=builder /app .

CMD ["node", "__sapper__/build"]