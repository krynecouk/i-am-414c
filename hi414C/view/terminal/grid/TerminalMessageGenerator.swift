//
//  TerminalMessageGenerator.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.04.2021.
//

import SwiftUI

typealias Answers = Set<String>

struct TerminalMessageGenerator: View {
    @EnvironmentObject var helpVM: HelpViewModel

    var body: some View {
        TerminalMessage(helpVM.answer, theme: FigletTheme())
    }

}
