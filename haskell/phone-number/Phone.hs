module Phone (areaCode, number, prettyPrint) where

import Data.Char (isDigit)

number :: String -> String
number str
    | tenDigits                = justDigits
    | elevenDigits && oneFirst = drop 1 justDigits
    | otherwise                = invalidNumber
    where
        justDigits = filter isDigit str
        tenDigits = length justDigits == 10
        elevenDigits = length justDigits == 11
        oneFirst = take 1 justDigits == "1"
        invalidNumber = "0000000000"

areaCode :: String -> String
areaCode str = take 3 $ number str

prettyPrint :: String -> String
prettyPrint str = "("++ac++") "++three++"-"++four
    where
        num = number str
        ac = take 3 num
        three = take 3 $ drop 3 num
        four = take 4 $ drop 6 num