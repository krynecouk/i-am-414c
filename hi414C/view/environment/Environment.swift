//
//  EnvironmentModifier.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct EnvironmentModifier: ViewModifier {
    @ObservedObject var asciiVM: ASCIIViewModel
    @ObservedObject var contentVM: ContentViewModel
    @ObservedObject var keyboardVM: KeyboardViewModel
    @ObservedObject var testVM: TestViewModel
    @ObservedObject var themeVM: ThemeViewModel
    @ObservedObject var graphVM: GraphViewModel
    
    init(
        asciiVM: ASCIIViewModel = ASCIIViewModel(),
        contentVM: ContentViewModel = ContentViewModel(),
        keyboardVM: KeyboardViewModel = KeyboardViewModel(),
        themeVM: ThemeViewModel = ThemeViewModel(),
        testVM: TestViewModel = TestViewModel())
    {
        self.asciiVM = asciiVM
        self.contentVM = contentVM
        self.keyboardVM = keyboardVM
        self.themeVM = themeVM
        self.testVM = testVM
        self.graphVM = GraphViewModel(toolkit: GraphToolkit(
            asciiVM: asciiVM, contentVM: contentVM, keyboardVM: keyboardVM, testVM: testVM, themeVM: themeVM
        ))
    }
    
    func body(content: Content) -> some View {
        content
            .environmentObject(asciiVM)
            .environmentObject(contentVM)
            .environmentObject(graphVM)
            .environmentObject(keyboardVM)
            .environmentObject(testVM)
            .environmentObject(themeVM)
    }
}

extension View {
    func withEnvironment() -> some View {
        self.modifier(EnvironmentModifier())
    }
}
