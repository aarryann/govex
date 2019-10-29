import "dotenv/config";
import send from "@polka/send";
import * as cookie from "cookie";
import { create_user, create_session } from "../../utils/auth";

export async function post(req, res, next) {
  try {
    // Call an authenication microservice to handle the authentication.
    const { AUTH_SERVICE } = process.env;
    if (AUTH_SERVICE) {
      // Calls the external refresh token create endpoint
      /*
      const r1 = await fetch(AUTH_SERVICE + '/api/refresh_tokens', {
        method: 'POST',
        headers: {
          Accept: 'application/ld+json',
          'Content-Type': 'application/ld+json'
        },
        body: JSON.stringify({ email: email, password: password })
      });

      res.status(await r1.status);
      const data = await r1.json();
      */
      const data = {
        id: "1",
        name: "John",
        login: "john@be.com",
        avatar_url: "http://myurl.com"
      };
      const user = await create_user(data, "abc");
      const session = await create_session(user);

      res.writeHead(200, {
        "Set-Cookie": cookie.serialize("sid", session.uid, {
          maxAge: 31536000,
          path: "/",
          httpOnly: true
        }),
        "Content-Type": "application/json; charset=utf-8"
      });

      //req.session.user = true;
      //req.session.refresh_token = data.token;
      //req.session.rt_id = data["@id"];
      res.end(JSON.stringify(data));
    }
  } catch (err) {
    console.error("GET /auth/login", err);
    send(res, 500, err.data, {
      "Content-Type": err.headers["content-type"],
      "Content-Length": err.headers["content-length"]
    });
  }
}
