import { serialize, parse } from 'cookie';
import serverConfig from '../config/loadConfig';

const MAX_AGE = 60 * 60 * 8; // 8 hours
const { TOKEN_HANDLE, IS_SECURE } = serverConfig;

export function setTokenCookie(res, token) {
  const cookie = serialize(TOKEN_HANDLE, token, {
    maxAge: MAX_AGE,
    expires: new Date(Date.now() + MAX_AGE * 1000),
    path: '/',
    httpOnly: true,
    sameSite: 'strict',
    secure: IS_SECURE,
  });

  res.setHeader('Set-Cookie', cookie);
}

export function removeTokenCookie(res) {
  const cookie = serialize(TOKEN_HANDLE, '', {
    maxAge: -1,
    path: '/',
    httpOnly: true,
    sameSite: 'strict',
    secure: IS_SECURE,
  });

  res.setHeader('Set-Cookie', cookie);
}

export function parseCookies(req) {
  // For API Routes we don't need to parse the cookies.
  if (req.cookies) return req.cookies;

  // For pages we do need to parse the cookies.
  const cookie = req.headers.cookie;
  return parse(cookie || '');
}

export function getTokenCookie(req) {
  const cookies = parseCookies(req);
  return cookies[TOKEN_HANDLE];
}
