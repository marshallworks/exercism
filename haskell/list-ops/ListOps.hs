module ListOps
    ( length
    , reverse
    , map
    , filter
    , foldr
    , foldl'
    , (++)
    , concat
    ) where

import Prelude hiding
    ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ start [] = start
foldl' f start (x:xs) = start' `seq` foldl' f start' xs
    where
        start' = f start x

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr func start list = foldElements func start (reverse list)
    where
        foldElements _ acc [] = acc
        foldElements f acc (x:xs) = foldElements f (f x acc) xs

length :: [a] -> Int
length = countElements 0
    where
        countElements acc []   = acc
        countElements acc list = countElements (acc + 1) (tail list)

reverse :: [a] -> [a]
reverse = reverseElements []
    where
        reverseElements acc [] = acc
        reverseElements acc (x:xs) = reverseElements (x : acc) xs

map :: (a -> b) -> [a] -> [b]
map = applyElements []
    where
        applyElements acc _ [] = reverse acc
        applyElements acc f (x:xs) = applyElements ((f x :) acc) f xs

filter :: (a -> Bool) -> [a] -> [a]
filter = filterElements []
    where
        filterElements acc _ [] = reverse acc
        filterElements acc f (x:xs) = if f x then filterElements (x : acc) f xs else filterElements acc f xs

(++) :: [a] -> [a] -> [a]
list ++ ys = combineElements ys (reverse list)
    where
        combineElements acc [] = acc
        combineElements acc (x:xs) = combineElements (x : acc) xs

concat :: [[a]] -> [a]
concat list = combineLists [] (reverse list)
    where
        combineLists acc [] = acc
        combineLists acc (x:xs) = combineLists (x ++ acc) xs
