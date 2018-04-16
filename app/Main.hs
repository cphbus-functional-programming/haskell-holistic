module Main where

import Lib
import Utils

-- import qualified Data.Map as Map

class YesNo a where
  true :: a -> Bool
  false :: a -> Bool
  true x = not (false x)
  false x = not (true x)

instance YesNo Int where
  true 0 = False
  true _ = True

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
