import 'dotenv/config';
import replace from '@rollup/plugin-replace';
import babel from 'rollup-plugin-babel';
import commonjs from 'rollup-plugin-commonjs';
import dotenvPlugin from 'rollup-plugin-dotenv';
import resolve from 'rollup-plugin-node-resolve';
import svelte from 'rollup-plugin-svelte';
import { terser } from 'rollup-plugin-terser';
import config from 'sapper/config/rollup.js';
import pkg from './package.json';
import sveltePreprocess from 'svelte-preprocess';

const mode = process.env.NODE_ENV;
const dev = mode === 'development';
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
    input: config.client.input(),
    output: config.client.output(),
    plugins: [
      commonjs(),
      dotenvPlugin(),
      replace({
        'process.browser': true,
        'process.env.NODE_ENV': JSON.stringify(mode),
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
    input: config.server.input(),
    output: config.server.output(),
    plugins: [
      commonjs(),
      dotenvPlugin(),
      replace({
        'process.browser': false,
        'process.env.NODE_ENV': JSON.stringify(mode),
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
    input: config.serviceworker.input(),
    output: config.serviceworker.output(),
    plugins: [
      commonjs(),
      dotenvPlugin(),
      resolve(),
      replace({
        'process.browser': true,
        'process.env.NODE_ENV': JSON.stringify(mode),
      }),
      !dev && terser(),
    ],

    onwarn,
  },
};
