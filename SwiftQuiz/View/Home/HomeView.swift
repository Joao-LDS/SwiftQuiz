//
//  HomeView.swift
//  SwiftQuiz
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit
import Stevia

class HomeView: UIView {

    // MARK: - Properties
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var label: CustomLabel = {
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

extension HomeView: ViewConfiguration {
    func buildView() {
        sv(
            imageView,
            label,
            button
        )
    }
    
    func addConstraints() {
        layout(
            imageView.centerHorizontally().top(10%).size(250),
            50,
            label.centerHorizontally(),
            "",
            button.right(5%).bottom(5%).left(5%).height(7%)
        )
    }
    
    func additionalConfiguration() {
        backgroundColor = .white
        
        button.setTitle("Iniciar", for: .normal)
        
        imageView.image = UIImage(named: "logo")
        imageView.layer.shadowColor = UIColor().principalColor().cgColor
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 5
        imageView.layer.shadowOpacity = 0.2
        
        label.text = "SwiftQuiz"
        label.font = label.font.withSize(45)
        
    }
    
}
