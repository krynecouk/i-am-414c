//
//  ASCIITestGrid.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct ASCIITestGrid: View {
    var items: [ElementItem]
    
    init(_ elements: [Element]) {
        self.items = elements.map { ElementItem(type: $0)}
        Tests.setCurrent(test: nil)
    }
    
    var body: some View {
        Grid {
            ForEach(items) { item in
                if case let .ascii(symbol) = item.type {
                    FigletBanner(symbol.rawValue)
                }
                if case let .test(test, isCurrent) = item.type {
                    FigletBanner(test.test)
                        .onAppear {
                            if isCurrent && Tests.current == nil {
                                print("setting current test from symbol: ", test.symbol)
                                Tests.setCurrent(test: test)
                            }
                        }
                        .onTapGesture {
                            Tests.setCurrent(test: test)
                        }
                }
            }
        }
    }
}

enum Element {
    case ascii(ASCIISymbol)
    case test(Testable, Bool)
}

struct ElementItem: Identifiable {
    var id = UUID()
    var type: Element
}

struct ASCIIGrid_Previews: PreviewProvider {
    static var previews: some View {
        ASCIITestGrid([
            .ascii(.H),
            .test(ASCIITests[.I]![0], true)
        ])
    }
}
