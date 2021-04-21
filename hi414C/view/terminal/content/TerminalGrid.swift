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
    
    typealias SymbolId = String
    
    enum CurrentItem {
        case art, test, message
    }
    
    @State var errors: Int = 0
    @State var columns = ADAPTIVE
    @State var printed: [SymbolId] = []
    @State var current: TerminalGrid.CurrentItem = .test
    
    private static let ADAPTIVE = [GridItem(.adaptive(minimum: 60, maximum: .infinity))]
    private static let PORTRAIT_DETAIL = (1...4).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
    private static let LANDSLIDE_DETAIL = (1...8).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var items: [TerminalItem]
    
    init(items: [TerminalItem]) {
        self.items = items
    }
    
    var body: some View {
        Grid(columns: self.columns) {
            ForEach(items, id: \.id) { item in
                if case let .art(arts) = item.type {
                    TerminalArt(arts)
                }
                if case let .message(symbols) = item.type {
                    TerminalMessage(symbols)
                }
                if case let .symbol(symbol) = item.type {
                    if !uiVM.isDetail {
                        TerminalSymbol(item.id, symbol)
                    }
                }
                if case let .test(test, active) = item.type {
                    if !uiVM.isDetail || (uiVM.isDetail && active) {
                        TerminalTest(test, active, animations: uiVM.isAnimated ? [.print(), .bloom()] : [])
                            .onAppear {
                                if current != .test {
                                    current = .test
                                }
                            }
                    }
                }
            }
        }
        .animation(Animation.spring().speed(0.8), value: self.items)
        .withShake(attempt: errors)
        .onReceive(testVM.$result) { result in
            if case .wrong(_) = result {
                withAnimation(.default) {
                    self.errors += 1
                }
            }
        }
        .onReceive(graphVM.$result) { result in
            if case .error(_) = result {
                withAnimation(.default) {
                    self.errors += 1
                }
            }
        }
        .onReceive(orientationChanged) { _ in
            self.columns = uiVM.isDetail
                ? (uiVM.isWideScreen() ? TerminalGrid.LANDSLIDE_DETAIL : TerminalGrid.PORTRAIT_DETAIL)
                : TerminalGrid.ADAPTIVE
        }
        .onReceive(uiVM.$isDetail) { isDetail in
            withAnimation(Animation.spring().speed(0.8)) {
                if !isDetail {
                    self.columns = TerminalGrid.ADAPTIVE
                } else {
                    self.columns = uiVM.isWideScreen() ? TerminalGrid.LANDSLIDE_DETAIL : TerminalGrid.PORTRAIT_DETAIL
                }
            }
        }
        .highPriorityGesture(
            DragGesture()
                .onChanged { value in
                    if uiVM.isAnimated && current == .test {
                        withAnimation(Animation.spring().speed(0.8)) {
                            uiVM.isAnimated = false
                        }
                    }
                }
        )
        .onTapGesture {
            withAnimation(Animation.spring().speed(0.8)) {
                uiVM.isDetail.toggle()
            }
        }
    }
    
    func TerminalArt(_ arts: [ASCIIPrintable]) -> some View {
        ForEach(arts.indices) { ASCIIArtView(arts[$0], theme: themeVM.ascii.art) }
            .onAppear {
                self.current = .art
            }
    }
    
    func TerminalMessage(_ symbols: [ASCIISymbol]) -> some View {
        FigletView(symbols, theme: themeVM.ascii.message.figlet)
            .onAppear {
                self.current = .message
                self.printed = []
                uiVM.isAnimated = true
            }
    }
    
    func TerminalSymbol(_ id: String, _ symbol: ASCIISymbol) -> some View {
        FigletView(symbol.rawValue, theme: themeVM.ascii.test.symbol.figlet.withAnimation(printed.contains(id) ? [] : [.print(), .bloom()]))
            .onDisappear {
                self.printed.append(id)
            }
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
