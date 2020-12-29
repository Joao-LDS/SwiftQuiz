//
//  CustomButtonOptions.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 01/07/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class CustomButtonOptions: UIButton {
    
    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - ViewConfiguration

extension CustomButtonOptions: ViewConfiguration {
    func buildView() { }
    
    func addConstraints() { }
    
    func additionalConfiguration() {
        layer.cornerRadius = 10
        backgroundColor = .white
        titleLabel?.font = UIFont(name: "MyriadSetPro-Text", size: 18)
        titleLabel?.numberOfLines = 2
        setTitleColor(UIColor().secondColor(), for: .normal)
        layer.shadowColor = UIColor().principalColor().cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
    }
    
}
