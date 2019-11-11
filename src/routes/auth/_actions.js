import { mutations, queries } from "./_queries";
import flru from "flru";
import { getClient } from "svelte-apollo";

const _sessionCache = flru(1000);
const client = getClient();

const Actions = {
  authenticate: () => {
    // this is a convenient time to clear out expired sessions
    return async (req, res, next) => {
      req.cookies = cookie.parse(req.headers.cookie || "");
      req.sid = req.cookies.sid;
      req.user = await getUser(req.cookies.sid);

      next();
    };
  },

  // If user refreshes browser or revisits signin without logging out ... the
  // current user will need to be regenerated to put currentUser in store
  // TODO: Use apollo-cache-persist
  getCurrentUser: async () => {
    const results = await client.query({ query: queries.currentUser });
    try {
      const data = results.data.currentUser;
      Actions.setCurrentUser(data.sid, data.user);
    } catch (e) {
      console.log(`Error#CurrentUser: ${e}`);
    }
  },

  deleteSession: async sid => {
    // await query(`delete from sessions where uid = $1`, [sid]);
    _sessionCache.set(sid, null);
  },

  // Get tenant
  getTenantByUrl: async (client, url) => {
    try {
      // client.clearStore();
      const payload = {
        query: queries.tenantByUrl,
        variables: { url }
      };
      const results = await client.query(payload);
      if (results.error) return { error: results.error.message };

      const tenant = results.data.tenantByUrl;
      return { data: tenant.id };
    } catch (e) {
      console.log(`Error#GetTenantByUrl: ${e}`);
      return { error: e.message };
    }
  },

  getUser: async sid => {
    if (!sid) return null;
    else if (!_sessionCache.has(sid)) Actions.getCurrentUser();

    return _sessionCache.get(sid);
  },

  sanitizeUser: obj =>
    obj && {
      uid: obj.uid,
      username: obj.username,
      name: obj.name
    },

  setCurrentUser: async (sid, user) => {
    _sessionCache.set(sid, user);
  },

  // On signin click
  signIn: async (email, password, url) => {
    try {
      // client.clearStore();
      const payload = {
        mutation: mutations.login,
        variables: { email, password, url }
      };
      const result = await client.mutate(payload);
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
