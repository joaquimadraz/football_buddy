var path = require('path')
const ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports = {
  resolve: {
    modules: [
      "node_modules",
      path.resolve(__dirname, "src"),
    ],
    extensions: ['.js', '.jsx'],
  },
  entry: {
    app: [
      path.resolve(__dirname, './src/index.jsx'),
    ],
  },
  output: {
    path: path.resolve(__dirname, '../priv/static'),
    filename: '[name].bundle.js',
  },
  module: {
    rules: [
      {
        test: /.jsx?$/,
        use: ['babel-loader'],
        exclude: /node_modules/,
      },
      {
        test: /\.s?css$/,
        use: ExtractTextPlugin.extract({
          use: 'css-loader!sass-loader',
        }),
      },
      {
        test: /\.(png|gif|jpg)$/,
        use: 'file-loader?name=images/[name].[ext]',
        exclude: /node_modules/,
      },
      {
        test: /\.(ttf|eot|svg|woff|woff(2)?)(\?[a-z0-9=&.]+)?$/,
        use: 'file-loader?name=images/[name].[ext]',
        exclude: /node_modules/,
      }
    ],
  },
  plugins: [
    new ExtractTextPlugin({ filename: 'app.bundle.css', allChunks: true }),
  ],
}
