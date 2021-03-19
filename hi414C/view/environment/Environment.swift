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
    @StateObject var keyboardVM = KeyboardViewModel()
    @StateObject var testVM = TestViewModel()
    
    func body(content: Content) -> some View {
        content
            .environmentObject(graphVM)
            .environmentObject(asciiVM)
            .environmentObject(keyboardVM)
            .environmentObject(testVM)
    }
}

extension View {
    func withEnvironment() -> some View {
        self.modifier(EnvironmentModifier())
    }
}
