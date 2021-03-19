//
//  EnvironmentModifier.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct EnvironmentModifier: ViewModifier {
    @StateObject var graphVM = GraphViewModel()
    @StateObject var asciiVM = ASCIIViewModel()
    @StateObject var keyboardVM = KeyboardInput()
    
    func body(content: Content) -> some View {
        content
            .environmentObject(graphVM)
            .environmentObject(asciiVM)
            .environmentObject(keyboardVM)
    }
}

extension View {
    func withEnvironment() -> some View {
        self.modifier(EnvironmentModifier())
    }
}
