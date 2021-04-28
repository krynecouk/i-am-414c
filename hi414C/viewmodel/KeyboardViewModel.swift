//
//  KeyboardViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.03.2021.
//

import SwiftUI

class KeyboardViewModel: ObservableObject {
    @Published private(set) var input: String = ""
    @Published private(set) var keyboardSize: Size = (.infinity, 200)

    
    func append(_ input: String) {
        self.input += input
    }
    
    func delete() {
        self.input = ""
    }
    
    func backspace() {
        self.input = String(input.dropLast())
    }
    
    func setKeyboardSize(_ size: Size) {
        self.keyboardSize = size
    }

}
