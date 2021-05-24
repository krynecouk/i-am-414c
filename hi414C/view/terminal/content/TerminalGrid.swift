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
    @EnvironmentObject var helpVM: HelpViewModel
    
    typealias SymbolId = String
    typealias MessageId = String
    
    @State var grid: GridType = .adaptive
    @State var printed: Set<SymbolId> = []
    @State var printedMsg: Set<MessageId> = []
    @State var solved: [ASCIISymbol] = []
    @State var wide = false
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var items: [TerminalItem]
    
    init(items: [TerminalItem]) {
        print("TerminalGrid")
        self.items = items
    }
    
    var body: some View {
        Grid(columns: self.grid.rawValue()) {
            if uiVM.isHelp {
                TerminalHelpTest(wide: wide)
            }
            ForEach(items, id: \.id) { item in
                if case let .art(arts) = item.type {
                    if !uiVM.isHelp {
                        TerminalArt(arts)
                    }
                }
                if case let .message(text) = item.type {
                    if !uiVM.isHelp {
                        let theme = !printedMsg.contains(item.id) ? themeVM.terminal.grid.message.figlet : themeVM.terminal.grid.message.figlet.withAnimation([])
                        TerminalMessageRow(text, wide: wide, theme: theme)
                            .onAppear {
                                if uiVM.current != .message {
                                    self.grid = wide ? .landslide_message : .portrait_message
                                    uiVM.current = .message
                                    helpVM.current = .chat
                                    self.printed = []
                                    self.solved = []
                                }
                            }
                    }
                }
                if case let .symbol(symbol) = item.type {
                    if !uiVM.detail.is && !uiVM.isHelp {
                        TerminalSymbol(symbol, active: !printed.contains(item.id) && solved.contains(symbol), theme: themeVM.terminal.grid.symbol)
                            .matchedGeometryEffect(id: item.id, in: ns)
                            .onDisappear {
                                self.printed.insert(item.id)
                            }
                    }
                }
                if case let .test(test, items, active) = item.type {
                    if !uiVM.isHelp && (!uiVM.detail.is || (uiVM.detail.is && active)) {
                        TerminalTestThemed(test, items: items, wide: wide, active: active)
                            .matchedGeometryEffect(id: TerminalSymbol.id(from: test), in: ns, properties: .position, isSource: false)
                            .onAppear {
                                if uiVM.current != .test {
                                    self.grid = .adaptive
                                    uiVM.current = .test
                                    helpVM.current = .learn
                                }
                                if !printedMsg.isEmpty {
                                    printedMsg = []
                                }
                            }
                    }
                }
            }
            TerminalPadding()
        }
        .background(uiVM.isHelp ? HelpBackground() : nil)
        .animation(themeVM.terminal.grid.test.animation.symbol, value: self.items)
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
            if uiVM.detail.is {
                self.grid = wide ? .landslide_detail : .portrait_detail
            } else {
                self.grid = .adaptive
            }
        }
        .onReceive(uiVM.$detail) { detail in
            withAnimation(detail.animated ? themeVM.terminal.grid.test.animation.detail : nil) {
                if !detail.is {
                    if self.grid != .adaptive {
                        self.grid = .adaptive
                    }
                } else {
                    if uiVM.isWideScreen() {
                        if self.grid != .landslide_detail {
                            self.grid = .landslide_detail
                        }
                    } else {
                        if self.grid != .portrait_detail {
                            self.grid = .portrait_detail
                        }
                    }
                }
            }
        }
        .onTapGesture {
            //if uiVM.current != .message {
                withAnimation(themeVM.terminal.grid.test.animation.detail) {
                    uiVM.detail = (!uiVM.detail.is, true)
                }
            //}
        }
        .contentShape(Rectangle())
    }
    
    func HelpBackground() -> some View {
        themeVM.terminal.help.background
            .frame(width: UIScreen.main.bounds.width + 100, height: UIScreen.main.bounds.height + 100)
            .transition(AnyTransition.circular.animation(.easeOut.speed(1)))
    }
    
    func TerminalArt(_ arts: [ASCIIPrintable]) -> some View {
        ForEach(arts.indices) { ASCIIArtView(arts[$0], theme: themeVM.terminal.grid.art) }
    }
    
    enum GridType {
        case adaptive, portrait_detail, landslide_detail, portrait_message, landslide_message
        
        private static let ADAPTIVE = [GridItem(.adaptive(minimum: 60, maximum: .infinity))]
        private static let PORTRAIT_DETAIL = (1...4).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
        private static let LANDSLIDE_DETAIL = (1...8).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
        private static let PORTRAIT_MESSAGE = (1...5).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
        private static let LANDSLIDE_MESSAGE = (1...10).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
        
        func rawValue() -> [GridItem] {
            switch self {
            case .adaptive:
                return GridType.ADAPTIVE
            case .portrait_detail:
                return GridType.PORTRAIT_DETAIL
            case .landslide_detail:
                return GridType.LANDSLIDE_DETAIL
            case .portrait_message:
                return GridType.PORTRAIT_MESSAGE
            case .landslide_message:
                return GridType.LANDSLIDE_MESSAGE
            }
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
    case message(String)
    case art([ASCIIPrintable])
}

struct TerminalGrid_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            TerminalGrid(items: [TerminalItem(of: .symbol(.A))])
                .withEnvironment()
        }
    }
}
