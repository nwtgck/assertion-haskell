{-# LANGUAGE TemplateHaskell #-}

module Assertion where

import qualified Language.Haskell.TH as TH
import qualified Language.Haskell.TH.Quote as TH.Quote
import qualified Language.Haskell.Meta as Haskell.Meta
import qualified Control.Monad as Monad

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

-- | Static assert
-- (from: https://stackoverflow.com/a/6654903/2885946)
staticAssert :: Bool -> TH.ExpQ
staticAssert cond = do
  Monad.unless cond $ TH.reportError "Compile time assertion failed"
  [|()|]