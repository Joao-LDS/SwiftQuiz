//
//  QuestionAPIMock.swift
//  SwiftQuizTests
//
//  Created by João Luis Santos on 04/01/21.
//  Copyright © 2021 João Luis dos Santos. All rights reserved.
//

import Foundation
@testable import SwiftQuiz

class QuestionAPIMock: QuestionAPIProtocol {
    
    enum Example {
        case sucess
        case noData
        case errorResponse
    }
    
    let example: Example
    
    init(example: Example) {
        self.example = example
    }
    
    func request(onComplete: @escaping (QuestionAPIError?, [Question]?) -> Void) {
        switch example {
        case .sucess:
            let question = createQuestionObjectMock()
            onComplete(nil, [question])
        case .noData:
            onComplete(.noData, nil)
        case .errorResponse:
            onComplete(.errorResponse, nil)
        }
    }
    
    func createQuestionObjectMock() -> Question {
        var question: Question!
        let path = Bundle.main.url(forResource: "question", withExtension: "json")!
        let data = try? Data(contentsOf: path)
        question = try? JSONDecoder().decode(Question.self, from: data!)
        return question
    }

}
