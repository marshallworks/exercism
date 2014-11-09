module DNA (count, nucleotideCounts) where

import Data.Map (Map, fromList)

count :: Char -> String -> Int
count nucleotide strand =
    case nucleotide of
        'A' -> instances
        'T' -> instances
        'C' -> instances
        'G' -> instances
        _   -> error $ "invalid nucleotide " ++ show nucleotide
        where
            instances = length $ filter (== nucleotide) strand

nucleotideCounts :: String -> Map Char Int
nucleotideCounts strand = fromList [adenineCount, thymineCount, cytosineCount, guanineCount]
    where
        adenineCount  = ('A', count 'A' strand)
        thymineCount  = ('T', count 'T' strand)
        cytosineCount = ('C', count 'C' strand)
        guanineCount  = ('G', count 'G' strand)