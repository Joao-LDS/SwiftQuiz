//
//  QuestionAPI.swift
//  SwiftQuiz
//
//  Created by João on 03/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation
import Alamofire

enum QuestionAPIError {
    case errorResponse
    case noData
}

protocol QuestionAPIProtocol {
    func request(onComplete: @escaping (QuestionAPIError?, [Question]?) -> ())
}

class QuestionAPI: QuestionAPIProtocol {
    
    let url = "https://swiftquiz-app.herokuapp.com/question"

    func request(onComplete: @escaping (QuestionAPIError?, [Question]?) -> ()) {
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    onComplete(.noData, nil)
                    return
                }
                if let questions = try? JSONDecoder().decode([Question].self, from: data) {
                    onComplete(nil, questions)
                }
            case .failure(let error):
                print("Request error: \(error)")
                onComplete(.errorResponse, nil)
            }
        }
        
    }
}
