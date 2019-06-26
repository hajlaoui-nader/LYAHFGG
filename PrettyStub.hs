import SimpleJson

data Doc = ToBeDefined
    deriving (Show)

string :: String -> Doc
string str = enclose '"' '"' . hcat . map oneChar

text :: String -> Doc
text str = undefined

double :: Double -> Doc
double num = undefined


(<>) :: Doc -> Doc -> Doc
a <> b = undefined

char :: Char -> Char
char a = undefined

hcat :: [Doc] -> Doc
hcat xs = undefined

enclose :: Char -> Char -> Doc -> Doc
enclose left right x = char left <> x <> char right


