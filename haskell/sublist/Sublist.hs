module Sublist (Sublist(..), sublist) where

import Data.List (isInfixOf)

data Sublist = Equal | Sublist | Superlist | Unequal
               deriving (Show, Eq)

sublist :: (Eq a) => [a] -> [a] -> Sublist
sublist x y
    | x == y           = Equal
    | x `isInfixOf` y  = Sublist
    | y `isInfixOf` x  = Superlist
    | otherwise        = Unequal