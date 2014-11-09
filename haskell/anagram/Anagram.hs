module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor word = filter isAnagram
    where
        lowerCaseStr = map toLower
        loweredWord = lowerCaseStr word
        sortedWord = sort loweredWord
        isAnagram match = (loweredWord /= lowerCaseStr match) && (sortedWord == sort (lowerCaseStr match))