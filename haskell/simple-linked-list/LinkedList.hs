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
    where
        gatherList acc Nil = acc
        gatherList acc oldLL = gatherList (datum oldLL : acc) (next oldLL)

reverseLinkedList :: Element a -> Element a
reverseLinkedList Nil = Nil
reverseLinkedList ele = gatherReversal (datum ele) (next ele) nil
    where
        gatherReversal val Nil newLL   = new val newLL
        gatherReversal val oldLL newLL = gatherReversal (datum oldLL) (next oldLL) (new val newLL)
