//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 01/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit
import Stevia

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var label = CustomLabel()
    
    private lazy var button = CustomButton()
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Selector
    
    @objc func handleButton() {
        let quiz = QuizViewController()
        present(quiz, animated: true, completion: nil)
    }
    
}

extension HomeViewController: ViewConfiguration {
    func buildView() {
        view.sv(
            imageView,
            label,
            button
        )
    }
    
    func addConstraints() {
        self.view.layout(
            imageView.centerHorizontally().top(10%).size(250),
            50,
            label.centerHorizontally(),
            "",
            button.right(5%).bottom(5%).left(5%).height(7%)
        )
    }
    
    func additionalConfiguration() {
        view.backgroundColor = .white
        
        button.setTitle("Iniciar", for: .normal)
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        
        imageView.image = UIImage(named: "logo")
        imageView.layer.shadowColor = UIColor().principalColor().cgColor
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 5
        imageView.layer.shadowOpacity = 0.2
        
        label.text = "SwiftQuiz"
        label.font = label.font.withSize(45)
        
    }
    
}
