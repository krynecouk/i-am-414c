//
//  TerminalAnswer.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.04.2021.
//

import SwiftUI

typealias Answers = Set<String>

struct TerminalAnswer: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var themeVM: ThemeViewModel

    var body: some View {
        Text(helpVM.answer)
            .withTheme(themeVM.terminal.help.answer)
    }

}
