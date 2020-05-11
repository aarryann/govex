import { removeTokenCookie } from '../../server/lib/auth-cookies';

export async function get(req, res) {
  removeTokenCookie(res);
  res.setHeader('Content-Type', 'application/json; charset=utf-8');
  const data = { ok: true, status: 200 };
  res.status(200).send(JSON.stringify(data));
}
