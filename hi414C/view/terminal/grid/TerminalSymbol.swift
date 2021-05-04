//
//  TerminalSymbol.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.05.2021.
//

import SwiftUI

struct TerminalSymbol: View {
    @State var opacity: Double = 1
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
            .opacity(self.opacity)
            .bloom(active: bloom)
            .onAppear {
                if active {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.opacity = 0.2
                            self.bloom = false
                        }
                    }
                } else {
                    self.opacity = 0.2
                    self.bloom = false
                }
            }
    }
    
    public static func id(from test: Test) -> String {
        "\(test.id.uuidString)\(test.symbol.rawValue)"
    }
}
