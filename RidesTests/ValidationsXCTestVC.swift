//
//  ValidationsXCTestVC.swift
//  RidesTests
//
//  Created by Najjar Singh on 2023-01-23.
//

import XCTest
@testable import Rides
final class ValidationsXCTestVC: XCTestCase {
    var testClass: VehicleListVC?
    
    func test_number_validation() {
        let nm = 100
        let nm1 = 0
        XCTAssertLessThan(99, nm)
        XCTAssertGreaterThan(1, nm1)
// --- This method is more simple and easy to check the range of input.
//        let value = 10
//        XCTAssertTrue(0 < value)
//        XCTAssertTrue(100 > value)
       }
    
    func test_carbon_emission(){
        let Mileage1 = 4999
        let Mileage2 = 5500
        let co2 = Mileage1 * 1
        let Xco2 = Mileage2 * Int(1.5)
        XCTAssertTrue(Mileage1 < 5000 , String(co2))
        XCTAssertTrue(Mileage2 > 5000 , String(Xco2))
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
