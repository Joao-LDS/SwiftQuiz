//
//  HomeViewControllerTests.swift
//  SwiftQuizTests
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftQuiz

class HomeViewModelMock: HomeViewModelProtocol {
    
    var startQuizButtonTapped = false
    
    func quizViewController() -> QuizViewController {
        startQuizButtonTapped = true
        return QuizViewController(viewModel: QuizViewModel())
    }
    
}

class HomeViewControllerTests: QuickSpec {
    
    override func spec() {
        describe("HomeViewController") {
            
            var sutViewModelMock: HomeViewModelMock!
            var sut: HomeViewController!
            
            beforeEach {
                sutViewModelMock = HomeViewModelMock()
                sut = HomeViewController(viewModel: sutViewModelMock)
            }
            
            context("Actions") {
                it("Start Quiz Button Tap") {
                    sut.handleButton()
                    expect(sutViewModelMock.startQuizButtonTapped).to(beTrue())
                }
            }
        }
    }

}
