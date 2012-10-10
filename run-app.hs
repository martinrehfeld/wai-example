-- this needs cabal install wai-handler-devel
import Network.Wai.Handler.DevelServer (runQuit)

main = runQuit 8080 "App" "withApp" (const $ return [])
