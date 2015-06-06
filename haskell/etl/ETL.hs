module ETL (transform) where

import qualified Data.Map.Strict as DMS

type Letter = String
type Points = Int
type PrevData = DMS.Map Points [Letter]
type NextData = DMS.Map Letter Points

nil :: NextData
nil = DMS.fromList []

transform :: PrevData -> NextData
transform prev = nil
