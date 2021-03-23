//
//  SettingsViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var settings: Settings
    
    var `default`: Settings =
        Settings(
            content: ContentSettings(
                asciiArt: ASCIIArtSettings(ui: UISettings(), animations: [.print(), .shake()])
            ))
    
    init() {
        self.settings = `default`
    }
    
    func reset() {
        self.settings = `default`
    }
}
