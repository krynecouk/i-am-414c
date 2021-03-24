//
//  SettingsViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var asciiTest: ASCIITestSettings
    @Published var asciiArt: ASCIIArtSettings
    @Published var asciiMessage: ASCIIMessageSettings
    
    var defaultAsciiTestSettings: ASCIITestSettings = ASCIITestSettings(
        symbol: ASCIITestSettings.SymbolSettings(
            figlet: FigletSettings(
                view: ViewSettings(
                    opacity: 1,
                    font: (name: .terminus, size: 13),
                    color: Color("Primary")
                ),
                animations: [.print(dt: 0.3), .shake(dt: 0.8, force: 1, .wave)]
            )
        ),
        test: ASCIITestSettings.TestSettings(
            active: ASCIITestSettings.TestSettings.Active(
                figlet: FigletSettings(
                    view: ViewSettings(
                        opacity: 1,
                        font: (name: .terminus, size: 13),
                        color: Color("Primary")
                    ),
                    animations: [.print(dt: 0.3), .shake(dt: 0.8, force: 1, .wave)]
                )
            ),
            passive: ASCIITestSettings.TestSettings.Passive(
                figlet: FigletSettings(
                    view: ViewSettings(
                        opacity: 1,
                        font: (name: .terminus, size: 13),
                        color: Color("Primary")
                    ),
                    animations: [.print(dt: 0.3), .shake(dt: 0.8, force: 1, .wave)]
                )
            )
        )
    )

    var defaultAsciiArtSettings: ASCIIArtSettings = ASCIIArtSettings(
        view: ViewSettings(
            opacity: 1,
            font: (name: .terminus, size: 13),
            color: Color("Primary")
        ),
        animations: [.print(dt: 0.3), .shake(dt: 0.8, force: 1, .wave)]
    )
    
    var defaultAsciiMessageSettings: ASCIIMessageSettings = ASCIIMessageSettings(
        figlet: FigletSettings(
            view: ViewSettings(
                opacity: 1,
                font: (name: .terminus, size: 13),
                color: Color("Primary")
            ),
            animations: [.print(dt: 0.3), .shake(dt: 0.8, force: 1, .wave)]
        )
    )
    
    init() {
        self.asciiTest = defaultAsciiTestSettings
        self.asciiArt = defaultAsciiArtSettings
        self.asciiMessage = defaultAsciiMessageSettings
    }
    
    enum SettingsType {
        case asciiTest, asciiArt, asciiMessage
    }
    
    func reset(of type: SettingsType) {
        switch type {
        case .asciiTest:
            self.asciiTest = defaultAsciiTestSettings
        case .asciiArt:
            self.asciiArt = defaultAsciiArtSettings
        case .asciiMessage:
            self.asciiMessage = defaultAsciiMessageSettings
        }
    }
}
