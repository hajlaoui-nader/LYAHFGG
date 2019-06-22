--module Solver(solveRPN) where
    
import Data.List
solveRPN :: (Read a,Num a) => String -> a
solveRPN = head . foldl foldingFunction [] . words  
    where foldingFunction (x:y:ys) "*" = (x * y):ys
          foldingFunction (x:y:ys) "-" = (y - x):ys
          foldingFunction (x:y:ys) "+" = (x + y):ys
          foldingFunction xs numberString = read numberString:xs

data Node = Node Road (Maybe Road)  
data Road = Road Int Node

data Section = Section { getA :: Int, getB :: Int, getC :: Int } deriving (Show)  
type RoadSystem = [Section]
data Label = A | B | C deriving (Show)
type Path = [(Label, Int)]

heathrowToLondon :: RoadSystem  
heathrowToLondon = [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]

optimalPath :: RoadSystem -> Path
optimalPath roadSystem = 
    let (bestAPath, bestBPath) = foldl roadStep ([],[]) roadSystem  
    in  if sum (map snd bestAPath) <= sum (map snd bestBPath)  
            then reverse bestAPath  
            else reverse bestBPath  

roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) = 
    let priceA = sum $ map snd pathA
        priceB = sum $ map snd pathB
        forwardPriceToA = priceA + a
        forwardPriceToB = priceB + b
        crossPriceToA = priceB + b + c
        crossPriceToB = priceA + a + c
        newPathA = if forwardPriceToA <= crossPriceToA
            then (A,a):pathA
            else (C,c):(B,b):pathB
        newPathB = if forwardPriceToB <= crossPriceToB
            then (B,b):pathB
            else (C,c):(A,a):pathA
        in (newPathA, newPathB)


groupsOf :: Int -> [a] -> [[a]]  
groupsOf 0 _ = undefined  
groupsOf _ [] = []  
groupsOf n xs = take n xs : groupsOf n (drop n xs)

main = do 
    contents <- getContents
    let three = groupsOf 3 (map read $ lines contents)
        roadSystem = map (\[a,b,c] -> Section a b c) three
        path = optimalPath roadSystem
        pathString = concat $ map (show . fst) path  
        pathPrice = sum $ map snd path  
    putStrLn $ "The best path to take is: " ++ pathString  
    putStrLn $ "The price is: " ++ show pathPrice  
