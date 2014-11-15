module DNA (count, nucleotideCounts) where

import qualified Data.Map.Strict as DMS (Map, findWithDefault, fromList, adjust)
import Data.List (foldl', elem)

count :: Char -> String -> Int
count nucleotide strand = DMS.findWithDefault 0 (validNucleotide nucleotide) $ nucleotideCounts strand

nucleotideCounts :: String -> DMS.Map Char Int
nucleotideCounts = foldl' collectNucleotides initial
    where initial = DMS.fromList [('A', 0),('T', 0),('C', 0),('G', 0)]

collectNucleotides :: DMS.Map Char Int -> Char -> DMS.Map Char Int
collectNucleotides counts nucleotide = DMS.adjust (+1) (validNucleotide nucleotide) counts

validNucleotide :: Char -> Char
validNucleotide nucleotide
    | nucleotide `elem` "ATCG" = nucleotide
    | otherwise = error $ "invalid nucleotide " ++ show nucleotide