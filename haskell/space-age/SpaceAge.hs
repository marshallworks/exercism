module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune
    deriving (Show)

ageOn :: Planet -> Float -> Float
ageOn planet secs =
    case planet of
        Mercury -> secs/secsInYearMercury
        Venus   -> secs/secsInYearVenus
        Earth   -> secs/secsInYearEarth
        Mars    -> secs/secsInYearMars
        Jupiter -> secs/secsInYearJupiter
        Saturn  -> secs/secsInYearSaturn
        Uranus  -> secs/secsInYearUranus
        Neptune -> secs/secsInYearNeptune
        where
            secsInYearEarth = 31557600
            secsInYearMercury = secsInYearEarth * 0.2408467
            secsInYearVenus = secsInYearEarth * 0.61519726
            secsInYearMars = secsInYearEarth * 1.8808158
            secsInYearJupiter = secsInYearEarth * 11.862615
            secsInYearSaturn = secsInYearEarth * 29.447498
            secsInYearUranus = secsInYearEarth * 84.016846
            secsInYearNeptune = secsInYearEarth * 164.79132