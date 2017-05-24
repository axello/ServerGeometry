//
//  Test.swift
//  Test
//
//  Created by Axel Roest on 23/05/17.
//
//

import XCTest
@testable import App

class SizeTest: XCTestCase {
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
        let size = Size()
        XCTAssert(size.width == 0)
        XCTAssert(size.height == 0)
    }
    
    func testSizeZero() {
        let size = Size.zero
        XCTAssert(size.width == 0)
        XCTAssert(size.height == 0)
    }
    
    public func sizeInt() -> Size {
        let size = Size(width:40, height:30)
        XCTAssert(size.width == 40)
        XCTAssert(size.height == 30)
        return size
    }
    
    public func sizeDouble() -> Size {
        let size = Size(width:20.3, height:10.9)
        XCTAssert(size.width == 20.3)
        XCTAssert(size.height == 10.9)
        return size
    }
    
    func testCompare() {
        let size1 = sizeDouble()
        let size2 = sizeDouble()
        XCTAssertTrue(size1==size2)
        XCTAssertTrue(size1.equalTo(size2))
        let size3 = sizeInt()
        XCTAssertFalse(size1==size3)
        XCTAssertFalse(size1.equalTo(size3))
    }

    func testDescription() {
        var size = sizeInt()
        var text = size.debugDescription
        XCTAssertTrue(text == "Size width:40.0, height:30.0")
        
        size = sizeDouble()
        text = size.debugDescription
        XCTAssertTrue(text == "Size width:20.3, height:10.9")
    }
}
