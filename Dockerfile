# IMPORTANT: Don't use this Dockerfile in your own Sapper projects without also looking at the .dockerignore file.
# Without an appropriate .dockerignore, this Dockerfile will copy a large number of unneeded files into your image.

FROM mhart/alpine-node:12 AS builder

# install dependencies
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci 
COPY . .

RUN npm run build

RUN npm ci --production

###
# Only copy over the Node pieces we need
# ~> Saves 35MB
###
FROM mhart/alpine-node:slim-12

WORKDIR /app
COPY --from=builder /app .
COPY . .

EXPOSE 4812

CMD ["node", "__sapper__/build"]

#docker build -t aarryann/govex .
#docker run -d --expose 4812 --env PORT=4812 -p 4812:4812 --name govex_app aarryann/govex
