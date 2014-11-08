module Grains (square, total) where

square :: Integer -> Integer
square n = 2 ^ (n - 1)

total = 2 ^ 64 - 1
