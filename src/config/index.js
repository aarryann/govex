export default {
  NODE_ENV: process.env.NODE_ENV,
  MODE_ENV: process.env.MODE_ENV,
  HOST: process.env.HOST,
  PORT: process.env.PORT,
  ANALYZE: process.env.ANALYZE,

  API_URL: `${process.env.PROTOCOL}://${process.env.HOST}:${process.env.PORT}/${process.env.GRAPHQL_EXT}`,
  APP_URL: `${process.env.PROTOCOL}://${process.env.HOST}:${process.env.PORT}`,
  APP_SECRET: process.env.APP_SECRET,
  DB_URL: process.env.DB_URL,
  GRAPHQL_EXT: process.env.GRAPHQL_EXT,
  IS_DEV: process.env.NODE_ENV === 'development',
  IS_PROD: process.env.NODE_ENV === 'production',
  IS_SERVER: typeof window === 'undefined',
  PROTOCOL: process.env.PROTOCOL,
  SOCKET_URL: `ws://${process.env.HOST}:${process.env.PORT}/${process.env.GRAPHQL_EXT}`,
  TOKEN_HANDLE: process.env.TOKEN_HANDLE,
};