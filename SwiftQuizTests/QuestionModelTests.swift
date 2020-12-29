//
//  QuestionModelTests.swift
//  SwiftQuizTests
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import XCTest
@testable import SwiftQuiz

class QuestionModelTests: XCTestCase {
    
    var questionJSONData: Data!
    var arrayJSONData: Data!
    
    override func setUp() {
        super.setUp()
        if let path = Bundle.main.path(forResource: "question", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            questionJSONData = try? Data(contentsOf: url)
        }
        if let path = Bundle.main.path(forResource: "array", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            arrayJSONData = try? Data(contentsOf: url)
        }
    }
    
    override func tearDown() {
        arrayJSONData = nil
        questionJSONData = nil
        super.tearDown()
    }

    func testQuestionResponse() throws {
        let decoder = JSONDecoder()
        let item = try decoder.decode(Question.self, from: questionJSONData)
        
        XCTAssertEqual(item.question, "Quais desses é string?")
        XCTAssertEqual(item.correctAnswer, "\"Olá mundo\"")
    }
    
    func testQuestionArrayResponse() throws {
        let decoder = JSONDecoder()
        let item = try decoder.decode([Question].self, from: arrayJSONData)
        
        XCTAssertEqual(item.count, 12)
    }

}
