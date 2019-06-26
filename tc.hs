data TisAnInteger = TisAn Integer deriving (Show)

instance Eq TisAnInteger where
    (==) (TisAn v1) (TisAn v2) = v1 == v2 


data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
    (==) (Two v1 v2) (Two v3 v4) = (v1 == v3) && (v2 == v4)



data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt v1) (TisAnInt v2) = v1 == v2
    (==) (TisAString a) (TisAString b) = a == b
    (==) _ _ = False



data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
    (==) (Pair x y) (Pair z w) = (x == z) && (y == w)


data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple x y) (Tuple z w) = (x == z) && (y == w) 

data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
    (==) (ThisOne x) (ThisOne y) = x == y
    (==) (ThatOne x) (ThatOne y) = x == y
    (==) _ _ = False

data EitherOr a b = Hello a | GoodBye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where 
    (==) (Hello x) (Hello y) = x == y
    (==) (GoodBye x) (GoodBye y) = x == y
    (==) _ _ = False


