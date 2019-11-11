import send from "@polka/send";
import * as cookie from "cookie";
import Actions from "./_actions";

export async function post(req, res, next) {
  try {
    // Call an authenication graphql to handle the authentication.
    // return UserAuth data type
    let result = await Actions.signIn(this.props.client, email, password, "http://localhost:3000");
    if (result.error) throw result.error;

    res.writeHead(200, {
      "Set-Cookie": cookie.serialize("sid", result.data.sid, {
        maxAge: 31536000,
        path: "/",
        httpOnly: true
      }),
      "Content-Type": "application/json; charset=utf-8"
    });

    res.end(JSON.stringify(result.data.user));
  } catch (e) {
    console.error("GET /auth/login", e);
    send(res, 500, e.data, {
      "Content-Type": e.headers["content-type"],
      "Content-Length": e.headers["content-length"]
    });
  }
}
