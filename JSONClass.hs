type JsonError = String

class JSON a where
    toValue :: a -> JValue
    fromValue :: JValue -> Either JsonError a

instance JSON JValue where
    toJValue = id
    fromJValue = Right