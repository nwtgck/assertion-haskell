{-# LANGUAGE TemplateHaskell #-}

import Assertion

-- NOTE: Compile error (Good!)
main :: IO ()
main = do
  -- NOTE: Compile error (Good!)
  let _ = $(staticAssert (length "hello" == 99999))  
  
  putStrLn "End!"
