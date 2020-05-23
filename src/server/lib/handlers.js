import passport from 'passport';
import { encryptSession } from './iron';
import { setTokenCookie, removeTokenCookie } from './auth-cookies';
import { getMe, getKnex, pubsub } from './utils';

export const loginHandler = async (req, res, next) => {
  passport.initialize();
  try {
    const login = await authenticate('local', req, res);
    // session is the payload to save in the token, it may contain basic info about the user
    const { token, user } = login;
    // The token is a string with the encrypted session
    // const token = await encryptSession(session);

    setTokenCookie(res, token);
    const { id, email } = user;
    const data = { user: { id, email }, token, ok: true, status: 200 };
    res.setHeader('Content-Type', 'application/json; charset=utf-8');
    res.status(200).send(JSON.stringify(data));
  } catch (errors) {
    const e = { errors, ok: false, status: 500 };
    res.setHeader('Content-Type', 'application/json; charset=utf-8');
    res.status(500).send(JSON.stringify(e));
  }
};

const authenticate = (method, req, res) => {
  return new Promise((resolve, reject) => {
    passport.authenticate(method, { session: false }, (error, token) => {
      if (error) {
        reject(error);
      } else {
        resolve(token);
      }
    })(req, res);
  });
};

export const logoutHandler = async (req, res, next) => {
  removeTokenCookie(res);
  res.setHeader('Content-Type', 'application/json; charset=utf-8');
  const data = { ok: true, status: 200 };
  res.status(200).send(JSON.stringify(data));
};

// FIXME Send is from POLKA change it to res.send
export const serverErrorHandler = (err, req, res) => {
  const error = err.message || err;
  const code = err.code || err.status || 500;
  res.headersSent || send(res, code, { error });
};

export const originHandler = (origin, callback, whitelist) => {
  if (whitelist.indexOf(origin) !== -1 || !origin) {
    callback(null, true);
  } else {
    callback(new Error(`Not allowed by CORS - Origin - ${origin}`));
  }
};

export const formatErrorHandler = (error) => ({
  message: error.message,
  locations: error.locations,
  stack: error.stack ? error.stack.split('\n') : [],
  path: error.path,
});

export const serverContextHandler = async ({ req }) => {
  const knex = getKnex();
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
};
