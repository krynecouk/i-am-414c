//
//  ContentViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published private(set) var content: ContentType = .asciiTest([])
    
    func setContent(_ content: ContentType) {
        self.content = content
    }
}

enum ContentType {
    case asciiTest([ASCIISymbol])
    case asciiArt(ASCIIArt)
}
