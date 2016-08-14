module Main where

import Lib
import Network.HTTP
import Text.HTML.TagSoup

main :: IO ()
main = do
  resp <- Network.HTTP.simpleHTTP (getRequest "http://nixos.org")
  body <- getResponseBody resp
  let tags = filter (isTagOpenName "a") $ parseTags body
  let tags' = map (fromAttrib "href") tags
  mapM_ putStrLn $ filter (/= "") tags'
