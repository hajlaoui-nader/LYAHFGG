module Prettify where
import Prelude hiding ((<>)) 

data Doc = Empty
    | Char Char
    | Text String
    | Line
    | Concat Doc Doc
    | Union Doc Doc
    deriving (Eq, Show)


(<>) :: Doc -> Doc -> Doc 
Empty <> y = y
x <> Empty = x
x <> y = x `Concat` y

empty :: Doc
empty = Empty

char :: Char -> Doc
char c = Char c

text :: String -> Doc
text s = Text s

double :: Double -> Doc
double d = text (show d)

line :: Doc
line = Line

hcat :: [Doc] -> Doc
hcat = fold (<>)

fold :: (Doc -> Doc -> Doc) -> [Doc] -> Doc
fold f = foldr f empty

fsep :: [Doc] -> Doc
fsep = fold (</>)

(</>) :: Doc -> Doc -> Doc
x </> y = x <> softline <> y

softline :: Doc
softline = group line

group :: Doc -> Doc
group x = flatten x `Union` x

flatten :: Doc -> Doc
flatten (x `Concat` y) = flatten x `Concat` flatten y
flatten Line = Char ' '
flatten (x `Union` _) = flatten x
flatten other = other


punctuate :: Doc -> [Doc] -> [Doc]
punctuate p [] = []
punctuate p [d] = [d]
punctuate p (d:ds) = (d <> p) : punctuate p ds

compact :: Doc -> String
compact x = transform [x]
        where transform [] = ""
              transform (d:ds) = case d of
                    Empty -> transform ds
                    Char c -> c : transform ds
                    Text s -> s ++ transform ds
                    Line -> '\n' : transform ds
                    a `Concat` b -> transform (a:b:ds)
                    _ `Union` b -> transform (b:ds)


pretty :: Int -> Doc -> String
pretty w x = best 0 [x]
  where best c (d:ds) = case d of
                         Empty        -> best c ds
                         Char ch      -> ch : best (c + 1) ds
                         Text s       -> s ++ best (c + length s) ds
                         Line         -> '\n' : best 0 ds
                         a `Concat` b -> best c (a:b:ds)
                         a `Union` b  -> nicest c (best c (a:ds)) (best c (b:ds))
        best _ _      = ""
        nicest c a b | (w - least) `fits` a = a
                     | otherwise            = b
          where least = min w c

fits :: Int -> String -> Bool
w `fits` _ | w < 0 = False
w `fits` ""        = True
w `fits` ('\n':_)  = True
w `fits` (c:cs)    = (w - 1) `fits` cs
