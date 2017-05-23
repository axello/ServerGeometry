//
//  Size.swift
//  ServerGraphics
//
//  Created by Axel Roest on 23/05/17.
//
//
/**
 A structure that contains width and height values.
 
 A Size structure is sometimes used to represent a distance vector, rather than a physical size. As a vector, its values can be negative. To normalize a Rectangle structure so that its size is represented by positive values, call the standardized function.

*/

import Foundation

struct Size {
    /// Geometric Properties
    var width: Double = 0.0
    /// A width value.
    var height: Double = 0.0
    /// A height value.

    /// Overview
    
    
    /// Initializers
    
    /// Creates a size with dimensions specified as floating-point values.
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    /// Creates a size with dimensions specified as integer values.
    init(width: Int, height: Int) {
        self.width = Double(width)
        self.height = Double(height)
    }

    /// Special Values
    
    /// The size whose width and height are both zero.
    static var zero: Size {
        get {
            return self.init()
        }
    }
    /// Creates a size with zero width and height.
    init() {
        
    }

    /// Transforming Sizes
    
    /// Returns the height and width resulting from a transformation of an existing height and width.
    // func applying(CGAffineTransform)

    /// Alternate Representations
    
    /// Returns a dictionary representation of the specified size.
    // var dictionaryRepresentation: CFDictionary
    
    /// Creates a size from a canonical dictionary representation.
    // init?(dictionaryRepresentation: CFDictionary)
    
    /// A textual representation of the size's dimensions.
    var debugDescription: String {
        return ("Size width:\(width), height:\(height)")
    }
    
    /// A representation of the size's structure and display style for use in debugging.
    // var customMirror: Mirror
    /// A representation of the size for use in Playgrounds.
    // var customPlaygroundQuickLook: PlaygroundQuickLook

    /// Comparing Sizes
    static public func ==(lhs:Size, rhs:Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
    
    /// Returns whether two sizes are equal.
    func equalTo(_ otherSize: Size) -> Bool {
        return self.width == otherSize.width && self.height == otherSize.height
    }
    
    
}

/*
 Relationships
 
 Conforms To
 
 CustomDebugStringConvertible
 CustomPlaygroundQuickLookable
 CustomReflectable
 Equatable
 
 */
