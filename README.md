# Vite-Laminar cross project

Clone project, checkout this branch and run setup:

    https://github.com/marcgrue/scalajs-sbt-vite-laminar-chartjs-example.git
    cd scalajs-sbt-vite-laminar-chartjs-example
    git checkout cross-laminar
    ./setup.sh

Open another terminal process and start Vite server from vite directory:

    cd vite-server
    npm run dev

Open http://localhost:5173 to see Laminar scala code transpiled to js with hot reloading by Vite.

(port might be different if multiple Vite pages are open - see Vite output)
