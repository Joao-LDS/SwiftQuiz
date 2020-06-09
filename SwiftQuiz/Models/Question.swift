//
//  File.swift
//  SwiftQuiz
//
//  Created by João on 03/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation

class Question {
    
    let question: String
    let options: [String]
    let correctAnswer: String
    
    init(_ question: String,_ options: [String],_ correctAnswer: String) {
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }

}

