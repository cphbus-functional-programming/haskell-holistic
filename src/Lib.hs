module Lib
    ( fileExample
    , readWriteExample
    ) where

import System.IO

fileExample :: IO ()
fileExample = do
  withFile "numbers.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let numberLines = lines contents
    putStrLn (contents++(numberLines!!2))
    )


readWriteExample :: IO ()
readWriteExample = do
  putStrLn "What is you'r age?"
  line <- getLine
  let age = (read line :: Int)
  putStrLn ("Are you really "++(show age)++" years old")
