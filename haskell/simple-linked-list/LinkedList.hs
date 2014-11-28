module LinkedList where

data Element a = Nil | Item a (Element a) deriving (Show)
type LinkedList a = (Element a, Element a)

nil :: LinkedList a
nil = (Nil, Nil)

isNil :: LinkedList a -> Bool
isNil (Nil, Nil) = True
isNil (_, _)     = False

new :: a -> LinkedList a -> LinkedList a
new value (llhead, lltail) = ((Item value Nil), newTail llhead)
    where
        newTail Nil = Nil
        newTail _   = Item (getValue llhead) lltail

datum :: LinkedList a -> a
datum (llhead, _) = getValue llhead

next :: LinkedList a -> LinkedList a
next (_, Nil)    = (Nil, Nil)
next (_, lltail) = (Item (getValue lltail) Nil, (getTail lltail))

fromList :: [a] -> LinkedList a
fromList = foldr new nil

toList :: LinkedList a -> [a]
toList lli = reverse $ accumList lli []

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList lli = fromList $ accumList lli []

accumList :: LinkedList a -> [a] -> [a]
accumList (Nil, Nil) acc = acc
accumList lli acc = accumList (next lli) (datum lli : acc)

getValue :: Element a -> a
getValue Nil        = error "should not happen"
getValue (Item a _) = a

getTail :: Element a -> Element a
getTail Nil              = Nil
getTail (Item _ theTail) = theTail