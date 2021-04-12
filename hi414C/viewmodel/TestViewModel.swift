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
            print("current test: ", test.test)
        }
        self.test = test
    }
    
    func solve(with value: String) -> TestResult {
        //if let test = self.test {
        if self.test != nil {
            print("BACHA TOHLE MUSIS OPRAVIT")
            //self.result = test.solve(with: value)
        } else {
            self.result = .wrong("No test was provided")
        }
        print("test solved with \(self.result)")
        return self.result
    }
}
