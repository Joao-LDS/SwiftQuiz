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
            
            context("QuizViewModelProtocol") {
                it("Verify QuizViewModelProtocol") {
                    sut = QuizViewModel()
                    expect(sut).to(beAKindOf(QuizViewModelProtocol.self))
                }
            }
            
            context("Increase Number os Questions") {
                sut = QuizViewModel()
                sut.increaseNumberOfQuestions()
                expect(sut.numberOfQuestions).to(equal(1))
            }
        }
    }

}
