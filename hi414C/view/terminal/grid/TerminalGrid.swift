//
//  TerminalItems.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.04.2021.
//

import SwiftUI

struct TerminalGrid: View {
    @Namespace private var ns
    
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var testVM: TestViewModel
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var historyVM: HistoryViewModel
    
    typealias SymbolId = String
    
    @State var errors: Int = 0
    @State var columns = ADAPTIVE
    @State var printed: [SymbolId] = []
    @State var solved: [ASCIISymbol] = []
    @State var wide = false
    
    private static let ADAPTIVE = [GridItem(.adaptive(minimum: 60, maximum: .infinity))]
    private static let PORTRAIT_DETAIL = (1...4).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
    private static let LANDSLIDE_DETAIL = (1...8).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var items: [TerminalItem]
    
    init(items: [TerminalItem]) {
        print("TerminalGrid")
        self.items = items
    }
    
    var body: some View {
        Grid(columns: self.columns) {
            ForEach(items, id: \.id) { item in
                if case let .help(type) = item.type {
                    if uiVM.isHelp {
                        TerminalHelp(type)
                    }
                }
                if case let .art(arts) = item.type {
                    if !uiVM.isHelp {
                        TerminalArt(arts)
                    }
                }
                if case let .message(symbols) = item.type {
                    if !uiVM.isHelp {
                        TerminalMessage(symbols)
                    }
                }
                if case let .symbol(symbol) = item.type {
                    if !uiVM.isDetail && !uiVM.isHelp {
                        TerminalSymbol(item.id, symbol)
                            .matchedGeometryEffect(id: item.id, in: ns)
                    }
                }
                if case let .test(test, items, active) = item.type {
                    if !uiVM.isHelp && (!uiVM.isDetail || (uiVM.isDetail && active)) {
                        let theme = active
                            ? (themeVM.terminal.grid.test.test.active.figlet, themeVM.terminal.grid.test.test.active.op)
                            : (themeVM.terminal.grid.test.test.passive.figlet, themeVM.terminal.grid.test.test.passive.op)
                        TerminalTest(items, theme: theme, wide: wide)
                            .matchedGeometryEffect(id: "\(test.id.uuidString)\(test.symbol.rawValue)", in: ns, isSource: false)
                    }
                }
            }
        }
        .background(uiVM.isHelp ? Color.primary.opacity(0.7).frame(width: UIScreen.main.bounds.width + 100, height: UIScreen.main.bounds.height + 100).transition(.circular) : nil)
        .animation(themeVM.terminal.grid.test.test.animation.symbol, value: self.items)
        .withShake(attempt: errors)
        .onReceive(testVM.$result) { result in
            if case .wrong(_) = result {
                withAnimation(.default) {
                    self.errors += 1
                }
            }
            if case let .right(symbol) = result {
                self.solved.append(symbol)
                uiVM.isHelp = false
            }
        }
        .onReceive(graphVM.$result) { result in
            if case .error(_) = result {
                withAnimation(.default) {
                    self.errors += 1
                }
            }
            uiVM.isHelp = false
        }
        .onReceive(orientationChanged) { _ in
            self.wide = uiVM.isWideScreen()
            self.columns = uiVM.isDetail
                ? (wide ? TerminalGrid.LANDSLIDE_DETAIL : TerminalGrid.PORTRAIT_DETAIL)
                : TerminalGrid.ADAPTIVE
        }
        .onReceive(uiVM.$isDetail) { isDetail in
            withAnimation(themeVM.terminal.grid.test.test.animation.detail) {
                if !isDetail {
                    self.columns = TerminalGrid.ADAPTIVE
                } else {
                    self.columns = uiVM.isWideScreen() ? TerminalGrid.LANDSLIDE_DETAIL : TerminalGrid.PORTRAIT_DETAIL
                }
            }
        }
        .onEdgeDrag(
            left: {
                if !uiVM.isHelp {
                    withAnimation {
                        uiVM.isHelp = true
                    }
                }
            },
            right: {
                if uiVM.isHelp {
                    withAnimation {
                        uiVM.isHelp = false
                    }
                }
            }
        )
        .onTapGesture {
            withAnimation(themeVM.terminal.grid.test.test.animation.detail) {
                uiVM.isDetail.toggle()
            }
        }
        .contentShape(Rectangle())
    }
    
    func TerminalArt(_ arts: [ASCIIPrintable]) -> some View {
        ForEach(arts.indices) { ASCIIArtView(arts[$0], theme: themeVM.terminal.grid.art) }
    }
    
    func TerminalMessage(_ symbols: [ASCIISymbol]) -> some View {
        FigletView(symbols, theme: themeVM.terminal.grid.message.figlet)
            .onAppear {
                self.printed = []
                self.solved = []
            }
    }
    
    func TerminalSymbol(_ id: String, _ symbol: ASCIISymbol) -> some View {
        FigletView(symbol.rawValue, theme: (!printed.contains(id) && solved.contains(symbol))
                    ? themeVM.terminal.grid.test.symbol.figlet
                    : themeVM.terminal.grid.test.symbol.figlet.withAnimation([]))
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
    case test(Test, [TerminalTestItem], Bool)
    case message([ASCIISymbol])
    case art([ASCIIPrintable])
    case help(TerminalHelpType)
}

struct TerminalGrid_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            TerminalGrid(items: [TerminalItem(of: .symbol(.A))])
                .withEnvironment()
        }
    }
}
