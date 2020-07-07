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
    
    private lazy var correctLabel = CustomLabel()
    
    private lazy var wrongLabel = CustomLabel()
    
    private lazy var resultLabel = CustomLabel()
    
    private lazy var button = CustomButton()

    
    // MARK: - View Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    
    // MARK: - IBAction
    
    
}

extension ResultViewController: ViewConfiguration {
    func buildView() {
        view.sv(
            correctLabel,
            wrongLabel,
            resultLabel,
            button
        )
    }
    
    func addConstraints() {
        self.view.layout(
            correctLabel.left(10%).top(20%),
            "",
            wrongLabel.left(10%).top(25%),
            "",
            resultLabel.centerInContainer(),
            "",
            button.right(5%).bottom(5%).left(5%).height(7%)
        )
    }
    
    func additionalConfiguration() {
        view.backgroundColor = .white
        correctLabel.text = "Perguntas corretas:"
//        correctLabel.backgroundColor = .brown
        wrongLabel.text = "Perguntas erradas:"
//        wrongLabel.backgroundColor = .cyan
        resultLabel.text = "100%"
//        resultLabel.backgroundColor = .blue
        resultLabel.font = resultLabel.font.withSize(70)
        
        button.setTitle("Reiniciar", for: .normal)
    }
    
    
}
