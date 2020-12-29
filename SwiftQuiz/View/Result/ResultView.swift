//
//  ResultView.swift
//  SwiftQuiz
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit
import Stevia

class ResultView: UIView {

    // MARK: - Properties
    
    lazy var stackViewCorrect: UIStackView = {
        let view = UIStackView()
        return view
    }()
    
    lazy var stackViewWrong: UIStackView = {
        let view = UIStackView()
        return view
    }()
    
    lazy var textCorrectLabel: CustomLabel = {
        let view = CustomLabel()
        return view
    }()
    
    lazy var numberOfCorrectLabel: CustomLabel = {
        let view = CustomLabel()
        return view
    }()
    
    lazy var textWrongLabel: CustomLabel = {
        let view = CustomLabel()
        return view
    }()
    
    lazy var numberOfWrongLabel: CustomLabel = {
        let view = CustomLabel()
        return view
    }()
    
    lazy var resultLabel: CustomLabel = {
        let view = CustomLabel()
        return view
    }()
    
    lazy var button: CustomButton = {
        let view = CustomButton()
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - ViewConfiguration

extension ResultView: ViewConfiguration {
    func buildView() {
        stackViewCorrect.addArrangedSubview(textCorrectLabel)
        stackViewCorrect.addArrangedSubview(numberOfCorrectLabel)
        stackViewWrong.addArrangedSubview(textWrongLabel)
        stackViewWrong.addArrangedSubview(numberOfWrongLabel)
        sv(
            stackViewCorrect,
            stackViewWrong,
            resultLabel,
            button
        )
    }
    
    func addConstraints() {
        layout(
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
        backgroundColor = .white
        
        stackViewCorrect.axis = .horizontal
        stackViewWrong.axis = .horizontal
        
        textCorrectLabel.text = "Perguntas corretas: "
        textCorrectLabel.font = UIFont.systemFont(ofSize: 24)
        
        numberOfCorrectLabel.textColor = .green
        numberOfCorrectLabel.font = UIFont.systemFont(ofSize: 22)
        
        textWrongLabel.text = "Perguntas erradas: "
        textWrongLabel.font = UIFont.systemFont(ofSize: 24)
        
        numberOfWrongLabel.textColor = .red
        numberOfWrongLabel.font = UIFont.systemFont(ofSize: 22)
        
        resultLabel.font = resultLabel.font.withSize(100)
        
        button.setTitle("Reiniciar", for: .normal)
    }
}
