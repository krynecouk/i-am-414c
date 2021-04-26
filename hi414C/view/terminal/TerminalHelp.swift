//
//  TerminalHelp.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.04.2021.
//

import SwiftUI

struct TerminalHelp: View {
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var historyVM: HistoryViewModel

    var items: [TerminalItem]
    
    init(items: [TerminalItem]) {
        print("TerminalGrid")
        self.items = items
    }
    
    var body: some View {
        ZStack {
            FigletView("X", theme: FigletTheme(
                        view: ViewTheme(
                            color: .white
                        )
            ))
            .onTapGesture {
                uiVM.isHelp = false
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color.primary)

    }
}
