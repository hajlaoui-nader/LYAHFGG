The `GeneralizedNewtypeDeriving` pragma tells the compiler to allow our `newtype` to rely on the typeclass instance for the type it contains.

## Record syntax
Records are product types with additional syntax to make it easier to access fields within the type.
```
data Person =
  Person { name :: String
  , age :: Int }
  deriving (Eq, Show)

-- we can now access named fields:
Prelude> :t name
name :: Person -> String

Prelude> let papu = Person "papu" 5
Prelude> name papu
"papu"
```

