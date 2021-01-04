//
//  QuizViewModel.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 01/07/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

protocol QuizViewModelProtocol {
    var question: String { get }
    var options: [String] { get }
    var example: String { get set }
    func fetchQuestions(completion: @escaping(Bool) -> Void)
    func setCurrencyQuestion() -> Bool
    func validateAnswer(at index: Int)
    func resultViewController() -> ResultViewController
}

class QuizViewModel {
    
    // MARK: - Properties
    
    var questions: [Question] = []
    var currentQuestion: Question!
    let webservice: QuestionAPIProtocol
    var correctAnswer = 0
    var wrongAnswer = 0
    var example: String
    
    
    // MARK: - Init
    
    init(webservice: QuestionAPIProtocol = QuestionAPI()) {
        self.webservice = webservice
        self.example = ""
    }
    
    // MARK: - Functions
    
    func numberOfQuestions() -> Int {
        correctAnswer + wrongAnswer
    }

    func returnObjectResult() -> Result {
        let numberOfQuestions = self.numberOfQuestions()
        return Result(correctAnswers: correctAnswer, wrongAnswers: wrongAnswer, numberOfQuestions: numberOfQuestions)
    }
    
}

extension QuizViewModel: QuizViewModelProtocol {
    
    var question: String {
        currentQuestion.question
    }
    
    var options: [String] {
        currentQuestion.options
    }
    
    func fetchQuestions(completion: @escaping(Bool) -> ()) {
        self.webservice.request { error, response in
            if let error = error {
                switch error {
                case .errorResponse:
                    self.example = "No Data"
                case .noData:
                    self.example = "Error Response"
                }
                completion(false)
            } else if let response = response {
                self.questions = response
                self.example = "Sucess"
                completion(true)
            }
        }
    }
    
    func setCurrencyQuestion() -> Bool {
        if questions.isEmpty == false {
            let index = Int.random(in: 0..<questions.count)
            currentQuestion = questions[index]
            questions.remove(at: index)
            return true
        } else {
            return false
        }
    }
    
    func validateAnswer(at index: Int) {
        let answer = currentQuestion?.options[index]
        if answer == currentQuestion?.correctAnswer {
            correctAnswer += 1
        } else {
            wrongAnswer += 1
        }
    }
    
    func resultViewController() -> ResultViewController {
        let result = returnObjectResult()
        let viewModel = ResultViewModel(result: result)
        let controller = ResultViewController(viewModel: viewModel)
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
}
