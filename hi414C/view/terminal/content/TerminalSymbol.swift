//
//  TerminalSymbol.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.05.2021.
//

import SwiftUI

struct TerminalSymbol: View {
    @State var bloom: Bool = true
    
    let symbol: ASCIISymbol
    let theme: FigletTheme
    let active: Bool
    
    init(_ symbol: ASCIISymbol, active: Bool, theme: FigletTheme) {
        print("TerminalSymbol")
        self.symbol = symbol
        self.active = active
        self.theme = theme
    }
    
    var body: some View {
        FigletView(symbol.rawValue, theme: active ? theme : theme.withAnimation([]))
            .opacity(bloom ? 1 : 0.2)
            //.bloom(color: theme.view.color, active: bloom, radius: 3)
            .onAppear {
                if active {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.bloom = false
                        }
                    }
                } else {
                    self.bloom = false
                }
            }
    }
    
    public static func id(from test: Test) -> String {
        "\(test.id.uuidString)\(test.symbol.rawValue)"
    }
}
