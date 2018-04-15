module Main where

import Lib
import Utils

main :: IO ()
main = do
  putStrLn "Two numbers please"
  l1 <- getLine
  l2 <- getLine
  let n1 = (read l1 :: Integer)
  let n2 = (read l2 :: Integer)
  putStrLn (
    "Greates common divisor of "
    ++(show n1)++" and "
    ++(show n2)++" is "
    ++(show (myGcd n1 n2))
    )

--  putStrLn "What is you'r name?"
--  let theMonad = getLine
--  name <- theMonad
--  putStrLn ("Hi "++name)
