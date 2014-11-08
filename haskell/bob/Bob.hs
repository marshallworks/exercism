module Bob (responseFor) where

import Data.Char (isSpace, isUpper, isLower)

responseFor :: String -> String
responseFor req
    | isSilence  req = "Fine. Be that way!"
    | isYelling  req = "Whoa, chill out!"
    | isQuestion req = "Sure."
    | otherwise  = "Whatever."

isSilence :: String -> Bool
isSilence = all isSpace

isQuestion :: String -> Bool
isQuestion s = last s == '?'

isYelling :: String -> Bool
isYelling s = not (any isLower s) && any isUpper s