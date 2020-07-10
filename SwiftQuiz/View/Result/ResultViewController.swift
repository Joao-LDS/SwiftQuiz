//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by João on 03/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit
import Stevia

class ResultViewController: UIViewController {
   
    // MARK: - Properties
    
    private lazy var stackViewCorrect = UIStackView()
    private lazy var stackViewWrong = UIStackView()
    private lazy var textCorrectLabel = CustomLabel()
    private lazy var numberOfCorrectLabel = CustomLabel()
    private lazy var textWrongLabel = CustomLabel()
    private lazy var numberOfWrongLabel = CustomLabel()
    private lazy var resultLabel = CustomLabel()
    private lazy var button = CustomButton()
    private var viewModel: ResultViewModel
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Init
    
    init(viewModel: ResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selector
    
    @objc func handleButton() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ResultViewController: ViewConfiguration {
    func buildView() {
        stackViewCorrect.addArrangedSubview(textCorrectLabel)
        stackViewCorrect.addArrangedSubview(numberOfCorrectLabel)
        stackViewWrong.addArrangedSubview(textWrongLabel)
        stackViewWrong.addArrangedSubview(numberOfWrongLabel)
        view.sv(
            stackViewCorrect,
            stackViewWrong,
            resultLabel,
            button
        )
    }
    
    func addConstraints() {
        self.view.layout(
            stackViewCorrect.left(10%).top(20%),
            "",
            stackViewWrong.left(10%).top(25%),
            "",
            resultLabel.centerInContainer(),
            "",
            button.right(5%).bottom(5%).left(5%).height(7%)
        )
    }
    
    func additionalConfiguration() {
        view.backgroundColor = .white
        
        stackViewCorrect.axis = .horizontal
        stackViewWrong.axis = .horizontal
        
        setConfigurationLabel(text: "Perguntas corretas: ", number: viewModel.getCorrectAnswer(), textLabel: textCorrectLabel, numberLabel: numberOfCorrectLabel, size: 24, color: UIColor.green)
        setConfigurationLabel(text: "Perguntas erradas: ", number: viewModel.getWrongAnswer(), textLabel: textWrongLabel, numberLabel: numberOfWrongLabel, size: 24, color: UIColor.red)
        
        resultLabel.text = "\(viewModel.getResult())%"
        resultLabel.font = resultLabel.font.withSize(100)
        
        button.setTitle("Reiniciar", for: .normal)
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
    }
    
    private func setConfigurationLabel(text: String, number: Int, textLabel: CustomLabel, numberLabel: CustomLabel, size: CGFloat, color: UIColor) {
        textLabel.text = text
        textLabel.font = textLabel.font.withSize(size)
        numberLabel.text = "\(number)"
        numberLabel.textColor = color
        numberLabel.font = numberLabel.font.withSize(size)
    }
    
}
