module Utils
  ( myGcd
  , isPrime
  , isPrime2
  , Semaphore (Red, Green, Yellow, OutOfOrder)
  ) where

myGcd :: Integer -> Integer -> Integer
myGcd a 0 = a
myGcd a b = myGcd b (mod a b)

isPrime :: Integer -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n =
  let
    sqrtn = floor $ sqrt  $ fromIntegral n

    divisableByRange :: Integer -> Bool
    divisableByRange i =
      if (mod n i == 0) then True
      else if (i > sqrtn) then False
      else (divisableByRange (i + 1))

  in
    not (divisableByRange 2)



isPrime2 :: Integer -> Bool
isPrime2 1 = False
isPrime2 2 = True
isPrime2 n =
  let
    sqrtn = floor $ sqrt $ fromIntegral n
    sd = take 1 $ filter (\i -> mod n i == 0) (2:[3,5..sqrtn])
  in
    sd == []

data Semaphore = Red | Yellow | Green | OutOfOrder deriving (Show)

instance Eq Semaphore where
  Red == Red = True
  (==) Yellow Yellow = True
  Green == Green = True
  _ == _ = False
