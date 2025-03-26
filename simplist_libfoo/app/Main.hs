{-# LANGUAGE ForeignFunctionInterface #-}

module Main where

import Foreign.C.String

foreign import ccall "hello" c_hello :: IO ()

main :: IO ()
main = do
  putStrLn "Hello Haskell"
  c_hello
