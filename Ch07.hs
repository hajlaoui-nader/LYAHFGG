import Data.Char

removeNonUpperCase :: String -> String
removeNonUpperCase [] = []
removeNonUpperCase (x:xs) = if (isUpper x) then x: (removeNonUpperCase xs) else  (removeNonUpperCase xs)

upperFirst :: String -> String
upperFirst [] = []
upperFirst (x:xs) = toUpper x :  xs


head1 :: String -> Maybe Char
head1 [] = Nothing
head1 x = Just $ (head . upperFirst) x