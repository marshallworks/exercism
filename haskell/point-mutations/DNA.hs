module DNA (hammingDistance) where

import Data.List (foldl')

hammingDistance :: String -> String -> Int
hammingDistance xs ys = foldl' (+) 0 $ zipWith matchNucleotide xs ys

matchNucleotide :: Char -> Char -> Int
matchNucleotide a b
    | a /= b    = 1
    | otherwise = 0