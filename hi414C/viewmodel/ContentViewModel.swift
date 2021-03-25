//
//  ContentViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published private(set) var content: Foo = []
    
    func setContent(_ content: Foo) {
        self.content = content
    }
    
    func setContent(_ contentType: ContentType) {
        self.content = [contentType]
    }
}

typealias Foo = [ContentType] // TODO

enum ContentType {
    case asciiTest([ASCIISymbol])
    case asciiArt([ASCIIPrintable])
}
