import send from '@polka/send';
import * as cookie from 'cookie';
import passport from 'passport';
import { localStrategy } from '../../server/lib/password-local';
import { encryptSession } from '../../server/lib/iron';
import { setTokenCookie } from '../../server/lib/auth-cookies';

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

passport.use(localStrategy);
export const post = async (req, res, next) => {
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
    send(res, 200, JSON.stringify(data), {
      'Content-Type': 'application/json; charset=utf-8',
    });
  } catch (errors) {
    const e = { errors, ok: false, status: 500 };
    send(res, 500, JSON.stringify(e), {
      'Content-Type': 'application/json; charset=utf-8',
    });
  }
};
