//
//  TerminalHelpPadding.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 21.05.2021.
//

import SwiftUI

struct TerminalHelpPadding: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var segueVM: SegueViewModel
    
    var body: some View {
        Color.clear
            .frame(height: getHeight())
            .animation(.default)
    }
    
    func getHeight() -> CGFloat {
        var padding: CGFloat = 20
        if segueVM.isOpen {
            padding += segueVM.segue.height
        } else {
            if themeVM.hint {
                padding += ThemeViewModel.hint.height
            }
            padding += SegueViewModel.header.height
        }
        return padding
    }
}
