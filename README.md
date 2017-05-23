# Server Geometry
CGRect, CGPoint and CGSize are missing from Server Side Swift implementations, because UIKit is not available on linux. The classes in this repo provide an alternative to use if you need basic geometry in your project.
I have tried to use similar methods as the original structs.

Because I already created the repo as ___ServerGraphics___, that name stuck.

### _Caveat:_
Currently implementing the unit tests. TDD be damned!

## Rectangle
A structure that contains the location and dimensions of a rectangle.
 
In the default coordinate space, the origin is located in the lower-left corner of the rectangle and the rectangle extends towards the upper-right corner. But as this is generalised geometry, it does not really matter.

Rectangle contains methods to determine if it _contains_ a Point, i.e. the Point's coordinates exists within the rectangle.
It is also possible to _extend_ a rectangle to include a Point.

## Point
A structure that can contain a point in space.

## Size
Mostly used to deal with sizes of objects, like Rectangles.
