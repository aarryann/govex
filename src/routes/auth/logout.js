import send from '@polka/send';
import * as cookie from 'cookie';

export async function get(req, res) {
  send(res, 200, '', {
    'Set-Cookie': cookie.serialize(process.env.TOKEN_HANDLE, '', {
      maxAge: -1,
      path: '/',
      httpOnly: true,
    }),
  });
}
