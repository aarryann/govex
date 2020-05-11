import * as cookie from 'cookie';
import jwt from 'jsonwebtoken';
import passport from 'passport';
import { encryptSession } from './iron';
import { setTokenCookie, removeTokenCookie } from './auth-cookies';
import config from '../config/loadConfig';

export const authenticateUser = () => {
  return async (req, res, next) => {
    req.cookies = cookie.parse(req.headers.cookie || '');
    const { TOKEN_HANDLE, APP_SECRET } = config;

    if (req.cookies[TOKEN_HANDLE]) {
      req.sid = req.cookies[TOKEN_HANDLE];
      const { user } = jwt.decode(req.sid, APP_SECRET);
      req.user = user;
    } else {
      req.sid = null;
      req.user = null;
    }

    next();
  };
};

// Strip off other aatributes and retain only userId
export const sanitizeUser = (obj) => {
  return obj && { userId: obj.userId };
};

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
