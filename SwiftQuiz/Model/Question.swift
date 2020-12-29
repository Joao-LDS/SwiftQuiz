//
//  File.swift
//  SwiftQuiz
//
//  Created by João on 03/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation

struct Question: Decodable {
    let question: String
    let options: [String]
    let correctAnswer: String
    let _id: String
}

