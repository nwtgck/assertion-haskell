# assertion

| branch | status|
| --- | --- |
| [`master`](https://github.com/nwtgck/assertion-haskell/tree/master) | [![Build Status](https://travis-ci.org/nwtgck/assertion-haskell.svg?branch=master)](https://travis-ci.org/nwtgck/assertion-haskell) |
| [`develop`](https://github.com/nwtgck/assertion-haskell/tree/develop) | [![Build Status](https://travis-ci.org/nwtgck/assertion-haskell.svg?branch=develop)](https://travis-ci.org/nwtgck/assertion-haskell) |

Assertion with condition string representation in Haskell

## Install

Add this library to your `stack.yaml` like the following if you use [Stack](https://docs.haskellstack.org/en/stable/README/).

```yaml
...
extra-deps:
- git: https://github.com/nwtgck/assertion-haskell.git
  commit: 4340a96555606d590d54669b9ae992a5b8c9a10d
...
```

Then, add `assertion` to your `package.yaml`.

```yaml
...
library:
 dependencies:
 - assertion
...
```


## Usages

### `assert`

```hs
{-# LANGUAGE QuasiQuotes #-}

import Assertion

main :: IO ()
main = do
  let a = "hello"
  let b = 10
  let !x = [assert|a == "hello" && b > 9999999|]
  
  putStrLn "End!"
```

```
ExampleMain.hs: Assertion failed: 'a == "hello" && b > 9999999'
```

### `staticAssert`

Assert in compile time. So code bellow should be compile error.

```hs
{-# LANGUAGE TemplateHaskell #-}

import Assertion

-- NOTE: Compile error (Good!)
main :: IO ()
main = do
  -- NOTE: Compile error (Good!)
  let _ = $(staticAssert (length "hello" == 99999))  
  
  putStrLn "End!"
```

Compile error will happen. Good!

```
examples/StaticAssertExample.hs:9:13: error:
    • Compile time assertion failed
    • In the untyped splice: $(staticAssert (length "hello" == 99999))
  |
9 |   let _ = $(staticAssert (length "hello" == 99999))
  | 
```
