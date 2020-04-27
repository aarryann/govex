import { config } from 'dotenv';
import replace from '@rollup/plugin-replace';
import babel from 'rollup-plugin-babel';
import commonjs from 'rollup-plugin-commonjs';
import builtins from 'rollup-plugin-node-builtins';
import resolve from 'rollup-plugin-node-resolve';
import svelte from 'rollup-plugin-svelte';
import { terser } from 'rollup-plugin-terser';
import rollupConfig from 'sapper/config/rollup.js';
import pkg from './package.json';
import sveltePreprocess from 'svelte-preprocess';

const { NODE_ENV, MODE_ENV } = process.env;
if (!NODE_ENV || !MODE_ENV) {
  throw new Error('Required environment variables are not set');
}
const pathName = `${__dirname}/src/secrets/.env.${NODE_ENV}.${MODE_ENV}`;
config({ path: pathName });

const dev = NODE_ENV === 'development';
const legacy = !!process.env.SAPPER_LEGACY_BUILD;

const onwarn = (warning, onwarn) =>
  (warning.code === 'CIRCULAR_DEPENDENCY' &&
    /[/\\]@sapper[/\\]/.test(warning.message)) ||
  warning.message === 'Unused CSS selector' ||
  onwarn(warning);
const dedupe = (importee) =>
  importee === 'svelte' || importee.startsWith('svelte/');

const preprocess = sveltePreprocess({
  scss: {
    includePaths: ['src'],
  },
  postcss: {
    plugins: [require('autoprefixer')],
  },
});

export default {
  client: {
    input: rollupConfig.client.input(),
    output: rollupConfig.client.output(),
    plugins: [
      builtins(),
      commonjs(),
      replace({
        'process.browser': true,
        'process.env.NODE_ENV': JSON.stringify(NODE_ENV),
      }),
      resolve({
        browser: true,
        dedupe,
      }),
      svelte({
        dev,
        hydratable: true,
        preprocess,
        emitCss: true,
      }),

      legacy &&
        babel({
          extensions: ['.js', '.mjs', '.html', '.svelte'],
          runtimeHelpers: true,
          exclude: ['node_modules/@babel/**'],
          presets: [
            [
              '@babel/preset-env',
              {
                targets: '> 0.25%, not dead',
              },
            ],
          ],
          plugins: [
            '@babel/plugin-syntax-dynamic-import',
            [
              '@babel/plugin-transform-runtime',
              {
                useESModules: true,
              },
            ],
          ],
        }),

      !dev &&
        terser({
          module: true,
        }),
    ],
    preserveEntrySignatures: false,

    onwarn,
  },

  server: {
    input: rollupConfig.server.input(),
    output: rollupConfig.server.output(),
    plugins: [
      builtins(),
      commonjs(),
      replace({
        'process.browser': false,
        'process.env.NODE_ENV': JSON.stringify(NODE_ENV),
      }),
      resolve({
        dedupe,
      }),
      svelte({
        generate: 'ssr',
        preprocess,
        dev,
      }),
    ],
    external: Object.keys(pkg.dependencies).concat(
      require('module').builtinModules ||
        Object.keys(process.binding('natives'))
    ),

    onwarn,
  },

  serviceworker: {
    input: rollupConfig.serviceworker.input(),
    output: rollupConfig.serviceworker.output(),
    plugins: [
      builtins(),
      commonjs(),
      resolve(),
      replace({
        'process.browser': true,
        'process.env.NODE_ENV': JSON.stringify(NODE_ENV),
      }),
      !dev && terser(),
    ],

    onwarn,
  },
};
