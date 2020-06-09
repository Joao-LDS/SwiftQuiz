//
//  QuestionManager.swift
//  SwiftQuiz
//
//  Created by João on 06/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation

class QuestionManager {

    var questions: [Question] = []
    var currencyQuestion: Question!
    var totalCorrectAnswer = 0
    var totalQuestionsAnswer = 0
    
    deinit {
        print("QuestionsManager deinit.")
    }
    
    func getQuestion() -> Question? {
        if !questions.isEmpty {
            let index = Int.random(in: 0..<questions.count)
            let question = self.questions[index]
            currencyQuestion = question
            questions.remove(at: index)
            return question
        } else {
            return nil
        }
    }
    
    func validate(_ index: Int) {
        totalQuestionsAnswer += 1
        let option = currencyQuestion.options[index]
        if option == currencyQuestion.correctAnswer {
            totalCorrectAnswer += 1
        }
    }
    
}
