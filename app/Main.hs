module Main where

-- import Lib

main :: IO ()
main = do
  putStrLn "What is you'r age?"
  line <- getLine
  let age = (read line :: Int)
  putStrLn ("Are you really "++(show age)++" years old")

--  putStrLn "What is you'r name?"
--  let theMonad = getLine
--  name <- theMonad
--  putStrLn ("Hi "++name)
