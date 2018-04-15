{-# LANGUAGE TemplateHaskell #-}

module Assertion where

import qualified Language.Haskell.TH as TH
import qualified Language.Haskell.TH.Quote as TH.Quote
import qualified Language.Haskell.Meta as Haskell.Meta

-- | assert
myAssert :: Bool -> a -> a
myAssert False _ = error "assertion failed"
myAssert _     x = x

-- | Assert
assert :: TH.Quote.QuasiQuoter
assert = TH.Quote.QuasiQuoter
         { TH.Quote.quoteExp = \condStr -> do
             let Right condExp = Haskell.Meta.parseExp condStr
             [|if $(return condExp)
                 then ()
                 else error ("Assertion failed: '" ++ condStr ++ "'")|]
         , TH.Quote.quotePat  = undefined
         , TH.Quote.quoteType = undefined
         , TH.Quote.quoteDec  = undefined
         }
