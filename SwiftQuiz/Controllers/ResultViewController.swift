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
    var totalCorrectAnswer = 0
    var totalQuestionsAnswer = 0

    // MARK: - IBOutlet
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var wrongAnswerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - View Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        correctAnswerLabel.text = "\(totalCorrectAnswer)"
        let wrongs = totalQuestionsAnswer - totalCorrectAnswer
        wrongAnswerLabel.text = "\(wrongs)"
        let score = totalCorrectAnswer*100/totalQuestionsAnswer
        scoreLabel.text = "\(score)%"
        restartButton.layer.cornerRadius = 15.0
    }
    
    // MARK: - IBAction
    @IBAction func restartActionButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
