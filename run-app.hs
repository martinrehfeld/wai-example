import Network.Wai.Handler.DevelServer (runQuit)

main = do
    putStrLn $ "Warp is starting on http://localhost:8080/ ..."
    runQuit 8080 "App" "withApp" (const $ return [])
