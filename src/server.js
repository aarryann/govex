import sirv from 'sirv';
import polka from 'polka';
import compression from 'compression';
import * as sapper from '@sapper/server';
import { ApolloServer } from 'apollo-server-express';
import { authenticate, sanitizeUser } from './utils/auth';
import fetch from 'node-fetch';
import resolvers from './api/resolvers';
import typeDefs from './api/typedefs';
import { getMe, knex, pubsub } from './api/helpers/utils';
import { createServer } from 'http';
import cors from 'cors';
import serverConfig from '../src/config/serverConfig';

const { NODE_ENV, MODE_ENV } = serverConfig;

// TODO Convert to Express
// TODO Add Helmet
// TODO Add same origin
// TODO Add Apollo Federation
const { json } = require('body-parser');

global.fetch = fetch;

const { PORT } = serverConfig;

const app = polka({
  onError: (err, req, res) => {
    const error = err.message || err;
    const code = err.code || err.status || 500;
    res.headersSent || send(res, code, { error });
  },
});

const whitelist = [
  `${serverConfig.PROTOCOL}://${serverConfig.HOST}:${serverConfig.PORT}`,
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
// app.options('*', cors());
// app.use('*', cors(corsOptions));

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

const { handler } = app.use(
  json(),
  authenticate(),
  compression({ threshold: 0 }),
  sirv('static', {
    dev: serverConfig.IS_DEV,
    setHeaders(res) {
      res.setHeader('Access-Control-Allow-Origin', '*');
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
const httpServer = createServer(handler);
server.installSubscriptionHandlers(httpServer);
app.listen({ port: PORT }, () => {
  console.log(
    `🚀 Server ready at http://localhost:${PORT}${server.graphqlPath}`
  );
  console.log(
    `🚀 Subscriptions ready at ws://localhost:${PORT}${server.subscriptionsPath}`
  );
});
