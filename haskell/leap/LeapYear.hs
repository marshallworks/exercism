module LeapYear (isLeapYear) where

isLeapYear :: (Integral a) => a -> Bool
isLeapYear year =
	mod year 4 == 0 &&
	mod year 100 /= 0 ||
	mod year 400 == 0
