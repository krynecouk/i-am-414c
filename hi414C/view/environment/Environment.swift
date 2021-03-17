//
//  EnvironmentModifier.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct EnvironmentModifier: ViewModifier {
    @StateObject var graphViewModel = GraphViewModel()
    @StateObject var asciiViewModel = ASCIIViewModel()
    @StateObject var keyboardInput = KeyboardInput()
    
    func body(content: Content) -> some View {
        content
            .environmentObject(graphViewModel)
            .environmentObject(asciiViewModel)
            .environmentObject(keyboardInput)
    }
}

extension View {
    func withEnvironment() -> some View {
        self.modifier(EnvironmentModifier())
    }
}
