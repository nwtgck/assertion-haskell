module Assertion where

-- | assert
myAssert :: Bool -> a -> a
myAssert False _ = error "assertion failed"
myAssert _     x = x