import Data.List

doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
then x
else doubleMe x

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]   

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int 
addThree x y z = x + y + z

--factorial :: Integer -> Integer
--factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

lucky :: (Integral a) => a -> String  
lucky 7 = "LUCKY NUMBER SEVEN!"  
lucky x = "Sorry, you're out of luck, pal!"   

sayMe :: (Integral a) => a -> String  
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5" 

factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1) 

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          skinny = 18.5  
          normal = 25.0  
          fat = 30.0  

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
    let smaller = quicksort [a | a <- xs, a <= x]
        bigger = quicksort [a | a <- xs, a > x]
    in smaller ++ [x] ++ bigger


compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred = compare 100 

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])  

applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)  

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ _ [] = []
zipWith' _ [] _ = []
zipWith' f (z:zs)(y:ys) = f z y : zipWith' f zs ys

flip' :: (a -> b -> c) -> (b -> a -> c)  
flip' f = g
    where g x y = f y x

--map' :: (a -> b) -> [a] -> [b]
--map' _ [] = []
--map' f (x:xs) = f x : map f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs) = if p x then
    x : filter' p xs 
    else 
        filter' p xs 
map' :: (a -> b) -> [a] -> [b]  
map' f xs = foldr (\x acc -> f x : acc) [] xs

numUniques :: (Eq a) => [a] -> Int  
numUniques = length . nub  


findKey :: (Eq k) => k -> [(k,v)] -> Maybe v  
findKey key [] = Nothing  
findKey key ((k,v):xs) = if key == k  
                            then Just v  
                            else findKey key xs  

phoneBook = [("betty","555-2938"),("bonnie","452-2928"),("patsy","493-2928"),("lucille","205-2928"),("wendy","939-8282"),("penny","853-2492")]

