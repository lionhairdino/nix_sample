{-# LANGUAGE ForeignFunctionInterface #-}
module Main where

import Foreign.C.String

foreign import ccall "zlibVersion" zlibVersion :: IO CString

main :: IO ()
main = do
  ver <- zlibVersion
  verStr <- peekCString ver
  putStrLn ("zlib version: " ++ verStr)
