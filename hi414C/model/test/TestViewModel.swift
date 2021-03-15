//
//  TestViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

import SwiftUI

class TestViewModel: ObservableObject {
    @Published private(set) var current: Testable?
    @Published private(set) var solved: [ASCIISymbol] = [] // TODO this needs to be persistentnly stored
    
    func setCurrent(test: Testable) {
        self.current = test
    }
    
    func solve(with answer: String) -> TestSolution {
        
    }
}
