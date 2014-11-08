module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor word possibilities = filter (isAnagram word) possibilities

isAnagram :: String -> String -> Bool
isAnagram word match
    | wordToLower word == wordToLower match = False
    | sortedLower word == sortedLower match = True
    | otherwise = False
    where
        wordToLower str = map toLower str
        sortedLower str = sort $ wordToLower str