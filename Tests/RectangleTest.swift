//
//  RectangleTest.swift
//  Test
//
//  Created by Axel Roest on 23/05/17.
//
//

import XCTest
@testable import App

class RectangleTest: XCTestCase {
    let originxint = 10
    let originyint = 15
    let originxintd = 10.0
    let originyintd = 15.0
    let originxdouble = 10.2
    let originydouble = 7.9
    
    let widthint = 40
    let heightint = 30
    let widthintd = 40.0
    let heightintd = 30.0
    let widthdouble = 40.2
    let heightdouble = 30.3

    let dx = 2.0
    let dy = -3.0

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func rectangleInt() -> Rectangle {
        let rect = Rectangle(origin:Point(x:originxint, y:originyint), size:Size(width:widthint, height:heightint))
        return rect
    }
    
    func rectangleDouble() -> Rectangle {
        let rect = Rectangle(origin:Point(x:originxdouble, y:originydouble), size:Size(width:widthdouble, height:heightdouble))
        return rect
    }

    func rectangleDoubleNegativeSize() -> Rectangle {
        let rect = Rectangle(origin:Point(x:originxdouble, y:originydouble), size:Size(width:-widthdouble, height:-heightdouble))
        return rect
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    func testInitialiser() {
        var rect = Rectangle()
        XCTAssert(rect.origin.x == 0)
        XCTAssert(rect.origin.y == 0)
        XCTAssert(rect.size.width == 0)
        XCTAssert(rect.size.height == 0)

        rect = rectangleInt()
        XCTAssert(rect.origin.x == originxintd)
        XCTAssert(rect.origin.y == originyintd)
        XCTAssert(rect.size.width == widthintd)
        XCTAssert(rect.size.height == heightintd)

        rect = rectangleDouble()
        XCTAssert(rect.origin.x == originxdouble)
        XCTAssert(rect.origin.y == originydouble)
        XCTAssert(rect.size.width == widthdouble)
        XCTAssert(rect.size.height == heightdouble)
    }
    
    func testRectangleZero() {
        let p = Rectangle.zero
        XCTAssert(p.origin.x == 0)
        XCTAssert(p.origin.y == 0)
        XCTAssert(p.size.width == 0)
        XCTAssert(p.size.height == 0)
    }
    
    func testIntxyInitialiser() {
        let rect = Rectangle(x:originxint, y:originyint, width:widthint, height:heightint)
        XCTAssert(rect.origin.x == originxintd)
        XCTAssert(rect.origin.y == originyintd)
        XCTAssert(rect.size.width == widthintd)
        XCTAssert(rect.size.height == heightintd)
    }

    func testDoublexyInitialiser() {
        let rect = Rectangle(x:originxdouble, y:originydouble, width:widthdouble, height:heightdouble)
        XCTAssert(rect.origin.x == originxdouble)
        XCTAssert(rect.origin.y == originydouble)
        XCTAssert(rect.size.width == widthdouble)
        XCTAssert(rect.size.height == heightdouble)
        
        XCTAssertEqual(rect.width, widthdouble)
        XCTAssertEqual(rect.height, heightdouble)
    }
    
    func testExtrema() {
        let rect = rectangleDouble()
        XCTAssert(rect.minX == originxdouble)
        XCTAssert(rect.minY == originydouble)
        XCTAssert(rect.maxX == originxdouble + widthdouble)
        XCTAssert(rect.maxY == originydouble + heightdouble)
        XCTAssert(rect.midX == originxdouble + widthdouble/2)
        XCTAssert(rect.midY == originydouble + heightdouble/2)

        let midPoint = Point(x: originxdouble + widthdouble/2, y: originydouble + heightdouble/2)
        XCTAssertTrue(rect.center == midPoint)
        let originPoint = Point(x: originxdouble, y: originydouble + heightdouble/2)
        XCTAssertFalse(rect.center == originPoint)
    }
    
    func testExtremaNegative() {
        let rect = rectangleDoubleNegativeSize()
        XCTAssert(rect.minX == originxdouble - widthdouble)
        XCTAssert(rect.minY == originydouble - heightdouble)
        XCTAssert(rect.maxX == originxdouble)
        XCTAssert(rect.maxY == originydouble)
        XCTAssert(rect.midX == originxdouble - widthdouble/2)
        XCTAssert(rect.midY == originydouble - heightdouble/2)
        
        let midPoint = Point(x: originxdouble - widthdouble/2, y: originydouble - heightdouble/2)
        XCTAssertTrue(rect.center == midPoint)
        let originPoint = Point(x: originxdouble, y: originydouble - heightdouble/2)
        XCTAssertFalse(rect.center == originPoint)
    }

    func testContainsPoint() {
        let rect = rectangleDouble()
        var p = Point(x: originxdouble + 1, y: originydouble + 1)
        XCTAssertTrue(rect.contains(p))
        p = Point(x: originxdouble + widthdouble - 1, y: originydouble + heightdouble - 1)
        XCTAssertTrue(rect.contains(p))
        
        p = Point(x: originxdouble - 1, y: originydouble + 1)
        XCTAssertFalse(rect.contains(p))
        p = Point(x: originxdouble + 1, y: originydouble + heightdouble + 1)
        XCTAssertFalse(rect.contains(p))
        p = Point(x: originxdouble + widthdouble + 1, y: originydouble + heightdouble + 1)
        XCTAssertFalse(rect.contains(p))
    }
    
    func testContainsRect() {
        let rect = rectangleDouble()
        let rect2 = rectangleInt()

        XCTAssertFalse(rect.contains(rect2))
        XCTAssertFalse(rect2.contains(rect))

        let rect3 = Rectangle(x: 15, y: 20, width: 10, height: 12)
        XCTAssertTrue(rect.contains(rect3))
        XCTAssertTrue(rect2.contains(rect3))
    }
    
    func testInsetRect() {
        let rect1 = rectangleInt()
        let rect2 = rect1.insetBy(dx: dx, dy: dy)
        XCTAssert(rect2.origin.x == originxintd + dx)
        XCTAssert(rect2.origin.y == originyintd + dy)
        XCTAssert(rect2.size.width == widthintd - 2 * dx)
        XCTAssert(rect2.size.height == heightintd - 2 * dy)
        
        let midPoint = rect1.center
        let rect3 = rect1.insetBy(dx: widthdouble + 1, dy: dy)
        XCTAssertTrue(rect3.center == midPoint)

        let rect4 = rect1.insetBy(dx: dx, dy: heightdouble * 2)
        XCTAssertTrue(rect4.center == midPoint)
    }

    func testCenter() {
        let rect1 = rectangleInt()
        var rect2 = rect1
        let point = Point(x: -50.0, y: -30.0)
        rect2.center = point
        XCTAssert(rect2.origin.x == point.x - rect1.width / 2)
        XCTAssert(rect2.origin.y == point.y - rect1.height / 2)
        XCTAssert(rect2.width == rect1.width)
        XCTAssert(rect2.height == rect1.height)
        
        let midPoint = rect1.center
        let rect3 = rect1.insetBy(dx: widthdouble, dy: dy)
        XCTAssertTrue(rect3.center == midPoint)
    }

    func testCompare() {
        let p1 = rectangleDouble()
        let p2 = rectangleDouble()
        XCTAssertTrue(p1.equalTo(p2))
        let p3 = rectangleInt()
//        XCTAssertFalse(p1==p3)
        XCTAssertFalse(p1.equalTo(p3))
    }
    
    func testOffset() {
        let p1 = rectangleInt()
        let p2 = p1.offsetBy(dx: dx, dy: dy)
        XCTAssertEqual(p1.origin.x + dx, p2.origin.x)
        XCTAssertEqual(p1.origin.y + dy, p2.origin.y)
        XCTAssertEqual(p1.size.width, p2.size.width)
        XCTAssertEqual(p1.size.height, p2.size.height)
    }

    func testDescription() {
        var p = rectangleInt()
        var text = p.debugDescription
        XCTAssertTrue(text == "Rectangle origin:Point x:\(originxintd), y:\(originyintd), size:Size width:\(widthintd), height:\(heightintd)")
        
        p = rectangleDouble()
        text = p.debugDescription
        XCTAssertTrue(text == "Rectangle origin:Point x:\(originxdouble), y:\(originydouble), size:Size width:\(widthdouble), height:\(heightdouble)")
    }

    func testExtend() {
        let rectRef = rectangleInt()
        var rect = rectRef
        // stay the same
        var p = Point(x:rect.center.x, y:rect.center.y)
        XCTAssertEqual(rectRef.origin.x   , rect.origin.x)
        XCTAssertEqual(rectRef.origin.y   , rect.origin.y)
        XCTAssertEqual(rectRef.size.width , rect.size.width)
        XCTAssertEqual(rectRef.size.height, rect.size.height)

        // extend
        p = Point(x:-10, y:5)
        rect.extend(p)
        XCTAssertEqual(rect.origin.x   , -10)
        XCTAssertEqual(rect.origin.y   , 5)
        XCTAssertEqual(rect.size.width , rectRef.size.width + (originxintd + 10.0))
        XCTAssertEqual(rect.size.height, rectRef.size.height + (originyintd - 5))
        
        // extend again
        p = Point(x:100, y:100)
        rect.extend(p)
        XCTAssertEqual(rect.origin.x   , -10)
        XCTAssertEqual(rect.origin.y   , 5)
        XCTAssertEqual(rect.size.width , 110.0)
        XCTAssertEqual(rect.size.height, 95.0)
    }
    
    func testUnion() {
        let r1 = rectangleInt()
        let r2 = rectangleDouble()
        let r3 = r1.union(r2)
        
        XCTAssertEqual(r3.origin.x   , originxintd)
        XCTAssertEqual(r3.origin.y   , originydouble)
        XCTAssertEqual(r3.width , originxdouble + widthdouble - originxintd)
        XCTAssertEqual(r3.height, originyintd + heightintd - originydouble)
        
    }
}
