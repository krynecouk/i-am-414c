//
//  TerminalGrid.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.04.2021.
//

import SwiftUI

struct TerminalGrid: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @State var figletTheme: FigletTheme = FigletTheme()
    @State var withAnimation = true
    
    let elements: [TerminalGridElement]
    
    init(_ elements: [TerminalGridElement]) {
        self.elements = elements
    }
    
    var body: some View {
        GeometryReader { metrics in
            Grid {
                ForEach(Array(elements.enumerated()), id: \.offset) { idx, element in
                    if case let .ascii(symbol) = element {
                        ASCIIFiglet(of: symbol, idx: idx, frame: metrics.frame(in: .global), theme: themeVM.ascii.test.symbol.figlet)
                    }
                    if case let .bin(symbol) = element {
                        FigletView(symbol)
                    }
                    if case let .hex(symbol) = element {
                        FigletView(symbol)
                    }
                    if case let .op(symbol) = element {
                        FigletView(symbol)
                    }
                    if case let .message(symbol) = element {
                        FigletView(symbol)
                    }
                }
            }
            .onAppear {
                self.figletTheme = themeVM.ascii.test.symbol.figlet
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        SwiftUI.withAnimation(Animation.linear.speed(0.3)) {
                            self.figletTheme = FigletTheme(
                                view: ViewTheme(
                                    color: Color.primary.opacity(0.2)
                                ),
                                animations: []
                            )
                        }
                    }
            )
        }
    }
    
    func FooGrid() {
        
    }
    
    func ASCIIFiglet(of symbol: ASCIISymbol, idx: Int, frame: CGRect, theme: FigletTheme) -> some View {
        FigletView(symbol, theme: self.figletTheme.withDelay(getDelay(frame: frame, idx: idx)))
        
    }
    
    func getDelay(frame: CGRect, idx: Int) -> Double {
        Double(getRow(frame: frame, idx: idx)) + 0.5
    }
    
    func getRow(frame: CGRect, idx: Int) -> Int {
        let cols = frame.size.width / 80
        return Int((CGFloat(idx + 1) / cols))
    }
}

enum TerminalGridElement {
    case ascii(ASCIISymbol)
    case bin(ASCIISymbol)
    case hex(ASCIISymbol)
    case op(ASCIISymbol)
    case message(ASCIISymbol)
}

struct TerminalGrid_Previews: PreviewProvider {
    static var previews: some View {
        TerminalGrid([.ascii(.A)])
    }
}
