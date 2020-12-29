//
//  HomeViewControllerTests.swift
//  SwiftQuizTests
//
//  Created by João Luis Santos on 29/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import XCTest
@testable import SwiftQuiz

class HomeViewControllerTests: XCTestCase {
    
    var viewControllerUnderTest: HomeViewController!

    override func setUp() {
        super.setUp()
        let viewModel = HomeViewModel()
        viewControllerUnderTest = HomeViewController(viewModel: viewModel)
        viewControllerUnderTest.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewControllerUnderTest = nil
        super.tearDown()
    }

    func testButtonActionWhenTapped() throws {
        let button = viewControllerUnderTest.uiview.button
        guard let actions = button.actions(forTarget: viewControllerUnderTest, forControlEvent: .touchUpInside) else {
            XCTFail("Button doesn't have actions")
            return
        }
        XCTAssertTrue(actions.contains("handleButton"))
    }

}
