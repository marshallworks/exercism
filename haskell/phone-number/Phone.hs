module Phone (areaCode, number, prettyPrint) where

import Data.Char (isDigit)

number :: String -> String
number str =
    case length justDigits of
        10 -> justDigits
        11  | head justDigits == '1' -> tail justDigits
        _  -> invalidNumber
    where
        justDigits = filter isDigit str
        invalidNumber = "0000000000"

areaCode :: String -> String
areaCode str = take 3 $ number str

prettyPrint :: String -> String
prettyPrint str = "("++ac++") "++three++"-"++four
    where
        num = number str
        (ac, rest) = splitAt 3 num
        (three, four) = splitAt 3 rest