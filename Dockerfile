# IMPORTANT: Don't use this Dockerfile in your own Sapper projects without also looking at the .dockerignore file.
# Without an appropriate .dockerignore, this Dockerfile will copy a large number of unneeded files into your image.

FROM mhart/alpine-node:12

# install dependencies
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --production

###
# Only copy over the Node pieces we need
# ~> Saves 35MB
###
FROM mhart/alpine-node:slim-12

WORKDIR /app
COPY --from=0 /app .
COPY . .

#CMD ["node", "-r dotenv/config", "__sapper__/build"]
CMD ["node", "__sapper__/build"]

#docker build -t yourusername/catnip .
#docker run --expose 8889 --env PORT=8889 -p 8889:8889 yourusername/catnip