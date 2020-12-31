//
//  HomeViewModelTests.swift
//  SwiftQuizTests
//
//  Created by João Luis Santos on 31/12/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftQuiz

class HomeViewModelTests: QuickSpec {
    
    override func spec() {
        describe("HomeViewModel") {
            
            var sut: HomeViewModel!
            
            beforeEach {
                sut = HomeViewModel()
            }
            
            // Garante que a HomeViewModel herde HomeViewModelProtocol
            context("HomeViewModelProtocol") {
                it("Verify HomeViewModelProtocol") {
                    expect(sut).to(beAKindOf(HomeViewModelProtocol.self))
                }
            }
        }
    }
    
}
