import Network.Wai.Handler.Warp (run)
import Network.Wai.Middleware.RequestLogger (logStdout)
import App (withApp)

main = do
    putStrLn $ "Warp is starting on http://localhost:8080/ ..."
    withApp (\app -> handler (middleware $ app))
    where handler = run 8080

middleware = logStdout
