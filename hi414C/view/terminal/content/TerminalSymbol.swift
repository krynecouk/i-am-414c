//
//  TerminalSymbol.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.05.2021.
//

import SwiftUI

struct TerminalSymbol: View {
    @State var bloom: Bool = false
    @State var shadow: Bool = false
    
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
        FigletView([symbol], theme: active ? theme : theme.withAnimation([]), shadow: self.shadow)
            .opacity(bloom ? 1 : 0.15)
            .onAppear {
                if active {
                    self.bloom = true
                    self.shadow = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.bloom = false
                            self.shadow = false
                        }
                    }
                } else {
                    self.bloom = false
                    self.shadow = false
                }
            }
    }
    
    public static func id(from test: Test) -> String {
        "\(test.id.uuidString)\(test.symbol.rawValue)"
    }
}
