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
        .gesture(
            DragGesture()
                .onChanged({ gesture in
                    if gesture.startLocation.x < CGFloat(40){
                        let slope = abs((gesture.startLocation.y - gesture.location.y)/(gesture.startLocation.x - gesture.location.x))
                        if slope < 1 {
                            withAnimation {
                                uiVM.isHelp = true
                            }
                        }
                    }
                    if gesture.startLocation.x > CGFloat(UIScreen.main.bounds.width - 40){
                        let slope = abs((gesture.startLocation.y - gesture.location.y)/(gesture.startLocation.x - gesture.location.x))
                        if slope < 1 {
                            withAnimation {
                                uiVM.isHelp = false
                            }
                        }
                    }
                }
                )
        )
        .onTapGesture {
            withAnimation(themeVM.terminal.grid.test.test.animation.detail) {
                uiVM.isDetail.toggle()
            }
        }
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

extension AnyTransition {
    static var circular: AnyTransition { get {
        AnyTransition.modifier(
            active: ShapeClipModifier(shape: CircleClipShape(pct: 1)),
            identity: ShapeClipModifier(shape: CircleClipShape(pct: 0)))
    }
    }
}

struct ShapeClipModifier<S: Shape>: ViewModifier {
    let shape: S
    
    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

struct CircleClipShape: Shape {
    var pct: CGFloat
    
    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var bigRect = rect
        bigRect.size.width = bigRect.size.width * 2 * (1 - pct)
        bigRect.size.height = bigRect.size.height * 2 * (1 - pct)
        bigRect = bigRect.offsetBy(dx: -rect.width/2.0, dy: -rect.height/2.0)
        
        path = Circle().path(in: bigRect)
        
        return path
    }
}

struct ScaledCircle: Shape {
    // This controls the size of the circle inside the
    // drawing rectangle. When it's 0 the circle is
    // invisible, and when it’s 1 the circle fills
    // the rectangle.
    var animatableData: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let maximumCircleRadius = sqrt(rect.width * rect.width + rect.height * rect.height)
        let circleRadius = maximumCircleRadius * animatableData
        
        let x = rect.midX - circleRadius / 2
        let y = rect.midY - circleRadius / 2
        
        let circleRect = CGRect(x: x, y: y, width: circleRadius, height: circleRadius)
        
        return Circle().path(in: circleRect)
    }
}

// A general modifier that can clip any view using a any shape.
struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T
    
    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

// A custom transition combining ScaledCircle and ClipShapeModifier.
extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1))
        )
    }
}
