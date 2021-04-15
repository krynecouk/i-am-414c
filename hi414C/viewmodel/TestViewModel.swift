//
//  TestViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

class TestViewModel: ObservableObject {
    @Published private(set) var test: Test? = .none
    @Published private(set) var result: TestResult = .right
    
    func setTest(test: Test?) {
        if let test = self.test {
            print("current test: ", test.equation.toString())
        }
        self.test = test
    }
    
    func solve(with value: String) -> TestResult {
        if let test = self.test {
            self.result = test.equation.result == UInt8(value) ? .right : .wrong("wrong result \(value)")
        } else {
            self.result = .wrong("No test was provided")
        }
        print("test solved with \(self.result)")
        return self.result
    }
}
