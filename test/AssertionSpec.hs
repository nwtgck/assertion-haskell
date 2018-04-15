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
    it "should be nothing" $ do
      myAssert True 'a' `shouldBe` 'a'
    
    it "should be failed" $ do
      evaluate (myAssert False 'a') `shouldThrow` errorCall "assertion failed"