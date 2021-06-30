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
    @EnvironmentObject var testVM: TestViewModel
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var helpVM: HelpViewModel
    
    typealias SymbolId = String
    typealias MessageId = String
    
    @State var grid: GridType = .adaptive
    @State var printedSymbols: Set<SymbolId> = []
    @State var printedMsgs: Set<MessageId> = []
    @State var printedTests: Set<UUID> = []
    @State var solved: [ASCIISymbol] = []
    @State var wide = UIScreen.main.bounds.width > 500
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var items: [TerminalItem]
    
    init(items: [TerminalItem]) {
        self.items = items
    }
    
    var body: some View {
        Grid(columns: self.grid.rawValue()) {
            if uiVM.isHelp {
                TerminalHelpTest(wide: wide)
            }
            ForEach(items, id: \.id) { item in
                if case let .message(text) = item.type {
                    if !uiVM.isHelp {
                        let shakeAnimation = getShakeAnimation(from: themeVM.terminal.grid.message.figlet.animations)
                        let animations = shakeAnimation != nil ? [shakeAnimation!] : []
                        let theme = !printedMsgs.contains(item.id)
                            ? themeVM.terminal.grid.message.figlet
                            : themeVM.terminal.grid.message.figlet.withAnimation(animations)
                        TerminalMessageRow(text, wide: wide, theme: theme)
                            .onAppear {
                                if uiVM.current != .message {
                                    self.grid = wide ? .landslide_message : .portrait_message
                                    uiVM.current = .message
                                    self.printedSymbols = []
                                    self.solved = []
                                }
                                if !self.printedTests.isEmpty {
                                    self.printedTests = []
                                }
                                if !self.printedMsgs.contains(item.id) {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                        self.printedMsgs.insert(item.id)
                                    }
                                }
                            }
                    }
                }
                if case let .symbol(symbol) = item.type {
                    if !uiVM.detail.is && !uiVM.isHelp {
                        TerminalSymbol(symbol, active: !printedSymbols.contains(item.id) && solved.contains(symbol), theme: themeVM.terminal.grid.symbol)
                            .matchedGeometryEffect(id: item.id, in: ns)
                            .onAppear {
                                if !self.printedSymbols.contains(item.id) {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        self.printedSymbols.insert(item.id)
                                    }
                                }
                            }
                    }
                }
                if case let .test(test, items, active) = item.type {
                    let symbolId = TerminalSymbol.id(from: test)
                    if !uiVM.isHelp && (!uiVM.detail.is || (uiVM.detail.is && active)) {
                        TerminalTestThemed(test, items: items, wide: wide, active: active, withDelay: !self.solved.isEmpty && !printedTests.contains(test.id))
                            .matchedGeometryEffect(id: symbolId, in: ns, properties: .position, isSource: false)
                            .onAppear {
                                if uiVM.current != .test {
                                    self.grid = .adaptive
                                    uiVM.current = .test
                                }
                                if !printedMsgs.isEmpty {
                                    printedMsgs = []
                                }
                            }
                            .onChange(of: active) { active in
                                if active && !printedTests.contains(test.id) {
                                    self.printedTests.insert(test.id)
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
            if case let .right(symbol) = result {
                self.solved.append(symbol)
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
            if uiVM.current == .test || (uiVM.isHelp && helpVM.current == .learn) {
                withAnimation(themeVM.terminal.grid.test.animation.detail) {
                    uiVM.detail = (!uiVM.detail.is, true)
                }
            }
        }
        .contentShape(Rectangle())
    }
    
    func getShakeAnimation(from animations: [FigletAnimation]) -> FigletAnimation? {
        if uiVM.isWaiting {
            return .shake(dt: 0.6, force: 1.5, type: .wave)
        } else {
            for animation in animations {
                if case .shake(_, _, _, _) = animation {
                    return animation
                }
            }
        }

        return .none
    }
    
    func HelpBackground() -> some View {
        themeVM.terminal.help.background
            .edgesIgnoringSafeArea(.all)
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
}

struct TerminalGrid_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            TerminalGrid(items: [TerminalItem(of: .symbol(.A))])
                .withEnvironment()
        }
    }
}
