# Vite-Laminar-ScalablyTyped cross project

In project root, run the following commands:

    # create Vite project in vite directory
    npm create vite@latest vite -- --template vanilla

    # Install node libraries needed for Vite project
    cd vite
    npm install

    # Install Chart.js dependency and Typescript type definitions
    npm install -S chart.js@2.9.4
    npm install -D @types/chart.js@2.9.29 typescript@4.9.5

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
          projectID: 'livechartJS', // use output from js platform
      
          // URI prefix of imports that this plugin catches (without the trailing ':')
          // default: 'scalajs' (so the plugin recognizes URIs starting with 'scalajs:')
          uriPrefix: 'scalajs',
        })
      ],
    });
    EOF

    # Start sbt with continuous compilation
    cd ..
    sbt
    > ~livechartJS/fastLinkJS

Open another terminal tab and start Vite server from vite directory:

    cd vite
    npm run dev

Open http://localhost:5173 (port might be different if multiple Vite pages are open - see Vite output)
