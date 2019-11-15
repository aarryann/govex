import { mutations, queries } from "./_queries";
import { getClient, query, mutate } from "svelte-apollo";
import * as cookie from "cookie";
import { SessionCache } from "../../conf/config.js";

const Actions = {
  authenticate: client => {
    // this is a convenient time to clear out expired sessions
    return async (req, res, next) => {
      req.cookies = cookie.parse(req.headers.cookie || "");
      req.sid = req.cookies.sid;
      req.user = await Actions.getUser(client, req.cookies.sid);

      next();
    };
  },

  deleteSession: async sid => {
    // await query(`delete from sessions where uid = $1`, [sid]);
    SessionCache.set(sid, null);
  },

  // If user refreshes browser or revisits signin without logging out ... the
  // current user will need to be regenerated to put currentUser in store
  // TODO: Use apollo-cache-persist
  getCurrentUser: async client => {
    try {
      const results = await client.query({ query: queries.currentUser });
      const data = results.data.currentUser;
      Actions.setCurrentUser(data.sid, data.user);
    } catch (e) {
      console.log(`Error#CurrentUser: ${e}`);
    }
  },

  // Get tenant
  getTenantByUrl: async (client, url) => {
    try {
      // client.clearStore();
      const payload = {
        query: queries.tenantByUrl,
        variables: { url }
      };
      const results = await query(client, payload);
      if (results.error) return { error: results.error.message };

      const tenant = results.data.tenantByUrl;
      return { data: tenant.id };
    } catch (e) {
      console.log(`Error#GetTenantByUrl: ${e}`);
      return { error: e.message };
    }
  },

  getUser: async sid => {
    //console.log("getUser**********");
    if (!sid) return null;
    //else if (!SessionCache.has(sid)) Actions.getCurrentUser();
    return SessionCache.get(sid);
  },

  sanitizeUser: obj =>
    obj && {
      uid: obj.uid,
      username: obj.username,
      name: obj.name
    },

  setCurrentUser: async (sid, user) => {
    SessionCache.set(sid, user);
  },

  // On signin click
  signIn: async (email, password, url) => {
    console.log("signIn**********");
    try {
      // client.clearStore();
      const payload = {
        mutation: mutations.login,
        variables: { email, password, url }
      };
      const result = await mutate(client, payload);
      if (result.error) return { error: result.error.message };

      console.log(JSON.stringify(results, null, " "));
      const data = result.data.login;
      Actions.setCurrentUser(data.sid, data.user);
      return { data };
    } catch (e) {
      console.log(`Error#SignIn: ${e}`);
      return { error: e.message };
    }
  },

  signOut: client => {
    const tokenName = process.env.ENV_TOKEN_NAME;
    if (localStorage.getItem(tokenName)) {
      localStorage.removeItem(tokenName);
    }
    client.clearStore();
  }
};

export default Actions;
