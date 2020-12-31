//
//  QuizViewModel.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 01/07/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

protocol QuizViewModelProtocol {
    var delegate: QuizViewModelDelegate? { get set }
    var question: String { get }
    var options: [String] { get }
    func fetchQuestions(completion: @escaping(Bool) -> Void)
    func setCurrencyQuestion()
    func validateAnswer(at index: Int)
    func resultViewController() -> ResultViewController
}

class QuizViewModel {
    
    // MARK: - Properties
    
    private var questions: [Question] = []
    private var currencyQuestion: Question!
    private let webservice =  QuestionAPI()
    private var correctAnswer = 0
    private var wrongAnswer = 0
    var numberOfQuestions = 0
    
    var delegate: QuizViewModelDelegate?
    
    // MARK: - Functions
    
    func increaseNumberOfQuestions() {
        numberOfQuestions += 1
    }

    func returnObjectResult() -> Result {
        return Result(correctAnswers: correctAnswer, wrongAnswers: wrongAnswer, numberOfQuestions: numberOfQuestions)
    }
    
}

extension QuizViewModel: QuizViewModelProtocol {
    
    var question: String {
        currencyQuestion.question
    }
    
    var options: [String] {
        currencyQuestion.options
    }
    
    func fetchQuestions(completion: @escaping(Bool) -> Void) {
        self.webservice.request { _, response in
            if let response = response {
                self.questions = response
                completion(true)
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
    
    func validateAnswer(at index: Int) {
        let answer = currencyQuestion?.options[index]
        if answer == currencyQuestion?.correctAnswer {
            correctAnswer += 1
        } else {
            wrongAnswer += 1
        }
        increaseNumberOfQuestions()
    }
    
    func resultViewController() -> ResultViewController {
        let result = returnObjectResult()
        let viewModel = ResultViewModel(result: result)
        let controller = ResultViewController(viewModel: viewModel)
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
}
