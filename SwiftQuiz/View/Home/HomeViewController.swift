//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 01/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel: HomeViewModel
    var uiview: HomeView
    
    // MARK: - Init
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        uiview = HomeView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func loadView() {
        self.view = uiview
    }
    
    // MARK: - Functions
    
    func configureView() {
        uiview.button.addTarget(self, action: #selector(self.handleButton), for: .touchUpInside)
    }
    
    // MARK: - Selector
    
    @objc func handleButton() {
        let viewModel = QuizViewModel()
        let controller = QuizViewController(viewModel: viewModel)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
}
