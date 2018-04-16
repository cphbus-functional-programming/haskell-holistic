module Exercises
  ( YesNo (..)
  , tellit
  ) where

class YesNo a where
  true :: a -> Bool
  false :: a -> Bool
  true x = not (false x)
  false x = not (true x)

instance YesNo Int where
  true 0 = False
  true _ = True

instance YesNo Bool where
  true True = True
  true False = False

instance YesNo [a] where
  true [] = False
  true _ = True

instance YesNo (Maybe a) where
  true Nothing = False
  true _ = True

tellit :: (YesNo a, Show a) => a -> String
tellit x = if (true x) then ("Yeah! " ++ show x) else "Oops!"
