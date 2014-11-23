module School where

import Data.List (sort)
import qualified Data.Map as DMS (Map, toList, fromList, insertWith, findWithDefault)

type School = DMS.Map Int [String]

empty :: School
empty = DMS.fromList []

add :: Int -> String -> School -> School
add gNum sName = DMS.insertWith (++) gNum [sName]

sorted :: School -> [(Int, [String])]
sorted school = sort $ map sortedNamez (DMS.toList school)
    where sortedNamez (gNum, sNames) = (gNum, sort sNames)

grade :: Int -> School -> [String]
grade = DMS.findWithDefault []