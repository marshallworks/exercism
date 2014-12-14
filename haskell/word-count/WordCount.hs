module WordCount (wordCount) where

import qualified Data.Map.Strict as DMS (Map, fromList, insertWith)
import Data.Char (isAlphaNum, toLower)

type Count = Int
type Word = String
type CountedWords = DMS.Map Word Count

wordCount :: String -> CountedWords
wordCount str = gatherWordCount (DMS.fromList []) (wordList str)
    where gatherWordCount = foldl (\ counts x -> DMS.insertWith (+) x 1 counts)

wordList :: String -> [Word]
wordList = gatherWordList [] ""
    where
        gatherWordList list "" [] = list
        gatherWordList list word [] = word : list
        gatherWordList list word (x:xs)
            | isAlphaNum x    = gatherWordList list (word ++ [toLower x]) xs
            | not (null word) = gatherWordList (word : list) "" xs
            | otherwise       = gatherWordList list "" xs
