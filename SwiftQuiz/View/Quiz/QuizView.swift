//
//  QuizView.swift
//  SwiftQuiz
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit
import Stevia

class QuizView: UIView {
    
    // MARK: - Properties
    
    lazy var closeButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    lazy var imageViewCloseButton: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var questionLabel: CustomLabel = {
        let view = CustomLabel()
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var optionsButtons: [CustomButtonOptions] = {
        var buttons = [CustomButtonOptions()]
        for i in 0..<3 {
            let button = CustomButtonOptions()
            buttons.append(button)
        }
        return buttons
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

extension QuizView: ViewConfiguration {
    func buildView() {
        for button in optionsButtons {
            stackView.addArrangedSubview(button)
        }
        sv(
            closeButton.sv(
                imageViewCloseButton
            ),
            questionLabel,
            stackView
        )
    }
    
    func addConstraints() {
        layout(
            closeButton.size(50).left(20).top(20),
            imageViewCloseButton.size(30).centerInContainer(),
            "",
            questionLabel.height(50%).left(16).right(16),
            stackView.left(5%).right(5%).bottom(5%).height(40%)
        )
        for button in optionsButtons {
            button.Height == 20 % stackView.Height
        }
    }
    
    func additionalConfiguration() {
        backgroundColor = .white
        
        closeButton.layer.cornerRadius = 25
        closeButton.backgroundColor = UIColor().principalColor()
        
        imageViewCloseButton.image = UIImage(named: "back")
        
        questionLabel.text = "Carregando o quiz. Por favor aguarde..."
        questionLabel.numberOfLines = 0
        questionLabel.textColor = UIColor().principalColor()
        questionLabel.font = questionLabel.font.withSize(25)
        questionLabel.textAlignment = .center
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        
        for button in optionsButtons {
            button.setTitle("...", for: .normal)
        }
    }
    
}
