//
//  CustomButton.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 30/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomButton: ViewConfiguration {
    func buildView() { }
    
    func addConstraints() { }
    
    func additionalConfiguration() {
        titleLabel?.font = UIFont.init(name: "MyriadSetPro-Text", size: 35)
        backgroundColor = UIColor().principalColor()
        layer.cornerRadius = 5.0
    }
    
}
