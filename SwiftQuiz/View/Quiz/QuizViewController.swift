//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by João on 03/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit
import Stevia

class QuizViewController: UIViewController {

    // MARK: - Properties
    
    private var webservice = QuestionAPI()
    private var viewModel: QuizViewModel!
    
    private lazy var label = CustomLabel()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private lazy var buttons: [CustomButtonOptions] = {
        var buttons = [CustomButtonOptions()]
        for i in 0..<3 {
            let button = CustomButtonOptions()
            buttons.append(button)
        }
        return buttons
    }()
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupViewModel()
    }

    // MARK: - Selector
    
    @objc func handleOption(_ sender: CustomButtonOptions) {
        guard let index = buttons.firstIndex(of: sender) else { return }
        viewModel.validateAnswer(at: index)
        updateQuiz()
    }
    
    // MARK: - Functions
    
    private func setQuestion() {
        label.text = self.viewModel.getQuestion()
    }
    
    private func setOptions() {
        let options = viewModel.getOptions()
        for i in 0..<buttons.count {
            buttons[i].setTitle(options?[i], for: .normal)
        }
    }
    
    private func setupViewModel() {
        self.viewModel = QuizViewModel()
        viewModel.delegate = self
        viewModel.fetchQuestions { sucess in
            if sucess {
                self.updateQuiz()
            }
        }
    }
    
    private func updateQuiz() {
        viewModel.setCurrencyQuestion()
        setQuestion()
        setOptions()
    }

}

extension QuizViewController: QuizViewModelDelegate {
    
    func presentResultViewController() {
        let result = Result(correct: viewModel.returnCorrectAnswer(), wrong: viewModel.returnWrongAnswer())
        let viewModel = ResultViewModel(result)
        let resultViewController = ResultViewController(viewModel: viewModel)
        resultViewController.modalPresentationStyle = .fullScreen
        self.present(resultViewController, animated: true, completion: nil)
    }

}

extension QuizViewController: ViewConfiguration {
    func buildView() {
        for i in 0..<buttons.count {
            stackView.addArrangedSubview(buttons[i])
        }
        view.sv(
            label,
            stackView
        )
    }
    
    func addConstraints() {
        view.layout(
            label.height(60%).left(16).right(16),
            stackView.left(5%).right(5%).bottom(5%).height(40%)
        )
        for button in buttons {
            button.Height == 20 % stackView.Height
        }
        
    }
    
    func additionalConfiguration() {
        view.backgroundColor = .white
        
        label.text = "Carregando o quiz. Por favor aguarde..."
        label.numberOfLines = 0
        label.textColor = UIColor(named: "principal_color")
        label.font = label.font.withSize(25)
        label.textAlignment = .center
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        
        for i in 0..<buttons.count {
            buttons[i].setTitle("...", for: .normal)
            buttons[i].addTarget(self, action: #selector(handleOption(_:)), for: .touchUpInside)
        }
    }
    
}
