//
//  TerminalCommandPredictive.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 21.07.2021.
//

import SwiftUI

struct TerminalCommandPredictive: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { reader in
            }
        }
        .frame(height: SegueViewModel.header.height)
        .background(themeVM.terminal.cli.view.background)
    }
}

struct TerminalCommandPredictive_Previews: PreviewProvider {
    static var previews: some View {
        TerminalCommandPredictive()
    }
}
