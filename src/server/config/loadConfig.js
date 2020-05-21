import { config } from 'dotenv';
import path from 'path';

const { NODE_ENV, MODE_ENV, PORT } = process.env;
if (!NODE_ENV || !MODE_ENV || !PORT) {
  throw new Error('Required environment variables are not set in load config');
}
export const getBaseDir = () => {
  const DIR = __dirname.split('__sapper__')[0];
  console.log(__dirname);
  // path.resolve(__dirname, NODE_ENV === 'production' ? '../../..' : '../../..');
  return path.resolve(DIR, './');
};
export const getPathName = () => {
  const DIR = getBaseDir();
  console.log(DIR);
  return `${DIR}/secrets/env.${NODE_ENV}.${MODE_ENV}`;
};
if (!process.env.HOST) {
  config({ path: getPathName() });
}
console.log('============================');
console.log(process.env);
const { APP_SECRET, CERT, DB_URL, GRAPHQL_EXT, HOST, KEY, PROTOCOL, TOKEN_HANDLE, ANALYZE } = process.env;
const SOCKET_PROTOCOL = PROTOCOL === 'https' ? 'wss' : 'ws';
export default {
  NODE_ENV,
  MODE_ENV,
  PORT,
  ANALYZE,

  API_URL: `${PROTOCOL}://${HOST}:${PORT}/${GRAPHQL_EXT}`,
  APP_URL: `${PROTOCOL}://${HOST}:${PORT}`,
  APP_SECRET,
  CERT,
  DB_URL,
  GRAPHQL_EXT,
  HOST,
  IS_DEV: NODE_ENV === 'development',
  IS_PROD: NODE_ENV === 'production',
  IS_SERVER: typeof window === 'undefined',
  IS_SECURE: PROTOCOL === 'https',
  KEY,
  PROTOCOL,
  SOCKET_PROTOCOL,
  SOCKET_URL: `${SOCKET_PROTOCOL}://${HOST}:${PORT}/${GRAPHQL_EXT}`,
  TOKEN_HANDLE,
};
