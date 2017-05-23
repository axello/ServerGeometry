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
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    func testInitialisers() {
        let rect = Rectangle(origin:Point(x:-10, y:-10), size:Size(width:40, height:30))
        XCTAssert(rect.size.width == 40)
        XCTAssert(rect.size.height == 30)
    }
    
}
