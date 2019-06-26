module Cipher where

import Data.Char


myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = if x then True else myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = if (f x) then True else myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem e (x:xs) = x == e || myElem e xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain x = squishMap id x

stops = "pbtdkg"
vowels = "aeiou"

combinaison :: [String] -> [String] -> [(String, String, String)]
combinaison sts vws = [(s1,v,s2) | s1 <- sts,
                                   s2 <- sts,
                                   v <- vws]


data Price = Price Integer deriving (Eq, Show)


                                                                   



