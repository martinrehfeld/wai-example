{-# LANGUAGE DeriveDataTypeable #-}

import System.Console.CmdArgs
import Network.Wai.Handler.Warp (run)
import Network.Wai.Middleware.RequestLogger (logStdout)
import App (withApp)

data Server = Server {port :: Int}
              deriving (Show, Data, Typeable)

server = Server {port = 8080 &= typ "PORT" &=
                 help "Port to listen on (default: 8080)"
                } &=
                program "wai-example" &=
                summary "WAI example webservice v0.1.0.0"


main = do
    args <- cmdArgs server
    let p = port args
    putStrLn $ "Warp is starting on http://localhost:" ++ show p ++ "/ ..."
    withApp (\app -> (run p) (middleware $ app))

middleware = logStdout
