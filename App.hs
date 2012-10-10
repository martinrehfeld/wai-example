{-# LANGUAGE OverloadedStrings #-}

module App (withApp) where

import Network.Wai
import Network.HTTP.Types
import Data.ByteString.Lazy.Char8 ()


withApp :: (Application -> IO ()) -> IO ()
withApp handler = handler app

app :: Application
app req = do
    let r = (requestMethod req, rawPathInfo req)
    case r of
         ("GET", "/") -> return index
         _            -> return notFound

index = responseLBS
    status200
    [("Content-Type", "application/json")]
    "{\"msg\":\"JSON, Motherfucker -- Do you speak it?\"}"

notFound = responseLBS
    status404
    [("Content-Type", "text/plain")]
    "404 Not Found"
