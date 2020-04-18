import send from "@polka/send";
import * as cookie from "cookie";
import Actions from "./_actions";

export async function get(req, res) {
  send(res, 200, "", {
    "Set-Cookie": cookie.serialize("sid", "", {
      maxAge: -1,
      path: "/",
      httpOnly: true
    })
  });
}
