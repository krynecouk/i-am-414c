//
//  TerminalItems.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.04.2021.
//

import SwiftUI

struct TerminalGrid: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var testVM: TestViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    @State var testId: String = ""
    @State var attempt: Int = 0
    @State var columns = ADAPTIVE
    
    private static let ADAPTIVE = [GridItem(.adaptive(minimum: 60, maximum: .infinity))]
    private static let PORTRAIT_DETAIL = (1...4).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
    private static let LANDSLIDE_DETAIL = (1...8).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var items: [TerminalItem]
    
    init(items: [TerminalItem]) {
        self.items = items
        print(items)
    }
    
    var body: some View {
        Grid(columns: self.columns) {
            ForEach(items, id: \.id) { item in
                if case let .art(arts) = item.type {
                    ArtView(arts)
                }
                if case let .message(symbols) = item.type {
                    MessageView(symbols)
                }
                if case let .symbol(symbol) = item.type {
                    if !uiVM.isDetail {
                        SymbolView(symbol)
                    }
                }
                if case let .test(test, current) = item.type {
                    if !uiVM.isDetail || (uiVM.isDetail && testId == item.id) {
                        TestView(item.id, test, current)
                    }
                }
            }
        }
        .animation(Animation.spring().speed(0.8), value: self.items)
        .withShake(attempt: attempt)
        .onReceive(testVM.$result) { result in
            print("receiving test result from test \(testVM.test?.id)")
            if case .wrong(_) = result {
                withAnimation(.default) {
                    self.attempt += 1
                }
            }
        }
        .onReceive(graphVM.$result) { result in
            if case .error(_) = result {
                withAnimation(.default) {
                    self.attempt += 1
                }
            }
        }
        .onReceive(uiVM.$isDetail) { isDetail in
            withAnimation(Animation.spring().speed(0.8)) {
                if !isDetail {
                    self.columns = TerminalGrid.ADAPTIVE
                } else {
                    self.columns = isWideScreen() ? TerminalGrid.LANDSLIDE_DETAIL : TerminalGrid.PORTRAIT_DETAIL
                }
            }
        }
        .onTapGesture {
            uiVM.isDetail.toggle()
        }
    }
    
    func ArtView(_ arts: [ASCIIPrintable]) -> some View {
        ForEach(arts.indices) { ASCIIArtView(arts[$0], theme: themeVM.ascii.art) }
    }
    
    func MessageView(_ symbols: [ASCIISymbol]) -> some View {
        FigletView(symbols, theme: themeVM.ascii.message.figlet)
            .onAppear {
                testVM.setTest(test: .none)
            }
    }
    
    func SymbolView(_ symbol: ASCIISymbol) -> some View {
        FigletView(symbol.rawValue, theme: themeVM.ascii.test.symbol.figlet)
            .onAppear {
                print("symbol here")
            }
    }
    
    func TestView(_ id: String, _ test: Test, _ current: Bool = false) -> some View {
        ForEach(Array(test.equation.toString().enumerated()), id: \.offset) { _, char in
            if ["+", "-", "/", "*", "&", "|", "^", "~", "<", ">", ")", "("].contains(char) {
                TestFiglet(char, id: id, test: test, current: current, theme: testId == id
                            ? themeVM.ascii.test.test.active.special
                            : themeVM.ascii.test.test.passive.special)
            } else {
                TestFiglet(char, id: id, test: test, current: current, theme: testId == id
                            ? themeVM.ascii.test.test.active.figlet
                            : themeVM.ascii.test.test.passive.figlet)
            }
        }
        .onAppear {
            print("TEST \(id) ONAPPEAR")
        }
    }
    
    func TestFiglet(_ char: Character, id: String, test: Test, current: Bool, theme: FigletTheme) -> some View {
        return FigletView(String(char), theme: theme)
            .onAppear {
                if current && testId != id {
                    testVM.setTest(test: test)
                    self.testId = id
                }
            }
    }
    
    func isWideScreen() -> Bool {
        UIScreen.main.bounds.width > 500
    }
}

struct TerminalItem: Equatable {
    var id: String
    var type: TerminalItemType
    
    init(id: String = UUID().uuidString, of type: TerminalItemType) {
        self.id = id
        self.type = type
    }
    
    static func == (lhs: TerminalItem, rhs: TerminalItem) -> Bool {
        lhs.id == rhs.id
    }
}

enum TerminalItemType {
    case symbol(ASCIISymbol)
    case test(Test, Bool)
    case message([ASCIISymbol])
    case art([ASCIIPrintable])
}


/*
 struct TerminalBody_Previews: PreviewProvider {
 static var previews: some View {
 TerminalItems()
 }
 }
 */
