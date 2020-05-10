// {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.oM7HJV9tjc0TSdiVdS6jje0QgejmKa-uoPSdm1JVNJ4"}
import * as sapper from '@sapper/server';
import sirv from 'sirv';
import express from 'express';
import compression from 'compression';
import { ApolloServer } from 'apollo-server-express';
import { authenticate, sanitizeUser } from './lib/auth';
import fetch from 'node-fetch';
import helmet from 'helmet';
import fs from 'fs';
import http from 'http';
import https from 'https';
import cors from 'cors';

import resolvers from './resolvers';
import typeDefs from './typedefs';
import { getMe, getKnex, pubsub } from './lib/utils';
import serverConfig, { getBaseDir } from './config/loadConfig';

export default () => {
  const knex = getKnex();

  // TODO Match Next - httpsredirect
  // TODO Roadmap
  // TODO Complete Docker
  // TODO NGINX Reverse proxy production
  // TODO Add Apollo Federation
  // TODO Encrypt user or remove userid from session
  // TODO apiurl in object session
  // TODO Change server file extensions to .server.js
  // TODO ETL and setup database
  // TODO Split databases graphql: Opp info from one database, user info from other
  // DONE Convert to Express
  // DONE Add same origin
  // DONE Add https
  // DONE Move @lib from node_modules
  // DONE Logout remove cokkies
  // DONE Avoid Refresh log out
  // DONE Add Helmet

  const { json } = require('body-parser');

  global.fetch = fetch;

  const {
    API_URL,
    APP_URL,
    GRAPHQL_EXT,
    HOST,
    IS_DEV,
    IS_SECURE,
    MODE_ENV,
    PORT,
    PROTOCOL,
    SOCKET_PROTOCOL,
    SOCKET_URL,
    TOKEN_HANDLE,
  } = serverConfig;

  const app = express({
    onError: (err, req, res) => {
      const error = err.message || err;
      const code = err.code || err.status || 500;
      res.headersSent || send(res, code, { error });
    },
  });

  const whitelist = ['http://localhost:4812', 'https://yoxye.org', 'https://yoxye.org:443', 'https://myserver.org'];
  const corsOptions = {
    origin: function (origin, callback) {
      if (whitelist.indexOf(origin) !== -1 || !origin) {
        callback(null, true);
      } else {
        callback(new Error(`Not allowed by CORS - Origin - ${origin}`));
      }
    },
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  };
  app.options('*', cors());
  app.use('*', cors(corsOptions));
  app.enable('trust proxy');
  app.use(helmet());
  // compression should be setup in reverse proxy on the server,
  // it is enabled on local for testing performance
  if (MODE_ENV === 'local') {
    app.use(compression());
  }

  const server = new ApolloServer({
    typeDefs,
    resolvers,
    formatError: (error) => ({
      message: error.message,
      locations: error.locations,
      stack: error.stack ? error.stack.split('\n') : [],
      path: error.path,
    }),
    context: async ({ req }) => {
      const rbq = (req && req.body && req.body.query) || '';
      let ctx = { userId: 0, token: null, conn: null };
      if (rbq.length > 1) {
        const ignoreList = ['login', 'tenantByUrl', 'signup', 'IntrospectionQuery'];
        let check = true;
        for (let i = 0; i < ignoreList.length; i += 1) {
          const word = ignoreList[i];
          if (rbq.indexOf(word) >= 0) {
            check = false;
            break;
          }
        }
        ctx = (check && { ...(await getMe(req)), conn: { knex, pubsub } }) || {
          ...ctx,
          conn: { knex, pubsub },
        };
      }
      return ctx;
    },
  });
  server.applyMiddleware({ app, path: `/${GRAPHQL_EXT}` });

  app.use(
    json(),
    authenticate(),
    compression({ threshold: 0 }),
    sirv('static', {
      dev: IS_DEV,
      setHeaders(res) {
        // res.setHeader('Access-Control-Allow-Origin', '*');
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
  // set NODE_EXTRA_CA_CERTS=./myserver.org-fullchain.cert.pem
  const DIR = getBaseDir();
  const getCerts = () => ({
    key: fs.readFileSync(`${DIR}/secrets/myserver.org.nopass.key.pem`, 'utf8'),
    cert: fs.readFileSync(`${DIR}/secrets/myserver.org.cert.pem`, 'utf8'),
  });

  const httpServer = IS_SECURE ? https.createServer(getCerts(), app) : http.createServer(app);

  server.installSubscriptionHandlers(httpServer);
  httpServer.listen({ port: PORT }, () => {
    console.log(`🚀 Server ready at ${PROTOCOL}://${HOST}:${PORT}${server.graphqlPath}`);
    console.log(`🚀 Subscriptions ready at ${SOCKET_PROTOCOL}://${HOST}:${PORT}${server.subscriptionsPath}`);
  });
};
