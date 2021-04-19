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
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    @State var activeTestId: String = ""
    @State var attempt: Int = 0
    @State var isAnimated = true
    @State var isDetail = false
    
    func isWide() -> Bool {
        UIScreen.main.bounds.width > 500
    }
    
    static let DEFAULT_COLS: [GridItem] = [GridItem(.adaptive(minimum: 60, maximum: .infinity))]
    static let DETAIL_COLS_PORTRAIT: [GridItem] = (1...4).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
    static let DETAIL_COLS_LANDSLIDE: [GridItem] = (1...8).map { _ in  GridItem(.flexible(minimum: 60, maximum: .infinity))}
    
    @State var columns: [GridItem] = DEFAULT_COLS
    
    var items: [TerminalContentItem]
    
    init(_ types: [TerminalContentType]) {
        self.items = types.map { TerminalContentItem($0) }
    }
    
    init(_ items: [TerminalContentItem]) {
        self.items = items
    }
    
    var body: some View {
        Grid(columns: self.columns) {
            ForEach(Array(items.enumerated()), id: \.element.id) { i, item in
                //let delay = Double(i) * 1.5
                let delay = 0.0
                if case let .art(arts) = item.type {
                    ASCIIArtViews(arts, delay: delay)
                }
                if case let .message(symbols) = item.type {
                    FigletView(symbols, theme: isAnimated ? themeVM.ascii.message.figlet.withDelay(delay) : themeVM.ascii.message.figlet.withAnimation([]))
                        .onAppear {
                            testVM.setTest(test: .none)
                            isAnimated = true
                            isDetail = false
                        }
                }
                if case let .symbol(symbol) = item.type {
                    if !isDetail {
                        FigletView(symbol.rawValue, theme: isAnimated ? themeVM.ascii.test.symbol.figlet.withDelay(delay) : themeVM.ascii.test.symbol.figlet.withAnimation([]))
                    }
                }
                if case let .test(test, isCurrent) = item.type {
                    if !isDetail || (isDetail && activeTestId == item.id) {
                        TestFigletView(id: item.id, test: test, isCurrent: isCurrent, delay: delay)
                    }
                }
            }
        }
        .animation(Animation.spring().speed(0.8), value: self.items)
        .withShake(attempt: attempt)
        .onReceive(testVM.$result) { result in
            if case .wrong(_) = result {
                withAnimation(.default) {
                    self.attempt += 1
                }
            } else {
                isDetail = false
                isAnimated = true
            }
        }
        .onReceive(graphVM.$result) { result in
            if case .error(_) = result {
                withAnimation(.default) {
                    self.attempt += 1
                }
            } else {
                isDetail = false
                isAnimated = true
            }
        }
        .onReceive(orientationChanged) { _ in
            withAnimation() {
                if isDetail {
                    if isWide() {
                        self.columns = TerminalContent.DETAIL_COLS_LANDSLIDE
                    } else {
                        self.columns = TerminalContent.DETAIL_COLS_PORTRAIT
                    }
                } else {
                    self.columns = TerminalContent.DEFAULT_COLS
                }
            }
        }
        .onTapGesture {
                withAnimation(Animation.spring().speed(0.8)) {
                    if isDetail {
                        self.columns = TerminalContent.DEFAULT_COLS
                        isDetail = false
                    } else {
                        if isWide() {
                            self.columns = TerminalContent.DETAIL_COLS_LANDSLIDE
                        } else {
                            self.columns = TerminalContent.DETAIL_COLS_PORTRAIT
                        }
                        isDetail = true
                    }
                }
        }
        /*
        .highPriorityGesture(
            DragGesture()
                .onChanged { value in
                    if isAnimated {
                        if isDetail {
                            self.isAnimated = false
                        } else {
                            withAnimation(Animation.linear.speed(0.3)) {
                                self.isAnimated = false
                            }
                        }
                        
                    }
                    
                     withAnimation(Animation.linear.speed(0.3)) {
                     self.columns = TerminalContent.DEFAULT_COLS
                     isDetail = false
                     }
                     
                }
        )
         */

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
                if isDetail {
                    if isWide() {
                        ForEach(0 ..< 7) {
                            Text("\($0)")
                                .opacity(0)
                        }
                    } else {
                        ForEach(0 ..< 3) {
                            Text("\($0)")
                                .opacity(0)
                        }
                    }
                }
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
            .opacity(isDetail && activeTestId != id ? 0 : 1)
            .onAppear {
                if isCurrent && activeTestId != id {
                    testVM.setTest(test: test)
                    activeTestId = id
                }
            }
            
    }
}

struct TerminalContentItem: Equatable {
    static func == (lhs: TerminalContentItem, rhs: TerminalContentItem) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String
    var type: TerminalContentType
    
    init(_ type: TerminalContentType, id: String = UUID().uuidString) {
        self.type = type
        self.id = id
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
