module LinkedList where

data Element a = Nil | Element {
    datum :: a,
    next :: Element a
} deriving (Show)

nil :: Element a
nil = Nil

isNil :: Element a -> Bool
isNil Nil = True
isNil _   = False

new :: a -> Element a -> Element a
new = Element

fromList :: [a] -> Element a
fromList = foldr new nil

toList :: Element a -> [a]
toList ele = reverse $ gatherList [] ele

reverseLinkedList :: Element a -> Element a
reverseLinkedList ele = fromList $ gatherList [] ele

gatherList :: [a] -> Element a -> [a]
gatherList acc Nil = acc
gatherList acc ele = gatherList (datum ele : acc) (next ele)