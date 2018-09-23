const webpack = require("webpack");
const path = require("path");

module.exports = {
  mode: 'production',
  entry: [
    'babel-polyfill',
    './src/index.js',
  ],
  output: {
    path: path.join(__dirname, "/dist"),
    filename: 'main.js'
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        use: [
          {
            loader: 'babel-loader'
          }
        ],
        exclude: /node_modules/
      },
      {
        test: /\.scss/,
        use: [
          'style-loader',
          {loader: 'css-loader', options: {url: false}},
        ],
      }
    ]
  }
};