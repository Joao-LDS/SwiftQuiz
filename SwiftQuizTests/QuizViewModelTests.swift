//
//  QuizViewModelTests.swift
//  SwiftQuizTests
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import XCTest
@testable import SwiftQuiz

class QuizViewModelTests: XCTestCase {

    var sut: QuizViewModel!
    
    override func setUp() {
        super.setUp()
        sut = QuizViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
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

}
