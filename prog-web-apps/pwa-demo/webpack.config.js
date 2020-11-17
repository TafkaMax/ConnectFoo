'use strict'
const {WebpackPluginServe: Serve} = require('webpack-plugin-serve');
const path = require('path')

const options = {
    compress: true,
    client: {
        silent: false,
    },
    port: 8080,
    static: ['./dist', './wwwroot'],
}

module.exports = {
    mode: 'development',
    entry: [
        './src/index.ts',
        'webpack-plugin-serve/client'
    ],
    output: {
        filename: 'app.js',
        path: path.resolve(__dirname, 'dist'),
    },
    resolve: {
        extensions: ['.ts', '.js']
    },
    module: {
        rules: [
            {
                loader: 'ts-loader',
                test: /\.tsx?$/
            }
        ]
    },
    plugins: [
        new Serve(options)
    ],
    watch: true
}