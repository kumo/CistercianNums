//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Robert Clarke on 03/02/21.
//

import XCTest

class Tests_iOS: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    func testConversions() throws {
        let conversion1 = convertValue2(value: "1993")
        
        let expected1: CistercianDrawing = [
            .topRightDiagDown, .topLeftH, .topLeftV,
            .topMiddleLeftH, .bottomLeftH, .bottomRightH,
            .bottomRightV, .bottomMiddleRightH] // 1993
        
        assert(conversion1 == expected1)
        
        let conversion2 = convertValue2(value: "9433")
        
        let expected2: CistercianDrawing = [
            .topRightDiagDown, .topLeftDiagDown,
            .bottomRightDiagDown,
            .bottomLeftV, .bottomLeftH, .bottomMiddleLeftH] // 9433
        
        assert(conversion2 == expected2)
    }
}
