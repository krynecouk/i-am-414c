//
//  KeyboardViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.03.2021.
//

import SwiftUI

class KeyboardViewModel: ObservableObject {
    static let prediction: Size = (.infinity, 64)

    @Published private(set) var input: String = ""
    
    func set(_ input: String) {
        self.input = input
    }
    
    func append(_ input: String) {
        self.input += input
    }
    
    func delete() {
        self.input = ""
    }
    
    func backspace() {
        self.input = String(input.dropLast())
    }
}
