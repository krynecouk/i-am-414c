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
                typeface: .ansi(.regular),
                view: ViewSettings(
                    opacity: 1,
                    font: (name: .terminus, size: 13),
                    color: .gray
                ),
                animations: [.print(dt: 0.3, animation: .none)]
            )
        ),
        test: ASCIITestSettings.TestSettings(
            active: ASCIITestSettings.TestSettings.Active(
                figlet: FigletSettings(
                    typeface: .ansi(.regular),
                    view: ViewSettings(
                        opacity: 1,
                        font: (name: .terminus, size: 13),
                        color: Color("Primary")
                    ),
                    animations: [.print(dt: 0.3, animation: .none), .shake(dt: 0.8, force: 1, type: .rand)]
                )
            ),
            passive: ASCIITestSettings.TestSettings.Passive(
                figlet: FigletSettings(
                    typeface: .ansi(.regular),
                    view: ViewSettings(
                        opacity: 1,
                        font: (name: .terminus, size: 13),
                        color: .gray
                    ),
                    animations: [.print(dt: 0.3, animation: .none)]
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
        animations: [.print(dt: 0.3, animation: .linear), .shake(dt: 0.8, force: 1, type: .wave)]
    )
    
    var defaultAsciiMessageSettings: ASCIIMessageSettings = ASCIIMessageSettings(
        figlet: FigletSettings(
            typeface: .ansi(.shadow),
            view: ViewSettings(
                opacity: 1,
                font: (name: .terminus, size: 13),
                color: Color("Primary")
            ),
            animations: [.print(dt: 0.3, animation: .none), .shake(dt: 0.8, force: 1, type: .wave)]
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
