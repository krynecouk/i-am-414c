//
//  TestViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

class TestViewModel: ObservableObject {
    @Published private(set) var result: TestSolution = .right
    private(set) var current: Testable?

    func setCurrent(test: Testable?) {
        current = test
    }
}
