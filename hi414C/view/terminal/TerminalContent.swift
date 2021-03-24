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
    
    init(_ types: [TerminalContentType], testVM: TestViewModel) {
        self.init(types.map { TerminalContentItem(type: $0) }, testVM: testVM)
    }

    init(_ items: [TerminalContentItem], testVM: TestViewModel) {
        self.items = items
        self.testVM = testVM
        testVM.setTest(test: nil)
    }
    
    var body: some View {
        Grid {
            ForEach(items) { item in
                if case let .message(symbols) = item.type {
                    FigletView(symbols, settings: settingsVM.asciiMessage.figlet)
                }
                if case let .symbol(symbol) = item.type {
                    FigletView(symbol.rawValue, settings: settingsVM.asciiTest.symbol.figlet)
                }
                if case let .test(test, isCurrent) = item.type {
                    FigletView(test.test, settings: activeTestId == item.id.uuidString
                                ? settingsVM.asciiTest.test.active.figlet
                                : settingsVM.asciiTest.test.passive.figlet)
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
}

enum TerminalContentType {
    case symbol(ASCIISymbol)
    case test(Testable, Bool)
    case message([ASCIISymbol])
    case art(ASCIIArt)
}

struct TerminalContent_Previews: PreviewProvider {
    static var previews: some View {
        TerminalContent([
            .symbol(.H),
            .test(Tests[.I][0], true)
        ], testVM: TestViewModel())
        .withEnvironment()
    }
}
