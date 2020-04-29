import * as cookie from 'cookie';
import jwt from 'jsonwebtoken';
import config from '../config/serverConfig';

export const authenticate = () => {
  return async (req, res, next) => {
    req.cookies = cookie.parse(req.headers.cookie || '');

    if (req.cookies.sid) {
      req.sid = req.cookies.sid;
      const { user } = jwt.decode(req.cookies.sid, config.APP_SECRET);
      req.user = user;
    }

    next();
  };
};

export const sanitizeUser = (obj) => obj && { userId: obj.userId };
