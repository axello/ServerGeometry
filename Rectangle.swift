//
//  Rectangle.swift
//  ServerGraphics
//
//  Created by Axel Roest on 23/05/17.
//
//

/**
 A structure that contains the location and dimensions of a rectangle.
 
 Overview
 In the default Core Graphics coordinate space, the origin is located in the lower-left corner of the rectangle and the rectangle extends towards the upper-right corner. If the context has a flipped-coordinate space—often the case on iOS—the origin is in the upper-left corner and the rectangle extends towards the lower-right corner.
 Symbols
*/

import Foundation

struct Rectangle {
    /// Basic Geometric Properties
    /// A point that specifies the coordinates of the rectangle’s origin.
    var origin = Point()
    
    /// A size that specifies the height and width of the rectangle.
    var size = Size()

    /// Calculated Geometric Properties
    /// Returns the height of a rectangle.
    var height: Double {
        get {
            return size.height
        }
    }
    /// Returns the width of a rectangle.
    var width: Double {
        get {
            return size.width
        }
    }

    /// Creating Rectangle Values
    /// Creates a rectangle with the specified origin and size.
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    /// Creates a rectangle with coordinates and dimensions specified as floating-point values.
    init(x: Double, y: Double, width: Double, height: Double) {
        self.origin = Point(x: x, y: y)
        self.size   = Size(width: width, height: height)
    }
    
    /// Creates a rectangle with coordinates and dimensions specified as integer values.
    init(x: Int, y: Int, width: Int, height: Int) {
        self.origin = Point(x: x, y: y)
        self.size   = Size(width: width, height: height)
    }
    
    /// Special Values
    /// A rectangle that has infinite extent.
    static let infinite: Rectangle = Rectangle(origin: Point(x:-Double.infinity, y:-Double.infinity), size: Size(width: Double.infinity, height: Double.infinity))
    
    static let null: Rectangle = Rectangle()

    /// The null rectangle, representing an invalid value.
    static var zero: Rectangle {
        get {
            return Rectangle()
        }
    }
    /// The rectangle whose origin and size are both zero.
    /// Creates a rectangle with origin (0,0) and size (0,0).
    init() {
        
    }
    
    /// Returns the smallest value for the x-coordinate of the rectangle.
    var minX: Double {
        if (size.width > 0) {
            return origin.x
        }
        return origin.x + size.width
    }
    /// Returns the x-coordinate that establishes the center of a rectangle.
    var midX: Double {
        get {
            return origin.x + (size.width / 2)
        }
    }
    /// Returns the largest value of the x-coordinate for the rectangle.
    var maxX: Double {
        if (size.width < 0) {
            return origin.x
        }
        return origin.x + size.width
    }

    /// Returns the smallest value for the y-coordinate of the rectangle.
    var minY: Double {
        if (size.height > 0) {
            return origin.y
        }
        return origin.y + size.height
    }

    /// Returns the y-coordinate that establishes the center of the rectangle.
    var midY: Double {
        get {
            return origin.y + (size.height / 2)
        }
    }
    /// Returns the largest value for the y-coordinate of the rectangle.
    var maxY: Double {
        if (size.height < 0) {
            return origin.y
        }
        return origin.y + size.height
    }

    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }

    /// Creating Derived Rectangles
    /// Returns a rectangle with a positive width and height.
    // var standardized: Rectangle
    /// Returns the smallest rectangle that results from converting the source rectangle values to integers.
    // first standardize, then take integers
    // var integral: Rectangle

    /// Applies an affine transform to a rectangle.
    // func applying(CGAffineTransform)
    
    /// Returns a rectangle that is smaller or larger than the source rectangle, with the same center point.
    /// but the size cannot be negative
    func insetBy(dx: Double, dy: Double) -> Rectangle {
        let dxnew = dx > 0 && (dx * 2) > size.width ? size.width / 2 : dx
        let dynew = dy > 0 && (dy * 2) > size.height ? size.height / 2 : dy

        let newOrigin = Point(x: origin.x + dxnew, y: origin.y + dynew)
        let newSize = Size(width: size.width - 2*dxnew, height: size.height - 2*dynew)
//        newSize.width = newSize.width < 0 ? 0 : newSize.width
//        newSize.height = newSize.height < 0 ? 0 : newSize.height
        return Rectangle(origin: newOrigin, size: newSize)
    }
    /// Returns a rectangle with an origin that is offset from that of the source rectangle.
    func offsetBy(dx: Double, dy: Double) -> Rectangle {
        let newOrigin = Point(x: origin.x + dx, y: origin.y + dy)
        return Rectangle(origin: newOrigin, size: size)
    }
    
    /// Extend a rectangle to include the point if it does not fall within the rectangle
    mutating func extend(_ point:Point) {
        if !self.contains(point) {
            var newOrigin = origin
            var newSize = size
            if point.x < newOrigin.x {
                newSize.width += (newOrigin.x - point.x)
                newOrigin.x = point.x
            }
            if point.y < newOrigin.y {
                newSize.height += (newOrigin.y - point.y)
                newOrigin.y = point.y
            }
            if point.x > newOrigin.x {
                newSize.width = (point.x - newOrigin.x)
            }
            if point.y > newOrigin.y {
                newSize.height = (point.y - newOrigin.y)
            }
            self.origin = newOrigin
            self.size = newSize
        }
    }
    
    /// Returns the smallest rectangle that contains the two source rectangles.
    func union(_ rect2: Rectangle) -> Rectangle {
        let minX = minimum(origin.x, rect2.origin.x)
        let minY = minimum(origin.y, rect2.origin.y)
        let maxX = maximum(origin.x + width, rect2.origin.x + rect2.width)
        let maxY = maximum(origin.y + height, rect2.origin.y + rect2.height)
        
        return Rectangle(origin: Point(x:minX, y:minY), size: Size(width: maxX - minX, height: maxY - minY))
    }
    /// Returns the intersection of two rectangles.
    // func intersection(Rectangle) -> Rectangle

    /// Creates two rectangles by dividing the original rectangle.
    // func divided(atDistance: Double, from: RectangleEdge)
    /// Coordinates that establish the edges of a rectangle.
    // RectangleEdge
    
    /// Checking Characteristics
    /// Returns whether two rectangles intersect.
    // func intersects(Rectangle) -> Bool
    
    /// Returns whether a rectangle contains a specified point.
    // FIXME: naive implementation
    func contains(_ point: Point) -> Bool {
        if (minX <= point.x && point.x <= maxX) && (minY <= point.y && point.y <= maxY) {
            return true
        }
        return false
    }
    /// Returns whether the first rectangle contains the second rectangle.
    func contains(_ rect2:Rectangle) -> Bool {
        if (minX <= rect2.minX && rect2.minX <= maxX) && (minY <= rect2.minY && rect2.minY <= maxY) &&
            (rect2.maxX <= maxX) && (rect2.maxY <= maxY) {
            return true
        }
        return false
    
    }
    /// Returns whether a rectangle has zero width or height, or is a null rectangle.
    // var isEmpty: Bool
    /// Returns whether a rectangle is infinite.
    // var isInfinite: Bool
    /// Returns whether the rectangle is equal to the null rectangle.
    // var isNull: Bool
    
    /// Alternate Representations
    // var dictionaryRepresentation: CFDictionary
    /// Returns a dictionary representation of the provided rectangle.
    // init?(dictionaryRepresentation: CFDictionary)
    /// Creates a rectangle from a canonical dictionary representation.
    var debugDescription: String {
        return ("Rectangle origin:\(origin.debugDescription), size:\(size.debugDescription)")
    }

    // var customMirror: Mirror
    /// A representation of the rectangle's structure and display style for use in debugging.
    // var customPlaygroundQuickLook: PlaygroundQuickLook
    /// A representation of the rectangle for use in Playgrounds.
    
    /// Comparing Rectangles
    /// Returns whether two rectangles are equal in size and position.
    func equalTo(_ rect2:Rectangle) -> Bool {
        return self.origin == rect2.origin && self.size == rect2.size
    }
    
    func minimum(_ lhs:Double, _ rhs: Double) -> Double {
        return lhs < rhs ? lhs : rhs
    }
    func maximum(_ lhs:Double, _ rhs: Double) -> Double {
        return lhs > rhs ? lhs : rhs
    }
}

/*
 
 Conforms To
	•	CustomDebugStringConvertible
	•	CustomPlaygroundQuickLookable
	•	CustomReflectable
	•	Equatable
 
 */
