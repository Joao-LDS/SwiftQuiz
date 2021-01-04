//
//  QuizViewControllerTests.swift
//  SwiftQuizTests
//
//  Created by João Luis Santos on 04/01/21.
//  Copyright © 2021 João Luis dos Santos. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftQuiz

class QuizViewControllerTests: QuickSpec {

    override func spec() {
        describe("QuizViewController") {
            
            var sut: QuizViewController!
            
            context("Configure View") {
                it("Sucess Fetch Questions") {
                    let viewModel = QuizViewModel(webservice: QuestionAPIMock(example: .sucess))
                    sut = QuizViewController(viewModel: viewModel)
                    sut.loadView()
                    sut.fetchQuestions()
                    let question = sut.uiview.questionLabel.text
                    expect(question).to(equal("Quais desses é string?"))
                }
                
                it("No Data or Error Response Fetch Questions Present Alert") {
                    let viewModel = QuizViewModel(webservice: QuestionAPIMock(example: .noData))
                    sut = QuizViewController(viewModel: viewModel)
                    UIApplication.shared.windows.first?.rootViewController = sut
                    sut.loadView()
                    sut.fetchQuestions()
                    expect(sut.presentedViewController is UIAlertController).to(beTrue())
                    expect(sut.presentedViewController?.title).to(equal("Desculpe"))
                }
            }
        }
    }
}
