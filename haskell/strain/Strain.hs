module Strain (keep, discard) where

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep f xs = [ x | x <- xs, f x ]

discard :: (a -> Bool) -> [a] -> [a]
discard _ [] = []
discard f xs = [ x | x <- xs, not $ f x ]