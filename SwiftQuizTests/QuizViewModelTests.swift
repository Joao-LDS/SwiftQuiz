//
//  QuizViewModelTests.swift
//  SwiftQuizTests
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftQuiz

class QuizViewModelTests: QuickSpec {

    override func spec() {
        describe("QuizViewModel") {
            
            var sut: QuizViewModel!
            
            context("QuizViewModel") {
                it("Return Object Result And Number Of Question") {
                    sut = QuizViewModel()
                    sut.correctAnswer = 9
                    sut.wrongAnswer = 3
                    let result = sut.returnObjectResult()
                    expect(result.correctAnswers).to(equal(9))
                    expect(result.wrongAnswers).to(equal(3))
                    expect(result.numberOfQuestions).to(equal(12))
                }
            }
            
            context("QuizViewModelProtocol") {
                it("Verify QuizViewModelProtocol") {
                    sut = QuizViewModel()
                    expect(sut).to(beAKindOf(QuizViewModelProtocol.self))
                }
            }
            
            context("QuizViewModelProtocol") {
                it("Sucess") {
                    sut = QuizViewModel(webservice: QuestionAPIMock(example: .sucess))
                    sut.fetchQuestions { _ in
                        expect(sut.example).to(equal("Sucess"))
                    }
                }
                
                it("With No Data") {
                    sut = QuizViewModel(webservice: QuestionAPIMock(example: .noData))
                    sut.fetchQuestions { _ in
                        expect(sut.example).to(equal("No Data"))
                    }
                }
                
                it("With Error Response") {
                    sut = QuizViewModel(webservice: QuestionAPIMock(example: .errorResponse))
                    sut.fetchQuestions { _ in
                        expect(sut.example).to(equal("Error Response"))
                    }
                }
            }
            
        }
    }

}
