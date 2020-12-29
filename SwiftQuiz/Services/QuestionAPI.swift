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

    func request(onComplete: @escaping ([Question]?) -> Void) {
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                if let questions = try? JSONDecoder().decode([Question].self, from: data) {
                    onComplete(questions)
                }
            case .failure(let error):
                print("Request error: \(error)")
                onComplete(nil)
            }
        }
    }
}
