//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by João on 03/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var questionManager: QuestionManager?
    
    // MARK: - IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var optionsButtons: [UIButton]!
    
    // MARK: - View Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in optionsButtons {
            button.layer.cornerRadius = 15.0
            button.layer.shadowColor = UIColor(named: "principal_color")?.cgColor
            button.layer.shadowOffset = .zero
            button.layer.shadowOpacity = 0.2
            button.layer.shadowRadius = 5.0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        questionManager = QuestionManager() // New object of QuestionManager() always view will appear.
        QuestionAPI().request { questions in
            if !questions.isEmpty {
                self.questionManager!.questions = questions
                print("Closure executed.")
                self.showQuestion()
            } else {
                let alert = UIAlertController(title: "Desculpe 😕", message: "Desculpe 😕", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultViewController = segue.destination as? ResultViewController else { return }
        resultViewController.totalCorrectAnswer = questionManager!.totalCorrectAnswer
        resultViewController.totalQuestionsAnswer = questionManager!.totalQuestionsAnswer
    }

    // MARK: - IBAction
    @IBAction func selectAnswer(_ sender: UIButton) {
        guard let index = optionsButtons.firstIndex(of: sender) else { return } // Recover index of button selected
        questionManager!.validate(index)
        showQuestion()
    }

    // MARK: - Func's
    func showQuestion() {
        if let question = questionManager!.getQuestion() {
            questionLabel.text = question.question
            for i in 0..<question.options.count {
                let option = question.options[i]
                let button = optionsButtons[i]
                button.setTitle(option, for: .normal)
            }
        } else {
            showResultView()
        }
    }
    
    func showResultView() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    

    
}
