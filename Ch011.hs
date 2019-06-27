import Data.List (intercalate)

-- data Fiction = Fiction deriving (Show)

-- data NonFiction = NonFiction deriving (Show)

-- data BookType = FictionBook Fiction
--                 | NonFictionBook NonFiction
--                 deriving Show

type AuthorName = String
data Author = Fiction AuthorName 
            | NonFiction AuthorName 
            deriving (Eq, Show)




data Expr = Number Int
            | Add Expr Expr
            | Minus Expr Expr
            | Mult Expr Expr
            | Divide Expr Expr            

data FlowerType = Gardenia 
                | Daisy
                | Rose
                | Lilac 
                deriving (Show)

type Gardener = String

data Garden = Garden Gardener FlowerType deriving (Show)

f :: Show a => (a, b) -> IO (a, b)
f t@(a, _) = do
    print a
    return t


notThe :: String -> Maybe String
notThe [] = Just []
notThe "the" = Nothing
notThe x = Just x

replaceThe :: String -> String
replaceThe str = ((intercalate " ") . map aThe . map notThe) $ words str
        where aThe :: Maybe String -> String
              aThe (Just x) = x
              aThe _ = "a"


isThe :: String -> Bool
isThe str = str == "the"

beginsWithVowel :: String -> Bool
beginsWithVowel "" = False
beginsWithVowel (s:str) = elem s "aeiou"
              
firstHasVowel :: [String] -> Bool
firstHasVowel [] = False
firstHasVowel (x:_) = beginsWithVowel x              

theBfore :: [String] -> Integer
theBfore (x:xs) 
    | isThe x && firstHasVowel xs = 1
    | otherwise = 0

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel [] = 0
countTheBeforeVowel str = addCount $ theBfore zs
                        where zs = words str 
                              addCount n = n + countTheBeforeVowel (unwords $ drop 1 zs) 

isVowel :: Char -> Bool
isVowel s = elem s "aeiou"

countVowels :: String -> Integer
countVowels = foldr (\x acc -> if isVowel x then acc + 1 else acc) 0 

newtype Word' = Word' String deriving (Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord [] = Just $ Word' ""
mkWord str = if (vow > (l - vow)) then Nothing else Just $ Word' str
    where vow = fromIntegral(countVowels str)
          l = length str

data Nat = Zero
           | Succ Nat
          deriving (Eq, Show)          

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ x) = 1 + natToInteger x

integerToNat :: Integer -> Maybe Nat
integerToNat n
            | n == 0 = Just Zero
            | (n - 1) < 0 = Nothing
            | otherwise = Just (succ n)
            where succ 0 = Zero 
                  succ x = Succ (succ (x-1)) 
                  