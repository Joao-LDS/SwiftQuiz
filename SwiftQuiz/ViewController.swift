//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 01/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var shadowImg: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadowImg.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }


}

