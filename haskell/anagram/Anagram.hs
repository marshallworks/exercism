module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor word possibilities = filter (isAnagram loweredWord sortedWord) possibilities
    where
    	loweredWord = lowerCaseWord word
    	sortedWord = sortWordChars loweredWord

isAnagram :: String -> String -> String -> Bool
isAnagram loweredWord sortedWord match = notSameWord && anagram
    where
        loweredMatch = lowerCaseWord match
        sortedMatch = sortWordChars loweredMatch
        notSameWord = loweredWord /= loweredMatch
        anagram = sortedWord == sortedMatch

lowerCaseWord :: String -> String
lowerCaseWord = map toLower

sortWordChars :: String -> String
sortWordChars = sort