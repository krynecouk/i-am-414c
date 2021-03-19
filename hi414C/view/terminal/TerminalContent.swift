//
//  TerminalContent.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalContent: View {
    var items: [TerminalContentItem]
    
    init(_ types: [TerminalContentType]) {
        self.init(types.map { TerminalContentItem(type: $0)})
    }
    
    init(_ items: [TerminalContentItem]) {
        self.items = items
        TestViewModel.setCurrent(test: nil)
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
                            if isCurrent && TestViewModel.current == nil {
                                TestViewModel.setCurrent(test: test)
                            }
                        }
                        .onTapGesture {
                            TestViewModel.setCurrent(test: test)
                        }
                }
            }
        }
    }
}

enum TerminalContentType {
    case ascii(ASCIISymbol)
    case test(Testable, Bool)
}

struct TerminalContentItem: Identifiable {
    var id = UUID()
    var type: TerminalContentType
}

struct TerminalContent_Previews: PreviewProvider {
    static var previews: some View {
        TerminalContent([
            .ascii(.H),
            .test(ASCIITests[.I]![0], true)
        ])
    }
}
