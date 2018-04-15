{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

module AssertionSpec where

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck

import Control.Exception (evaluate)

import Assertion

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "assert" $ do
    it "should pass" $ do
      let a = "hello"
      let b = 10
      let actual = [assert|a == "hello" && b > 3|]
      actual `shouldBe` ()

    it "should be failed" $ do
      let a = "hello"
      let b = 10
      let actual = [assert|a == "hello, world" && b > 99999|]
      evaluate actual `shouldThrow` errorCall "Assertion failed: 'a == \"hello, world\" && b > 99999'"

  describe "staticAssert" $ do
    it "should pass" $ do
      let actual = $(staticAssert (length "hello" == 5 && 10 > 3))
      actual `shouldBe` ()
    
    it "should be compile error" $ do
      -- NOTE: Compile error (GOOD!)
      -- let actual = $(staticAssert (length "hello" > 99999))
      1 `shouldBe` 1
