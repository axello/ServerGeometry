//
//  Test.swift
//  Test
//
//  Created by Axel Roest on 23/05/17.
//
//

import XCTest
@testable import App

class PointTest: XCTestCase {
    let xint = -10
    let yint = -20
    let xintd = -10.0
    let yintd = -20.0
    let xdouble = 20.3
    let ydouble = 10.9
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    func testInitialiser() {
        let p = Point()
        XCTAssert(p.x == 0)
        XCTAssert(p.y == 0)
    }
    
    func testPointZero() {
        let p = Point.zero
        XCTAssert(p.x == 0)
        XCTAssert(p.y == 0)
    }

    public func pointInt() -> Point {
        let point = Point(x:xint, y:yint)
        XCTAssert(point.x == xintd)
        XCTAssert(point.y == yintd)
        return point
    }
    
    public func pointDouble() -> Point {
        let point = Point(x:xdouble, y:ydouble)
        XCTAssert(point.x == xdouble)
        XCTAssert(point.y == ydouble)
        return point
    }
    
    func testCompare() {
        let p1 = pointDouble()
        let p2 = pointDouble()
        XCTAssertTrue(p1==p2)
        XCTAssertTrue(p1.equalTo(p2))
        let p3 = pointInt()
        XCTAssertFalse(p1==p3)
        XCTAssertFalse(p1.equalTo(p3))
    }
    
    func testDescription() {
        var p = pointInt()
        var text = p.debugDescription
        XCTAssertTrue(text == "Point x:\(xintd), y:\(yintd)")
        
        p = pointDouble()
        text = p.debugDescription
        XCTAssertTrue(text == "Point x:\(xdouble), y:\(ydouble)")
    }

}
