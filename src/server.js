import sirv from "sirv";
import polka from "polka";
import compression from "compression";
import * as sapper from "@sapper/server";
import Actions from "./routes/auth/_actions";
import fetch from "node-fetch";
const { json } = require("body-parser");

global.fetch = fetch;

const { PORT = 3000, NODE_ENV } = process.env;
const dev = NODE_ENV === "development";
const app = polka({
  onError: (err, req, res) => {
    const error = err.message || err;
    const code = err.code || err.status || 500;
    res.headersSent || send(res, code, { error });
  }
});

app
  .use(
    json(),

    Actions.authenticate(),

    compression({ threshold: 0 }),
    sirv("static", {
      dev: NODE_ENV === "development",
      setHeaders(res) {
        res.setHeader("Access-Control-Allow-Origin", "*");
        res.hasHeader("Cache-Control") || res.setHeader("Cache-Control", "max-age=600"); // 10min default
      }
    }),

    sapper.middleware({
      session: req => ({
        user: Actions.sanitizeUser(req.user, req.sid),
        token: req.sid
      })
    })
  )
  .listen(PORT, err => {
    if (err) console.log("error", err);
  });
