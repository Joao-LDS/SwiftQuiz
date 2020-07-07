//
//  QuizViewModel.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 01/07/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

protocol QuizViewModelDelegate {
    func presentResultViewController()
}

class QuizViewModel: UIViewController {
    
    private var data: [Question] = []
    private var currencyQuestion: Question?
    private let webservice =  QuestionAPI()
    var delegate: QuizViewModelDelegate?
    private var correctAnswer = 0
    
    func fetchQuestions(completion: @escaping (Bool) -> Void) {
        self.webservice.request { response in
            self.data = response
            completion(true)
        }
    }
    
    func setCurrencyQuestion() {
        if !data.isEmpty {
            let index = Int.random(in: 0..<data.count)
            currencyQuestion = data[index]
            data.remove(at: index)
        } else {
            delegate?.presentResultViewController()
        }
    }
    
    func getQuestion() -> String? {
        return currencyQuestion?.question
    }
    
    func getOptions() -> [String]? {
        return currencyQuestion?.options
    }
    
    func validateAnswer(at index: Int) {
        let answer = currencyQuestion?.options[index]
        if answer == currencyQuestion?.correctAnswer {
            correctAnswer += 1
            print("Respostas corretas: ", correctAnswer)
        }
    }
    
    func returnCorrectAnswer() -> Int {
        return correctAnswer
    }
    
}
