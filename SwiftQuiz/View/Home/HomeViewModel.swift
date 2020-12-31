//
//  HomeViewModel.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 06/07/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    func quizViewController() -> QuizViewController
}

class HomeViewModel: HomeViewModelProtocol {
    
    func quizViewController() -> QuizViewController {
        let viewModel = QuizViewModel()
        let controller = QuizViewController(viewModel: viewModel)
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
    
}
