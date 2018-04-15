# assertion

| branch | status|
| --- | --- |
| [`master`](https://github.com/nwtgck/assertion-haskell/tree/master) | [![Build Status](https://travis-ci.org/nwtgck/assertion-haskell.svg?branch=master)](https://travis-ci.org/nwtgck/assertion-haskell) |
| [`develop`](https://github.com/nwtgck/assertion-haskell/tree/develop) | [![Build Status](https://travis-ci.org/nwtgck/assertion-haskell.svg?branch=master)](https://travis-ci.org/nwtgck/assertion-haskell) |

Assertion with condition string representation in Haskell

## Usage

```hs
{-# LANGUAGE QuasiQuotes #-}

import Assertion

main :: IO ()
main = do
  let a = "hello"
  let b = 10
  [assertM|a == "hello" && b > 9999999|]
  
  putStrLn "End!"
```

```
ExampleMain.hs: Assertion failed: 'a == "hello" && b > 9999999'
```