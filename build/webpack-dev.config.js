'use strict';

const path              = require('path');
const precss            = require('precss');
const autoprefixer      = require('autoprefixer');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  cache:  true,
  entry:  path.join(__dirname, '..', 'web', 'src', 'main.js'),
  output: {
    path:     path.join(__dirname, '..', 'web', 'dist'),
    filename: 'app.js'
  },
  module: {
    loaders: [
      {
        test:     /\.(png|woff|woff2|eot|ttf|svg)$/,
        loader:   'url-loader?limit=100000'
      },
      {
        test:   /\.css$/,
        loader: ExtractTextPlugin.extract(
          'style-loader',
          'css-loader?modules&importLoaders=1&' +
          'localIdentName=[name]__[local]___[hash:base64:5]!postcss-loader'
        )
      },
      {
        test:     /\.js$/,
        query:    {
          presets: [ 'stage-2', 'react' ],
          plugins: [ 'syntax-flow', 'transform-flow-strip-types' ]
        },
        loader:   'babel-loader',
        exclude:  /(node_modules)/
      }
    ]
  },
  resolve: {
    extensions:         [ '', '.js' ],
    modulesDirectories: [
      'node_modules',
      path.join(__dirname, '..', 'web', 'src')
    ]
  },
  plugins: [
    new HtmlWebpackPlugin(),
    new ExtractTextPlugin('app.css')
  ],
  postcss: () => [ autoprefixer, precss ]
};