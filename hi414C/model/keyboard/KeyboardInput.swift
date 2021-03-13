//
//  KeyboardInput.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.03.2021.
//

import SwiftUI

class KeyboardInput: ObservableObject {
    @Published private(set) var value: String = ""
    
    func concat(with value: String) {
        print("adding \(value)")
        self.value += value
    }
    
    func update(with value: String) {
        print("updating \(value)")
        self.value = value
    }
    
    func delete() {
        print("removing \(value)")
        self.value = ""
    }
}
