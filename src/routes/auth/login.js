import send from "@polka/send";
import * as cookie from "cookie";

export async function post(req, res, next) {
  try {
    // Call an authenication graphql to handle the authentication.
    // return UserAuth data type
    res.writeHead(200, {
      "Set-Cookie": cookie.serialize("sid", req.body.token, {
        maxAge: 31536000,
        path: "/",
        httpOnly: true
      }),
      "Content-Type": "application/json; charset=utf-8"
    });

    res.end(JSON.stringify(req.body.user));
  } catch (e) {
    console.error("POST /auth/login", e);
    send(res, 500, e.data, {
      "Content-Type": e.headers["content-type"],
      "Content-Length": e.headers["content-length"]
    });
  }
}
