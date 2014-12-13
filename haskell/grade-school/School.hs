module School where

import Data.List (sort)
import qualified Data.IntMap as DIM

type School = DIM.IntMap [String]

empty :: School
empty = DIM.fromList []

add :: Int -> String -> School -> School
add gNum sName = DIM.insertWith (++) gNum [sName]

sorted :: School -> [(Int, [String])]
sorted school = sort $ map sortedNamez (DIM.toList school)
    where sortedNamez (gNum, sNames) = (gNum, sort sNames)

grade :: Int -> School -> [String]
grade = DIM.findWithDefault []
