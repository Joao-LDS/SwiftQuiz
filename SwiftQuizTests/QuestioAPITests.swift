//
//  QuestioAPITests.swift
//  SwiftQuizTests
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import XCTest
@testable import SwiftQuiz

class QuestioAPITests: XCTestCase {
    
    var service: QuestionAPI!

    override func setUp() {
        super.setUp()
        service = QuestionAPI()
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func testResponseRequestQuestionAPI() throws {
        let promise = expectation(description: "Request successfully")
        
        service.request { questions in
            XCTAssertNotNil(questions, "Response from API is nil")
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("testResponseRequestQuestionAPI fail: \(error.localizedDescription) ")
            }
        }
    }

}
