//
//  TerminalContent.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalContent: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var testVM: TestViewModel
    
    @State var activeTestId: String = ""
    @State var attempt: Int = 0
    @State var isAnimated = true
    
    var items: [TerminalContentItem]
    
    init(_ types: [TerminalContentType]) {
        self.items = types.map { TerminalContentItem($0) }
    }
    
    var body: some View {
        Grid {
            ForEach(Array(items.enumerated()), id: \.element.id) { i, item in
                let delay = Double(i) * 1.5
                if case let .art(arts) = item.type {
                    ASCIIArtViews(arts, delay: delay)
                }
                if case let .message(symbols) = item.type {
                    FigletView(symbols, theme: isAnimated ? themeVM.ascii.message.figlet.withDelay(delay) : themeVM.ascii.message.figlet.withAnimation([]))
                        .onAppear {
                            testVM.setTest(test: .none)
                        }
                }
                if case let .symbol(symbol) = item.type {
                    FigletView(symbol.rawValue, theme: isAnimated ? themeVM.ascii.test.symbol.figlet.withDelay(delay) : themeVM.ascii.test.symbol.figlet.withAnimation([]))
                }
                if case let .test(test, isCurrent) = item.type {
                    TestFigletView(id: item.id.uuidString, test: test, isCurrent: isCurrent, delay: delay)
                }
            }
        }
        .withShake(attempt: attempt)
        .onReceive(testVM.$result) { result in
            if case .wrong(_) = result {
                withAnimation(.default) {
                    self.attempt += 1
                }
            } else {
                isAnimated = true
            }
        }
        .onReceive(graphVM.$result) { result in
            if case .error(_) = result {
                withAnimation(.default) {
                    self.attempt += 1
                }
            } else {
                isAnimated = true
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    print(value)
                    withAnimation(Animation.linear.speed(0.3)) {
                        self.isAnimated = false
                    }
                }
        )
    }
    
    func ASCIIArtViews(_ arts: [ASCIIPrintable], delay: Double) -> some View {
        ForEach(arts.indices) { i in
            ASCIIArtView(arts[i], theme: isAnimated ? themeVM.ascii.art.withDelay(delay) : themeVM.ascii.art.withAnimation([]))
        }
    }
    
    func TestFigletView(id: String, test: Test, isCurrent: Bool, delay: Double) -> some View {
        ForEach(Array(test.equation.toString().enumerated()), id: \.offset) { i, char in
            if ["+", "-", "/", "*", "&", "|", "^", "~", "<", ">", ")", "("].contains(char) {
                CharFigletView(char: char, id: id, test: test, isCurrent: isCurrent,
                               theme: activeTestId == id
                                ? themeVM.ascii.test.test.active.special.withDelay(delay)
                                : themeVM.ascii.test.test.passive.special.withDelay(delay)
                )
            } else {
                CharFigletView(char: char, id: id, test: test, isCurrent: isCurrent,
                               theme: activeTestId == id
                                ? themeVM.ascii.test.test.active.figlet.withDelay(delay)
                                : themeVM.ascii.test.test.passive.figlet.withDelay(delay)
                )
            }
        }
    }
    
    func CharFigletView(char: Character, id: String, test: Test, isCurrent: Bool, theme: FigletTheme) -> some View {
        FigletView(String(char), theme: isAnimated ? theme : theme.withAnimation([]))
            .onAppear {
                if isCurrent && activeTestId != id {
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
    case test(Test, Bool)
    case message([ASCIISymbol])
    case art([ASCIIPrintable])
}

struct TerminalContent_Previews: PreviewProvider {
    static var previews: some View {
        TerminalContent([
            .symbol(.H)
        ])
        .withEnvironment()
    }
}
