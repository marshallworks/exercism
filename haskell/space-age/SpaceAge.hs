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
            secsInYearMercury = 31557600 * 0.2408467
            secsInYearVenus = 31557600 * 0.61519726
            secsInYearEarth = 31557600
            secsInYearMars = 31557600 * 1.8808158
            secsInYearJupiter = 31557600 * 11.862615
            secsInYearSaturn = 31557600 * 29.447498
            secsInYearUranus = 31557600 * 84.016846
            secsInYearNeptune = 31557600 * 164.79132