{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Text (intercalate)
main :: IO ()
main = print $ intercalate " " ["Haskell","and","Nix"]
