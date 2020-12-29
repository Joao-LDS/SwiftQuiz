//
//  QuizViewModel.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 01/07/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class QuizViewModel {
    
    // MARK: - Properties
    
    var questions: [Question] = []
    var currencyQuestion: Question?
    let webservice =  QuestionAPI()
    var delegate: QuizViewModelDelegate?
    var correctAnswer = 0
    var wrongAnswer = 0
    var numberOfQuestions = 0
    
    // MARK: - Functions
    
    func fetchQuestions() {
        self.webservice.request { response in
            if let response = response {
                self.questions = response
                self.delegate?.updateView()
            }
        }
    }
    
    func setCurrencyQuestion() {
        if questions.isEmpty == false {
            let index = Int.random(in: 0..<questions.count)
            currencyQuestion = questions[index]
            questions.remove(at: index)
        } else {
            let result = returnObjectResult()
            delegate?.presentResultViewController(With: result)
        }
    }
    
    func incrementNumberOfQuestions() {
        numberOfQuestions += 1
    }

    
    func validateAnswer(at index: Int) {
        let answer = currencyQuestion?.options[index]
        if answer == currencyQuestion?.correctAnswer {
            correctAnswer += 1
        } else {
            wrongAnswer += 1
        }
    }
    
    func returnObjectResult() -> Result {
        return Result(correctAnswers: correctAnswer, wrongAnswers: wrongAnswer, numberOfQuestions: numberOfQuestions)
    }
    
}
