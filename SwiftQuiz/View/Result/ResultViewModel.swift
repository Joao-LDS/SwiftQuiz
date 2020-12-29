//
//  ResultViewModel.swift
//  SwiftQuiz
//
//  Created by João Luis Santos on 08/07/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation

class ResultViewModel {
    
    // MARK: - Properties
    
    let result: Result
    
    // MARK: - Init

    init(result: Result) {
        self.result = result
    }
    
    // MARK: - Functions
    
    func getResult() -> Int {
        let correct = result.correctAnswers
        let numberOfQuestions = result.numberOfQuestions
        let score = correct * 100 / numberOfQuestions
        return score
    }
    
}
