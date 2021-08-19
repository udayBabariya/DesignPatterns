//
//  Design_PatternTests.swift
//  Design PatternTests
//
//  Created by Uday on 19/08/21.
//

import XCTest
@testable import Design_Pattern

class Design_PatternTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testConcurrentUsage(){
        let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
        
        let expect = expectation(description: "using Appsetting.shared from multiple thread shall succeed")
        
        let callCount = 100
        
        for callIndex in 1...callCount{
            concurrentQueue.async {
                AppSettingReadLock.shared.set(value: callIndex, forKey: String(callIndex))
            }
        }
        
        while AppSettingReadLock.shared.int(forKey: String(callCount)) != callCount {
            //nop
        }
        
        expect.fulfill()
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "Test expactation failed")
        }
    }

}
