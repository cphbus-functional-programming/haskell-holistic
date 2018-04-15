module Utils
  ( myGcd
  , isPrime
  , isPrime2
  , noFactor
  , primes
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

noFactor :: [Integer] -> Integer -> Bool
noFactor ps n =
  let
    r = ceiling $ sqrt $ fromIntegral n
  in
    take 1 (filter (\i -> mod n i == 0) (takeWhile (\i -> i <= r) ps)) == []



{--}
primes :: [Integer]
primes = foo [2, 3] [5, 7..]
{--}

foo :: [Integer] -> [Integer] -> [Integer]
foo ps (n:ns) =
  if noFactor ps n
    then foo (ps++[n]) ns
    else foo ps ns
