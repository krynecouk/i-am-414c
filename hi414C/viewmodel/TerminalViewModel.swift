//
//  TerminalViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class TerminalViewModel: ObservableObject {
    @Published private(set) var content: [TerminalContentType] = []
    
    func setContent(_ content: [TerminalContentType]) {
        self.content = content
    }
    
    func setContent(_ content: TerminalContentType) {
        self.content = [content]
    }
}

enum TerminalContentType {
    case test([Test])
}
