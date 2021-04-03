//
//  TerminalContent.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalContent: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @State var activeTestId: String = ""
    
    var items: [TerminalContentItem]
    var testVM: TestViewModel

    init(_ types: [TerminalContentType], testVM: TestViewModel) {
        self.items = types.map { TerminalContentItem($0) }
        self.testVM = testVM
        testVM.setTest(test: nil)
    }
    
    var body: some View {
        Grid {
            ForEach(Array(items.enumerated()), id: \.element.id) { i, item in
                let delay = Double(i) * 1.5
                if case let .art(arts) = item.type {
                    ASCIIArtViews(arts, delay: delay)
                }
                if case let .message(symbols) = item.type {
                    FigletView(symbols, theme: themeVM.ascii.message.figlet.withDelay(delay))
                }
                if case let .symbol(symbol) = item.type {
                    FigletView(symbol.rawValue, theme: themeVM.ascii.test.symbol.figlet.withDelay(delay))
                }
                if case let .test(test, isCurrent) = item.type {
                    TestFigletView(id: item.id.uuidString, test: test, isCurrent: isCurrent, delay: delay)
                }
            }
        }
    }
    
    func ASCIIArtViews(_ arts: [ASCIIPrintable], delay: Double) -> some View {
        ForEach(arts.indices) { i in
            ASCIIArtView(arts[i], theme: themeVM.ascii.art.withDelay(delay))
        }
    }
    
    func TestFigletView(id: String, test: Testable, isCurrent: Bool, delay: Double) -> some View {
        FigletView(test.test, theme: activeTestId == id
                    ? themeVM.ascii.test.test.active.figlet.withDelay(delay)
                    : themeVM.ascii.test.test.passive.figlet.withDelay(delay))
            .onAppear {
                if isCurrent && testVM.test == nil {
                    testVM.setTest(test: test)
                    activeTestId = id
                }
            }
            .onTapGesture {
                testVM.setTest(test: test)
                activeTestId = id
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
            .symbol(.H),
            .test(Tests[.I][0], true)
        ], testVM: TestViewModel())
        .withEnvironment()
    }
}
