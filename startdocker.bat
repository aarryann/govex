rem docker run -d --expose 4812 --env PORT=4812 -p 4812:4812 --name govex_app aarryann/govex
IF "%1" == "" GOTO dev
IF "%1" == "dev" GOTO dev
IF "%1" == "test" GOTO test
IF "%1" == "stage" GOTO stage
IF "%1" == "prod" GOTO prod
exit /b

:dev
docker-compose build --build-arg NODE_ENV=development --no-cache && docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
exit /b

:test
docker-compose build --build-arg NODE_ENV=production --no-cache && docker-compose -f docker-compose.yml -f docker-compose.test.yml up -d
exit /b

:stage
docker-compose build --build-arg NODE_ENV=production --no-cache && docker-compose -f docker-compose.yml -f docker-compose.stage.yml up -d
exit /b

:prod
docker-compose build --build-arg NODE_ENV=production --no-cache && docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
exit /b
