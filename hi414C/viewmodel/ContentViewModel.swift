//
//  ContentViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published private(set) var content: ASCIIContent = []
    
    func setContent(_ content: ASCIIContent) {
        self.content = content
    }
    
    func setContent(_ contentType: ASCIIContentType) {
        self.content = [contentType]
    }
}

typealias ASCIIContent = [ASCIIContentType] // TODO



enum ASCIIContentType {
    case asciiTest([Test])
    case asciiArt([ASCIIPrintable])
}
