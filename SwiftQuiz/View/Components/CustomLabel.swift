//
//  CustomLabel.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 01/07/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomLabel: ViewConfiguration {
    func buildView() {
    }
    
    func addConstraints() {
    }
    
    func additionalConfiguration() {
        font = UIFont(name: "MyriadSetPro-Text", size: 16)
        textColor = UIColor().secondColor()
    }
    
    
}
