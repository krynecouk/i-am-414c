//
//  TerminalContent.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalContent: View {
    @EnvironmentObject var settingsVM: SettingsViewModel
    
    var items: [TerminalContentItem]
    var testVM: TestViewModel

    init(_ items: [TerminalContentItem], testVM: TestViewModel) {
        self.items = items
        self.testVM = testVM
        testVM.setTest(test: nil)
    }
    
    var body: some View {
        Grid {
            ForEach(items) { item in
                if case let .symbol(symbol) = item.type {
                    FigletView(symbol.rawValue, settings: settingsVM.asciiTest.symbol.figlet)
                }
                if case let .test(test, isCurrent) = item.type {
                    FigletView(test.test, settings: settingsVM.asciiTest.test.active.figlet)
                        .onAppear {
                            if isCurrent && testVM.test == nil {
                                testVM.setTest(test: test)
                            }
                        }
                        .onTapGesture {
                            testVM.setTest(test: test)
                        }
                }
            }
        }
    }
}

enum TerminalContentType {
    case symbol(ASCIISymbol)
    case test(Testable, Bool)
    case message([ASCIISymbol])
    case art(ASCIIArt)
}

struct TerminalContentItem: Identifiable {
    var id = UUID()
    var type: TerminalContentType
}

struct TerminalContent_Previews: PreviewProvider {
    static var previews: some View {
        TerminalContent([
            TerminalContentItem(type: .symbol(.H)),
            TerminalContentItem(type: .test(Tests[.I][0], true))
        ], testVM: TestViewModel())
        .withEnvironment()
    }
}
