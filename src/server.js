import sirv from 'sirv';
import express from 'express';
import compression from 'compression';
import * as sapper from '@sapper/server';
import { ApolloServer } from 'apollo-server-express';
import { authenticate, sanitizeUser } from './utils/auth';
import fetch from 'node-fetch';
import resolvers from './api/resolvers';
import typeDefs from './api/typedefs';
import { getMe, getKnex, pubsub } from './api/helpers/utils';
import { createServer } from 'https';
import cors from 'cors';
import serverConfig, { DIR } from '../src/config/loadConfig';
import fs from 'fs';

const { NODE_ENV, MODE_ENV } = serverConfig;
const knex = getKnex();
// console.log(knex.context);
// console.log(knex.client.config.connection);

// TODO Convert to Express
// TODO Add Helmet
// TODO Add same origin
// TODO Add Apollo Federation
// TODO Add https
// TODO Complete Docker
// TODO Encrypt user or remove userid from session
// TODO apiurl in object session
// TODO Change server file extensions to .server.js
// TODO Move @lib from node_modules
// TODO Split databases: Opp info from one database, user info from other
// TODO Logout remove cokkies// TODO Avoid Refresh log out

const { json } = require('body-parser');

global.fetch = fetch;

// const { PORT } = serverConfig;
const PORT = 443;

const app = express({
  onError: (err, req, res) => {
    const error = err.message || err;
    const code = err.code || err.status || 500;
    res.headersSent || send(res, code, { error });
  },
});

const whitelist = [
  'https://localhost',
  'https://yoxye.org',
  'https://myserver.org:443',
  'https://myserver.org',
];
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
      const ignoreList = [
        'login',
        'tenantByUrl',
        'signup',
        'IntrospectionQuery',
      ];
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
server.applyMiddleware({ app, path: `/${serverConfig.GRAPHQL_EXT}` });
console.log(serverConfig.GRAPHQL_EXT);
app.use(
  json(),
  authenticate(),
  compression({ threshold: 0 }),
  sirv('static', {
    dev: serverConfig.IS_DEV,
    setHeaders(res) {
      res.hasHeader('Cache-Control') ||
        res.setHeader('Cache-Control', 'max-age=600'); // 10min default
    },
  }),
  sapper.middleware({
    session: (req) => ({
      user: sanitizeUser(req.user),
      token: req.sid,
      apiUrl: serverConfig.API_URL,
      wsUrl: serverConfig.SOCKET_URL,
      tokenHandle: serverConfig.TOKEN_HANDLE,
      appUrl: serverConfig.APP_URL,
    }),
  })
);
// set NODE_EXTRA_CA_CERTS=./myserver.org-fullchain.cert.pem
const httpServer = createServer(
  {
    key: fs.readFileSync(`${DIR}/myserver.org.nopass.key.pem`, 'utf8'),
    cert: fs.readFileSync(`${DIR}/myserver.org.cert.pem`, 'utf8'),
  },
  app
);
// server.installSubscriptionHandlers(httpServer);
httpServer.listen({ port: PORT }, () => {
  console.log(
    `🚀 Server ready at http://localhost:${PORT}${server.graphqlPath}`
  );
  console.log(
    `🚀 Subscriptions ready at ws://localhost:${PORT}${server.subscriptionsPath}`
  );
});
