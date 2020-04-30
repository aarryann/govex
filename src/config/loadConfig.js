import { config } from 'dotenv';
import serverConfig from './serverConfig';
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

export default serverConfig;
