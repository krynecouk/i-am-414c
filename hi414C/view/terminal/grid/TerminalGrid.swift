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
    @EnvironmentObject var helpVM: HelpViewModel
    
    typealias SymbolId = String
    
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
                if case let .help(item) = item.type {
                    if uiVM.isHelp {
                        TerminalHelp(item, wide: wide)
                    }
                }
                if case let .art(arts) = item.type {
                    if !uiVM.isHelp {
                        TerminalArt(arts)
                    }
                }
                if case let .message(text) = item.type {
                    if !uiVM.isHelp {
                        TerminalMessage(text, theme: themeVM.terminal.grid.message.figlet)
                            .onAppear {
                                helpVM.current = .message
                                self.printed = []
                                self.solved = []
                            }
                    }
                }
                if case let .symbol(symbol) = item.type {
                    if !uiVM.isDetail && !uiVM.isHelp {
                        TerminalSymbol(symbol, active: !printed.contains(item.id) && solved.contains(symbol), theme: themeVM.terminal.grid.symbol)
                            .matchedGeometryEffect(id: item.id, in: ns)
                            .onDisappear {
                                self.printed.append(item.id)
                            }
                            //.animation(nil)
                    }
                }
                
                if case let .test(test, items, active) = item.type {
                    if !uiVM.isHelp && (!uiVM.isDetail || (uiVM.isDetail && active)) {
                        let theme = active
                            ? (themeVM.terminal.grid.test.active.figlet, themeVM.terminal.grid.test.active.sign)
                            : (themeVM.terminal.grid.test.passive.figlet, themeVM.terminal.grid.test.passive.sign)
                        TerminalTest(items, theme: theme, wide: wide)
                            .matchedGeometryEffect(id: TerminalSymbol.id(from: test), in: ns, properties: .position, isSource: false)
                            .onAppear {
                                if helpVM.current != .test {
                                    helpVM.current = .test
                                }
                            }
                    }
                }
            }
            TerminalPadding()
        }
        .background(uiVM.isHelp ? HelpBackground() : nil)
        .animation(Animation.spring(response: 0.8).speed(0.8), value: self.items)
        .withShake(attempt: uiVM.errors)
        .onReceive(testVM.$result) { result in
            if case .wrong(_) = result {
                withAnimation {
                    uiVM.shake()
                }
            }
            if case let .right(symbol) = result {
                self.solved.append(symbol)
            }
        }
        .onReceive(graphVM.$result) { result in
            if case .error(_) = result {
                withAnimation {
                    uiVM.shake()
                }
            }
        }
        .onReceive(orientationChanged) { _ in
            self.wide = uiVM.isWideScreen()
            self.columns = uiVM.isDetail
                ? (wide ? TerminalGrid.LANDSLIDE_DETAIL : TerminalGrid.PORTRAIT_DETAIL)
                : TerminalGrid.ADAPTIVE
        }
        .onReceive(uiVM.$isDetail) { isDetail in
            withAnimation(themeVM.terminal.grid.test.animation.detail) {
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
                // todo theme animation
                if uiVM.isHelp {
                    withAnimation {
                        uiVM.isHelp = false
                    }
                }
            }
        )
        .onTapGesture {
            withAnimation(themeVM.terminal.grid.test.animation.detail) {
                uiVM.isDetail.toggle()
            }
        }
        .contentShape(Rectangle())
    }
    

    
    func HelpBackground() -> some View {
        themeVM.terminal.help.background
            .frame(width: UIScreen.main.bounds.width + 100, height: UIScreen.main.bounds.height + 100)
            .transition(.circular)
    }
    
    func TerminalArt(_ arts: [ASCIIPrintable]) -> some View {
        ForEach(arts.indices) { ASCIIArtView(arts[$0], theme: themeVM.terminal.grid.art) }
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
    case message(String)
    case art([ASCIIPrintable])
    case help(TerminalHelpItem)
}

struct TerminalGrid_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            TerminalGrid(items: [TerminalItem(of: .symbol(.A))])
                .withEnvironment()
        }
    }
}
