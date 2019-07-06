module DNA (toRNA) where

rnaComplement :: Char -> Char
rnaComplement d =
    case d of
        'G' -> 'C'
        'C' -> 'G'
        'T' -> 'A'
        'A' -> 'U'
        _   -> error $ "Invalid nucleotide: " ++ show d

toRNA :: String -> String
toRNA = map rnaComplement