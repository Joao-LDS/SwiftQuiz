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
        fetchQuestions()
    }
    
    override func loadView() {
        self.view = uiview
    }
    
    // MARK: - Functions
    
    func fetchQuestions() {
        viewModel.fetchQuestions { sucess in
            if sucess == true {
                self.configureView()
                self.configureHandleButtons()
            } else {
                self.presentAlertWithError()
            }
        }
    }
    
    func configureView() {
        let setNewQuestions = viewModel.setCurrencyQuestion()
        if setNewQuestions == true {
            uiview.questionLabel.text = viewModel.question
            
            let options = viewModel.options
            for i in 0..<uiview.optionsButtons.count {
                uiview.optionsButtons[i].setTitle(options[i], for: .normal)
            }
        } else {
            presentResultViewController()
        }
    }
    
    func configureHandleButtons() {
        uiview.closeButton.addTarget(self, action: #selector(self.handleCloseButton), for: .touchUpInside)
        
        for i in 0..<uiview.optionsButtons.count {
            uiview.optionsButtons[i].addTarget(self, action: #selector(self.handleOption(_:)), for: .touchUpInside)
        }
    }
    
    func presentResultViewController() {
        let controller = viewModel.resultViewController()
        present(controller, animated: true, completion: nil)
    }
    
    func presentAlertWithError() {
        let alert = UIAlertController(title: "Desculpe", message: "Não foi possível carregar o quiz.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
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
