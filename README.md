# WAI Example

This mini webservice is built on top of WAI (Haskell Web Application Interface) to demonstrate a basic re-usable project layout.


## Running in development mode

    ./run-app

This will start the app behind `wai-handler-devel` and will reload
changed code automatically before requests.


## Running behind the Warp webserver

    cabal configure                       # prepare
    cabal build                           # build
    ./dist/build/wai-example/wai-example  # run
