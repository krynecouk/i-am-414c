//
//  UIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.04.2021.
//

import SwiftUI

class UIViewModel: ObservableObject {
    @Published var isDetail = false
    @Published var isHelp = false
    @Published private(set) var errors: Int = 0
    var current: ContentType = .test
    
    func shake() {
        self.errors += 1
    }
    
    func isWideScreen() -> Bool {
        UIScreen.main.bounds.width > 500
    }
}

enum ContentType {
    case message, test
}
