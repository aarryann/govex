import { config } from 'dotenv';
import path from 'path';

const { NODE_ENV, MODE_ENV, PORT } = process.env;
if (!NODE_ENV || !MODE_ENV || !PORT) {
  throw new Error('COnfig Required environment variables are not set');
}
const DIR = path.resolve(
  __dirname,
  NODE_ENV === 'production' ? '../../..' : './'
);

export const pathName = `${DIR}/src/secrets/.env.${NODE_ENV}.${MODE_ENV}`;
config({ path: pathName });

export default {
  NODE_ENV: process.env.NODE_ENV,
  MODE_ENV: process.env.MODE_ENV,
  PORT: process.env.PORT,
  ANALYZE: process.env.ANALYZE,

  API_URL: `${process.env.PROTOCOL}://${process.env.HOST}:${process.env.PORT}/${process.env.GRAPHQL_EXT}`,
  APP_URL: `${process.env.PROTOCOL}://${process.env.HOST}:${process.env.PORT}`,
  APP_SECRET: process.env.APP_SECRET,
  DB_URL: process.env.DB_URL,
  GRAPHQL_EXT: process.env.GRAPHQL_EXT,
  HOST: process.env.HOST,
  IS_DEV: process.env.NODE_ENV === 'development',
  IS_PROD: process.env.NODE_ENV === 'production',
  IS_SERVER: typeof window === 'undefined',
  PROTOCOL: process.env.PROTOCOL,
  SOCKET_URL: `ws://${process.env.HOST}:${process.env.PORT}/${process.env.GRAPHQL_EXT}`,
  TOKEN_HANDLE: process.env.TOKEN_HANDLE,
};
