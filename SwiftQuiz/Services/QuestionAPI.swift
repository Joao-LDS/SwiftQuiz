//
//  QuestionAPI.swift
//  SwiftQuiz
//
//  Created by João on 03/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation
import Alamofire

class QuestionAPI {
    
    let url = "https://swiftquiz-app.herokuapp.com/question"

    func request(onComplete: @escaping ([Question]) -> Void) {
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print("Sucess to making the request.")
                // Casting JSON type Any to Dictionary.
                guard let dicts = value as? [[String:Any]] else { return }
                // Casting Dictionary to Array
                var array: [Question] = []
                for dict in dicts {
                    guard let questionValue = dict["question"] as? String else { return }
                    guard let optionsValue = dict["options"] as? [String] else { return }
                    guard let correctAnswerValue = dict["correctAnswer"] as? String else { return }
                    let question = Question(question: questionValue, options: optionsValue, correctAnswer: correctAnswerValue)
                    array.append(question)
                }
                onComplete(array)
            case .failure(let error):
                print("Request error: \(error)")
                onComplete([])
            }
        }
    }
}
