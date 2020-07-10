//
//  ResultViewModel.swift
//  SwiftQuiz
//
//  Created by João Luis Santos on 08/07/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation

class ResultViewModel {
    
    private let correctAnswer: Int
    private let wrongAnswer: Int
    private lazy var numberOfQuestion: Int = self.correctAnswer + self.wrongAnswer

    init(_ result: Result) {
        self.correctAnswer = result.correct
        self.wrongAnswer = result.wrong
    }
    
    func getCorrectAnswer() -> Int {
        return correctAnswer
    }
    
    func getWrongAnswer() -> Int {
        return wrongAnswer
    }
    
    func getResult() -> Int {
        let res = correctAnswer * 100 / numberOfQuestion
        return res
    }
    
}
