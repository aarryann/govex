import * as cookie from 'cookie';
import jwt from 'jsonwebtoken';
import config from '../config/loadConfig';

export const authenticate = () => {
  return async (req, res, next) => {
    req.cookies = cookie.parse(req.headers.cookie || '');
    const sid = config.TOKEN_HANDLE;

    if (req.cookies[sid]) {
      req.sid = req.cookies[sid];
      const { user } = jwt.decode(req.sid, config.APP_SECRET);
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
