//
//  TestViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

import SwiftUI

class TestViewModel: ObservableObject {
    @Published private(set) var current: ASCIITest?
    
    func setCurrent(test: ASCIITest) {
        print("setting new test as current: ", test.test)
        self.current = test
    }
}
