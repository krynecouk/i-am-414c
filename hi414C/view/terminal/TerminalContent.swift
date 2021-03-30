//
//  TerminalContent.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalContent: View {
    @EnvironmentObject var settingsVM: SettingsViewModel
    @State var activeTestId: String = ""
    
    var items: [TerminalContentItem]
    var testVM: TestViewModel

    init(_ items: [TerminalContentItem], testVM: TestViewModel) {
        self.items = items
        self.testVM = testVM
        testVM.setTest(test: nil)
    }
    
    var body: some View {
        Grid {
            ForEach(Array(items.enumerated()), id: \.element.id) { i, item in
                let delay = Double(i) * 1.5
                if case let .art(arts) = item.type {
                    ForEach(arts.indices) { i in
                        ASCIIArtView(arts[i], settings: settingsVM.asciiArt.withDelay(delay))
                    }
                }
                if case let .message(symbols) = item.type {
                    FigletView(symbols, settings: settingsVM.asciiMessage.figlet.withDelay(delay))
                }
                if case let .symbol(symbol) = item.type {
                    FigletView(symbol.rawValue, settings: settingsVM.asciiTest.symbol.figlet.withDelay(delay))
                }
                if case let .test(test, isCurrent) = item.type {
                    FigletView(test.test, settings: activeTestId == item.id.uuidString
                                ? settingsVM.asciiTest.test.active.figlet.withDelay(delay)
                                : settingsVM.asciiTest.test.passive.figlet.withDelay(delay))
                        .onAppear {
                            if isCurrent && testVM.test == nil {
                                testVM.setTest(test: test)
                                activeTestId = item.id.uuidString
                            }
                        }
                        .onTapGesture {
                            testVM.setTest(test: test)
                            activeTestId = item.id.uuidString
                        }
                }
            }
        }
    }
}

struct TerminalContentItem: Identifiable {
    var id = UUID()
    var type: TerminalContentType
    
    init(_ type: TerminalContentType) {
        self.type = type
    }
}

enum TerminalContentType {
    case symbol(ASCIISymbol)
    case test(Testable, Bool)
    case message([ASCIISymbol])
    case art([ASCIIPrintable])
}

struct TerminalContent_Previews: PreviewProvider {
    static var previews: some View {
        TerminalContent([
            TerminalContentItem(.symbol(.H)),
            TerminalContentItem(.test(Tests[.I][0], true))
        ], testVM: TestViewModel())
        .withEnvironment()
    }
}
