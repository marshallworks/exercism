module WordCount (wordCount) where

import qualified Data.Map.Strict as M (Map, fromList, insertWith)
import Data.Char (toLower)
import Data.List (foldl')
import Data.List.Split (wordsBy)

type Count = Int
type Word = String
type CountedWords = M.Map Word Count

wordCount :: String -> CountedWords
wordCount str = gatherWordCount (M.fromList []) (wordList str)
    where
        wordList = wordsBy (`elem` " _-.,:!?@#$%^&*()[]{}") . map toLower
        gatherWordCount = foldl' (\ counts x -> M.insertWith (+) x 1 counts)