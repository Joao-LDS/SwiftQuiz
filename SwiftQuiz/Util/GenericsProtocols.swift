//
//  GenericsProtocols.swift
//  SwiftQuiz
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation

protocol QuizViewModelDelegate {
    func presentResultViewController(With result: Result)
}
