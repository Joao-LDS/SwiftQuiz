//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 01/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    // MARK: - View Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStart.layer.cornerRadius = 15.0
//        imgView.layer.cornerRadius = 25.0
//        imgView.layer.shadowColor = UIColor(named: "principal_color")?.cgColor
//        imgView.layer.shadowOffset = .zero
//        imgView.layer.shadowOpacity = 0.2
//        imgView.layer.shadowRadius = 15.0
    }
}

