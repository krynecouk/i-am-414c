//
//  TerminalHelpSettings.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.05.2021.
//

import SwiftUI

struct TerminalHelpSettings: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var segueVM: SegueViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    var body: some View {
        if helpVM.current == .settings {
            VStack {
                Text("Font Settings")
                    .onTapGesture {
                        helpVM.settings = .font
                        segueVM.open(type: .settings)
                    }
                Text("Theme Settings")
                    .onTapGesture {
                        helpVM.settings = .theme
                        segueVM.open(type: .settings)
                    }
                Text("Hint Settings")
                    .onTapGesture {
                        helpVM.settings = .hint
                        segueVM.open(type: .settings)
                    }
                Text("Delete Settings")
                    .onTapGesture {
                        helpVM.settings = .delete
                        segueVM.open(type: .settings)
                    }
            }

        }
    }
}

