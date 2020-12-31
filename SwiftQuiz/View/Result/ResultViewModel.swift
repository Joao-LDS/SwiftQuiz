//
//  ResultViewModel.swift
//  SwiftQuiz
//
//  Created by João Luis Santos on 08/07/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation

protocol ResultViewModelProtocol {
    var correctAnswers: Int { get }
    var wrongAnswers: Int { get }
    func getResult() -> Int
}

class ResultViewModel {
    
    // MARK: - Properties
    
    private let result: Result
    
    // MARK: - Init

    init(result: Result) {
        self.result = result
    }
    
}

extension ResultViewModel: ResultViewModelProtocol {
    
    var correctAnswers: Int {
        result.correctAnswers
    }
    
    var wrongAnswers: Int {
        result.wrongAnswers
    }
    
    func getResult() -> Int {
        let correct = result.correctAnswers
        let numberOfQuestions = result.numberOfQuestions
        let score = correct * 100 / numberOfQuestions
        return score
    }
    
}
