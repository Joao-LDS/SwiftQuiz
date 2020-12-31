//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by João on 03/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    // MARK: - Properties
    
    var viewModel: QuizViewModelProtocol
    var uiview: QuizView
    
    // MARK: - Init
    
    init(viewModel: QuizViewModelProtocol) {
        self.viewModel = viewModel
        uiview = QuizView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func loadView() {
        self.view = uiview
    }
    
    // MARK: - Functions
    
    func setupViewModel() {
        viewModel.fetchQuestions { finish in
            if finish == true {
                self.configureView()
                self.configureButtonsOptionsTarget()
                self.viewModel.delegate = self
            }
        }
    }
    
    func configureView() {
        viewModel.setCurrencyQuestion()
        uiview.questionLabel.text = viewModel.question
        uiview.closeButton.addTarget(self, action: #selector(self.handleCloseButton), for: .touchUpInside)
        
        let options = viewModel.options
        for i in 0..<uiview.optionsButtons.count {
            uiview.optionsButtons[i].setTitle(options[i], for: .normal)
        }
    }
    
    func configureButtonsOptionsTarget() {
        for i in 0..<uiview.optionsButtons.count {
            uiview.optionsButtons[i].addTarget(self, action: #selector(self.handleOption(_:)), for: .touchUpInside)
        }
    }
    
    // MARK: - Selector
    
    @objc func handleOption(_ sender: CustomButtonOptions) {
        guard let index = uiview.optionsButtons.firstIndex(of: sender) else { return }
        viewModel.validateAnswer(at: index)
        configureView()
    }
    
    @objc func handleCloseButton() {
        dismiss(animated: true)
    }
    
}

// MARK: - QuizViewModelDelegate

extension QuizViewController: QuizViewModelDelegate {
    
    func presentResultViewController(With result: Result) {
        let controller = viewModel.resultViewController()
        present(controller, animated: true, completion: nil)
    }
}

