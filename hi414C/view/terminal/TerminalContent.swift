//
//  TerminalContent.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalContent: View {
    var items: [TerminalContentItem]
    var testVM: TestViewModel
    
    init(_ types: [TerminalContentType], testVM: TestViewModel) {
        self.init(types.map { TerminalContentItem(type: $0)}, testVM: testVM)
    }
    
    init(_ items: [TerminalContentItem], testVM: TestViewModel) {
        self.items = items
        self.testVM = testVM
        testVM.setCurrent(test: nil)
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
                            if isCurrent && testVM.current == nil {
                                testVM.setCurrent(test: test)
                            }
                        }
                        .onTapGesture {
                            testVM.setCurrent(test: test)
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
        ], testVM: TestViewModel())
    }
}
