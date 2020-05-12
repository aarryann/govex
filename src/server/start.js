// {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.oM7HJV9tjc0TSdiVdS6jje0QgejmKa-uoPSdm1JVNJ4"}
import * as sapper from '@sapper/server';
import sirv from 'sirv';
import express from 'express';
import compression from 'compression';
import { ApolloServer } from 'apollo-server-express';
import { authenticateUser, sanitizeUser, loginHandler, logoutHandler } from './lib/auth';
import fetch from 'node-fetch';
import helmet from 'helmet';
import fs from 'fs';
import http from 'http';
import https from 'https';
import cors from 'cors';
import passport from 'passport';
import { createLogger, format, transports } from 'winston';
import morgan from 'morgan';

import resolvers from './resolvers';
import typeDefs from './typedefs';
import { localStrategy } from './lib/password-local';
import * as serverHandlers from './lib/handlers';
import serverConfig, { getBaseDir } from './config/loadConfig';

passport.use(localStrategy);

export default () => {
  const { json } = require('body-parser');

  global.fetch = fetch;

  const {
    API_URL,
    APP_URL,
    CERT,
    GRAPHQL_EXT,
    HOST,
    IS_DEV,
    IS_SECURE,
    KEY,
    MODE_ENV,
    PORT,
    PROTOCOL,
    SOCKET_PROTOCOL,
    SOCKET_URL,
    TOKEN_HANDLE,
  } = serverConfig;

  const app = express({ onError: (err, req, res) => serverHandlers.serverErrorHandler(err, req, res) });
  const logger = createLogger({
    level: 'info',
    format: format.combine(
      format.timestamp({
        format: 'YYYY-MM-DD HH:mm:ss',
      }),
      format.errors({ stack: true }),
      format.splat(),
      format.json()
    ),
    transports: [
      new transports.File({
        level: 'info',
        filename: './logs/error-logs.log',
        handleExceptions: true,
        maxsize: 5242880, //5MB
        maxFiles: 5,
        colorize: false,
      }),
      new transports.File({ filename: './logs/all-logs.log' }),
    ],
    exitOnError: false,
  });

  //
  // If we're not in production then **ALSO** log to the `console`
  // with the colorized simple format.
  //
  if (process.env.NODE_ENV !== 'production') {
    logger.add(
      new transports.Console({
        format: format.combine(format.colorize(), format.simple()),
      })
    );
  }
  /*
  const logger = createLogger({
    level: 'info',
    format: format.combine(
      format.timestamp({
        format: 'YYYY-MM-DD HH:mm:ss',
      }),
      format.errors({ stack: true }),
      format.splat(),
      format.json()
    ),
    defaultMeta: { service: 'Govex' },
    transports: [
      //
      // - Write to all logs with level `info` and below to `quick-start-combined.log`.
      // - Write all logs error (and below) to `quick-start-error.log`.
      //
      new transports.File({ filename: './logs/quick-start-error.log', level: 'error' }),
      new transports.File({ filename: './logs/quick-start-combined.log' }),
    ],
  });
*/
  logger.stream = {
    write: function (message, encoding) {
      logger.info(message);
    },
  };

  app.use(morgan('combined', { stream: logger.stream }));

  const whitelist = ['http://localhost:4812', 'https://yoxye.org', 'https://yoxye.org:443', 'https://myserver.org'];
  const corsOptions = {
    origin: (origin, callback) => serverHandlers.originHandler(origin, callback, whitelist),
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  };
  app.options('*', cors());
  app.use('*', cors(corsOptions));
  app.enable('trust proxy');
  app.use(helmet());
  app.use(json());
  // compression should be setup in reverse proxy on the server, it is enabled on local for testing performance
  if (MODE_ENV === 'local') {
    app.use(compression({ threshold: 0 }));
  }

  const server = new ApolloServer({
    typeDefs,
    resolvers,
    formatError: (error) => serverHandlers.formatErrorHandler(error),
    context: ({ req }) => serverHandlers.serverContextHandler({ req }),
  });
  server.applyMiddleware({ app, path: `/${GRAPHQL_EXT}` });

  app.post('/auth/login', async (req, res, next) => loginHandler(req, res, next));
  app.get('/auth/logout', async (req, res, next) => logoutHandler(req, res, next));

  app.use(
    authenticateUser(),
    sirv('static', {
      dev: IS_DEV,
      setHeaders(res) {
        res.hasHeader('Cache-Control') || res.setHeader('Cache-Control', 'max-age=600'); // 10min default
      },
    }),
    sapper.middleware({
      session: (req) => ({
        user: sanitizeUser(req.user),
        token: req.sid,
        apiUrl: API_URL,
        wsUrl: SOCKET_URL,
        tokenHandle: TOKEN_HANDLE,
        appUrl: APP_URL,
      }),
    })
  );

  // set NODE_EXTRA_CA_CERTS=./secrets/fullchain.cert.pem
  const DIR = getBaseDir();
  const getCerts = () => ({
    key: fs.readFileSync(`${DIR}/secrets/${KEY}`, 'utf8'),
    cert: fs.readFileSync(`${DIR}/secrets/${CERT}`, 'utf8'),
  });

  const httpServer = IS_SECURE ? https.createServer(getCerts(), app) : http.createServer(app);

  server.installSubscriptionHandlers(httpServer);
  httpServer.listen({ port: PORT }, () => {
    console.log(`🚀 Server ready at ${PROTOCOL}://${HOST}:${PORT}${server.graphqlPath}`);
    console.log(`🚀 Subscriptions ready at ${SOCKET_PROTOCOL}://${HOST}:${PORT}${server.subscriptionsPath}`);
  });
};
