module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where

import Data.List (foldl')

sumOfMultiplesDefault :: Int -> Int
sumOfMultiplesDefault = sumOfMultiples [3,5]

sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples dividers number = foldl' (+) 0 $ filter (hasDivisibleInList dividers) [1..number-1]

hasDivisibleInList :: [Int] -> Int -> Bool
hasDivisibleInList dividers number = any (isDivisibleBy number) dividers

isDivisibleBy :: Int -> Int -> Bool
isDivisibleBy number divider = number `mod` divider == 0