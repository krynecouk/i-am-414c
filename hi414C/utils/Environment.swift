//
//  Environment.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct Environment: ViewModifier {
    @StateObject var graphViewModel = GraphViewModel()
    @StateObject var asciiViewModel = ASCIIViewModel()
    
    func body(content: Content) -> some View {
        content
            .environmentObject(graphViewModel)
            .environmentObject(asciiViewModel)
    }
}

extension View {
    func withEnvironment() -> some View {
        self.modifier(Environment())
    }
}
