//
//  ColSpan.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.04.2021.
//

import SwiftUI

struct ColSpan<Content: View>: View {    
    let span: Int
    let content: () -> Content
    
    init(span: Int = 1, @ViewBuilder content: @escaping () -> Content) {
        self.span = span
        self.content = content
    }
    
    var body: some View {
        content()
        
        ForEach(0 ..< self.span) { _ in
            Color.clear
        }
    }
}
