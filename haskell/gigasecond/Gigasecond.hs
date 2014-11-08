module Gigasecond (fromDay) where

import Data.Time
import Data.Time.Clock.POSIX (utcTimeToPOSIXSeconds, posixSecondsToUTCTime)

fromDay' :: Day -> Day
fromDay' day = utctDay $ posixSecondsToUTCTime $ utcTimeToPOSIXSeconds (UTCTime day 0) + 1000000000

-- 1,000,000,000 seconds / 60 =
-- 16,666,666.666... minutes / 60 =
-- 277,777.777... hours / 24 = 11574.074... days
-- Rounded down to find the day of the Gigasecond
--fromDay' :: Day -> Day
--fromDay' = addDays 11574

fromDay :: Day -> Day
fromDay d = addDays (round $ (1E09/60/60/24 :: Float)) d