module DNA (count, nucleotideCounts) where

import qualified Data.Map.Strict as Map

count :: Char -> String -> Int
count nucleotide strand =
    case getCount of
        -1 -> error $ "invalid nucleotide " ++ show nucleotide
        otherwise -> getCount
    where
        getCount = fromCount $ Map.lookup nucleotide $ nucleotideCounts strand

nucleotideCounts :: String -> Map.Map Char Int
nucleotideCounts = foldr collectNucleotides initial
    where
        initial = Map.fromList [('A', 0),('T', 0),('C', 0),('G', 0)]

collectNucleotides :: Char -> Map.Map Char Int -> Map.Map Char Int
collectNucleotides nucleotide counts =
    case nucleotide of
        'A' -> Map.update addNucleotide nucleotide counts
        'T' -> Map.update addNucleotide nucleotide counts
        'C' -> Map.update addNucleotide nucleotide counts
        'G' -> Map.update addNucleotide nucleotide counts
        _   -> error $ "invalid nucleotide " ++ show nucleotide
    where
        addNucleotide counter = Just (counter + 1)

fromCount :: Maybe Int -> Int
fromCount Nothing = -1
fromCount (Just x) = x