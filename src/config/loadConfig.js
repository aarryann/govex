import { config } from 'dotenv';
import serverConfig from './serverConfig';
import path from 'path';

const { NODE_ENV, MODE_ENV, PORT } = process.env;
if (!NODE_ENV || !MODE_ENV || !PORT) {
  throw new Error('COnfig Required environment variables are not set');
}
export const DIR1 = path.resolve(
  __dirname,
  NODE_ENV === 'production' ? '../../..' : '../../..'
);
export const DIR = 'E:/Apps/govex';
export const pathName = `${DIR}/src/secrets/.env.${NODE_ENV}.${MODE_ENV}`;
config({ path: pathName });
console.log(__dirname);
console.log(pathName);
console.log(process.env.HOST);
export default serverConfig();
