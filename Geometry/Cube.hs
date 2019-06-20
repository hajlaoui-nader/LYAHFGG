module Geometry.Cube(volume, area) where
    import qualified Geometry.Cuboid as Cuboid  

    area :: Float -> Float  
    area radius = 4 * pi * (radius ^ 2)  

    volume :: Float -> Float  
    volume side = Cuboid.volume side side side  