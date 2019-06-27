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

## Sum types
example : ```data Bool = False | True```

## Product types
A product type’s cardinality is the product of the cardinalities of its inhabitants.
Arithmetically, products are the result of multiplication. Where
a sum type was expressing `or`, a product type expresses `and`.

## Normal form
Normal form is product types distributed over sum types

## As pattern

```
f :: Show a => (a, b) -> IO (a, b)
f t@(a, _) = do
    print a
    return t
```