//
//  Point.swift
//  ServerGraphics
//
//  Created by Axel Roest on 23/05/17.
//
//

/**
 A structure that contains a point in a two-dimensional coordinate system.
*/

import Foundation

struct Point {
    /// Geometric Properties
    /// The x-coordinate of the point.
    var x: Double = 0.0
    /// The y-coordinate of the point.
    var y: Double = 0.0

    /// Creating Point Values
    
    /// Creates a point with coordinates specified as floating-point values.
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    /// Creates a point with coordinates specified as integer values.
    init(x: Int, y: Int) {
        self.x = Double(x)
        self.y = Double(y)
    }

    /// Special Values
    /// The point with location (0,0).
    static var zero: Point {
        get {
            return self.init()
        }
    }
    /// Creates a point with location (0,0).
    init() {
        
    }

    /// Transforming Points
    /// Returns the point resulting from an affine transformation of an existing point.
    // func applying(CGAffineTransform)
    
    /// Alternate Representations
    
    /// Returns a dictionary representation of the specified point.
    // var dictionaryRepresentation: CFDictionary

    /// Creates a point from a canonical dictionary representation.
    // init?(dictionaryRepresentation: CFDictionary)

    /// A textual representation of the point's coordinate values.
    var debugDescription: String {
        return ("Point x:\(x), y:\(y)")
    }
    /// A representation of the point's structure and display style for use in debugging.
    // var customMirror: Mirror

    /// A representation of the point for use in Playgrounds.
    // var customPlaygroundQuickLook: PlaygroundQuickLook

    /// Comparing Points
    static public func ==(lhs:Point, rhs:Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    /// Returns whether two points are equal.
    func equalTo(_ otherPoint: Point) -> Bool {
        return self.x == otherPoint.x && self.y == otherPoint.y
    }
    
    
}

/*
 
 Symbols
 
 Relationships
 
 Conforms To
 
 CustomDebugStringConvertible
 CustomPlaygroundQuickLookable
 CustomReflectable
 Equatable
 
 */
