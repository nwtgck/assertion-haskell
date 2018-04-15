{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}

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
  describe "myAssert" $ do
    it "should pass" $ do
      myAssert True 'a' `shouldBe` 'a'
    
    it "should be failed" $ do
      evaluate (myAssert False 'a') `shouldThrow` errorCall "assertion failed"

  describe "assertM" $ do
    it "should pass" $ do
      let a = "hello"
      let b = 10
      actual <- [assertM|a == "hello" && b > 3|]
      actual `shouldBe` ()

    it "should be failed" $ do
      let a = "hello"
      let b = 10
      let actual = [assertM|a == "hello, world" && b > 99999|] :: IO ()
      evaluate actual `shouldThrow` errorCall "Assertion failed: 'a == \"hello, world\" && b > 99999'"