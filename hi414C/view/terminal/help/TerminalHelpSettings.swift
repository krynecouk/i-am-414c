//
//  TerminalHelpSettings.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.05.2021.
//

import SwiftUI

struct TerminalHelpSettings: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    var body: some View {
        if helpVM.current == .settings_font {
            Text("Settings screen")
        }
    }
}

