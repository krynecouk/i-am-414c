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
    @ObservedObject var settingsVM: SettingsViewModel
    @ObservedObject var testVM: TestViewModel
    @ObservedObject var graphVM: GraphViewModel
    
    init(
        asciiVM: ASCIIViewModel = ASCIIViewModel(),
        contentVM: ContentViewModel = ContentViewModel(),
        keyboardVM: KeyboardViewModel = KeyboardViewModel(),
        settingsVM: SettingsViewModel = SettingsViewModel(),
        testVM: TestViewModel = TestViewModel())
    {
        self.asciiVM = asciiVM
        self.contentVM = contentVM
        self.keyboardVM = keyboardVM
        self.settingsVM = settingsVM
        self.testVM = testVM
        self.graphVM = GraphViewModel(toolkit: GraphToolkit(
            asciiVM: asciiVM, contentVM: contentVM, keyboardVM: keyboardVM, settingsVM: settingsVM, testVM: testVM
        ))
    }
    
    func body(content: Content) -> some View {
        content
            .environmentObject(asciiVM)
            .environmentObject(contentVM)
            .environmentObject(graphVM)
            .environmentObject(keyboardVM)
            .environmentObject(settingsVM)
            .environmentObject(testVM)
    }
}

extension View {
    func withEnvironment() -> some View {
        self.modifier(EnvironmentModifier())
    }
}
