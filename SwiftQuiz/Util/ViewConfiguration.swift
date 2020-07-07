//
//  ViewConfiguration.swift
//  SwiftQuiz
//
//  Created by João Luis dos Santos on 30/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Foundation

protocol ViewConfiguration {
    func buildView()
    func addConstraints()
    func additionalConfiguration()
    func setupView()
}

extension ViewConfiguration {
    func setupView() {
        buildView()
        addConstraints()
        additionalConfiguration()
    }
}
