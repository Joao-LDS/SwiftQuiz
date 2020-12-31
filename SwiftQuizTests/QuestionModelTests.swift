//
//  QuestionModelTests.swift
//  SwiftQuizTests
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftQuiz

class QuestionModelTests: QuickSpec {
    
    override func spec() {
        describe("Question Model") {
            
            let decoder = JSONDecoder()
            
            context("Parse One Object") {
                
                var dataQuestion: Data!
                
                beforeEach {
                    let path = Bundle.main.path(forResource: "question", ofType: "json")
                    let url = URL(fileURLWithPath: path!)
                    dataQuestion = try? Data(contentsOf: url)
                }
                
                it("One Question Object") {
                    let item = try? decoder.decode(Question.self, from: dataQuestion)
                    expect(item).toNot(beNil())
                    expect(item?.question).to(equal("Quais desses é string?"))
                    expect(item?.correctAnswer).to(equal("\"Olá mundo\""))
                }
            }
            
            context("Parse Array's Object") {
                
                var dataQuestionArray: Data!
                
                beforeEach {
                    let path = Bundle.main.path(forResource: "array", ofType: "json")
                    let url = URL(fileURLWithPath: path!)
                    dataQuestionArray = try? Data(contentsOf: url)
                }
                
                it("One Question Object") {
                    let items = try? decoder.decode([Question].self, from: dataQuestionArray)
                    expect(items).toNot(beNil())
                    expect(items?.count).to(be(12))
                }
            }
        }
    }
    
}
