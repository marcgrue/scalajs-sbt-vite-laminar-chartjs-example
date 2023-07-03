#!/usr/bin/env bash

# create Vite project in vite directory
npm create vite@4.1.0 vite-server -- --template vanilla

# Install node libraries needed for Vite project
cd vite-server
npm install

# Install vite-plugin-scalajs to connect to generated javascript
npm install -D @scala-js/vite-plugin-scalajs@1.0.0

# replace code in main.js -----------------------------------
cat > main.js <<EOF
import './style.css'
import 'scalajs:main.js'
EOF

# create vite.config.js file --------------------------------
cat > vite.config.js <<EOF
import { defineConfig } from "vite";
import scalaJSPlugin from "@scala-js/vite-plugin-scalajs";

export default defineConfig({
  plugins: [
    scalaJSPlugin({
      // path to the directory containing the sbt build
      // default: '.'
      cwd: '../.', // from vite folder up to root level where sbt lives

      // sbt project ID from within the sbt build to get fast/fullLinkJS from
      // default: the root project of the sbt build
      projectID: 'appJS', // use output from js platform

      // URI prefix of imports that this plugin catches (without the trailing ':')
      // default: 'scalajs' (so the plugin recognizes URIs starting with 'scalajs:')
      uriPrefix: 'scalajs',
    })
  ]
});
EOF

# Start sbt with continuous compilation
cd ..
sbt "project appJS; ~fastLinkJS"