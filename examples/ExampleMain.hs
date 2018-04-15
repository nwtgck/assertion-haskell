{-# LANGUAGE QuasiQuotes #-}

import Assertion

main :: IO ()
main = do
  let a = "hello"
  let b = 10
  [assertM|a == "hello" && b > 9999999|]
  
  putStrLn "End!"
