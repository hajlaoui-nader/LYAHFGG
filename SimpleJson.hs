module SimpleJson(JValue(..),
getArray,
getBool,
getDouble,
getInt,
getObject,
getString,
isNull) where

data JValue = JString String
                | JNumber Double 
                | JBool Bool
                | JNull
                | JObject [(String, JValue)]
                | JArray [JValue]
                deriving (Show, Eq, Ord)

getString :: JValue -> Maybe String
getString (JString s) = Just s
getString _ = Nothing        

getDouble :: JValue -> Maybe Double
getDouble (JNumber s) = Just s
getDouble _ = Nothing        

getInt :: JValue -> Maybe Int
getInt (JNumber s) = Just (truncate s)
getInt _ = Nothing        

getObject :: JValue -> Maybe [(String, JValue)]
getObject (JObject x) = Just x
getObject _ = Nothing

getArray :: JValue -> Maybe [JValue]
getArray (JArray x) = Just x
getArray _ = Nothing

getBool :: JValue -> Maybe Bool
getBool (JBool s) = Just s
getBool _ = Nothing        

isNull :: JValue -> Bool
isNull x = x == JNull

