import * as cookie from 'cookie';
import jwt from 'jsonwebtoken';

export const authenticate = () => {
  return async (req, res, next) => {
    req.cookies = cookie.parse(req.headers.cookie || '');

    if (req.cookies.sid) {
      req.sid = req.cookies.sid;
      const { user } = jwt.decode(req.cookies.sid, process.env.APP_SECRET);
      req.user = user;
    }

    next();
  };
};

export const sanitizeUser = (obj) => obj && { userId: obj.userId };
