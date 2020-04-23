export default {
  NODE_ENV: process.env.NODE_ENV,
  CUSTOM_ENV: process.env.CUSTOM_ENV,
  ANALYZE: process.env.ANALYZE,

  API_URL: process.env.API_URL,
  APP_SECRET: process.env.APP_SECRET,
  DB_URL: process.env.DB_URL,
  HOST: process.env.HOST,
  IS_PROD: process.env.NODE_ENV === 'production',
  IS_SERVER: typeof window === 'undefined',
  PORT: process.env.PORT,
  SOCKET_URL: process.env.SOCKET_URL,
  TENANT_URL: process.env.TENANT_URL,
  TOKEN_HANDLE: process.env.TOKEN_HANDLE,
};
