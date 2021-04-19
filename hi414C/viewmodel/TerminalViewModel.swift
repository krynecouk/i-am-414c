//
//  TerminalViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class TerminalViewModel: ObservableObject {
    @Published private(set) var content: TerminalContent = []
    
    func setContent(_ content: TerminalContent) {
        self.content = content
    }
    
    func setContent(_ contentType: TerminalContentType) {
        self.content = [contentType]
    }
}

typealias TerminalContent = [TerminalContentType] // TODO

enum TerminalContentType {
    case asciiTest([Test])
    case asciiArt([ASCIIPrintable])
}
