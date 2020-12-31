//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by João on 03/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
   
    // MARK: - Properties
    
    let viewModel: ResultViewModelProtocol
    var uiview: ResultView
    
    // MARK: - Init
    
    init(viewModel: ResultViewModel) {
        self.viewModel = viewModel
        uiview = ResultView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func loadView() {
        self.view = uiview
    }
    
    // MARK: - Functions
    
    func configureView() {
        uiview.button.addTarget(self, action: #selector(self.handleButton), for: .touchUpInside)
        uiview.numberOfCorrectLabel.text = "\(viewModel.correctAnswers)"
        uiview.numberOfWrongLabel.text = "\(viewModel.wrongAnswers)"
        uiview.resultLabel.text = "\(viewModel.getResult())%"
        uiview.button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
    }
    
    // MARK: - Selector
    
    @objc func handleButton() {
        dismiss(animated: true, completion: nil)
    }
    
}
