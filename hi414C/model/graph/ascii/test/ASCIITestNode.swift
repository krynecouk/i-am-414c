//
//  ASCIITestNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

class ASCIITestNode: Node {
    let id: String
    let edges: [Edge]
    
    init(_ id: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.id = id
        self.edges = edges()
    }
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.chatVM.add(message: Message(from: .al, text: ctx.input))
        
        let symbols = id.map { char in
            ASCIISymbol.from(String(char))
        }
        
        let unknown = symbols.filter { !toolkit.asciiVM.symbols.contains($0) }
        if !unknown.isEmpty {
            // level up only if node contains unknown symbols
            toolkit.testVM.level(up: 1)
        }
        
        toolkit.graphVM?.generateTests(for: symbols)
    }
    
    func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.chatVM.add(message: Message(from: .robot, text: id))
        toolkit.testVM.storeLevel()
    }
}

class ASSCIITestNode414C: ASCIITestNode {
    override init(_ id: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(id, edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onEnter(ctx: ctx, toolkit: toolkit)
        toolkit.themeVM.theme = PanicTheme(font: toolkit.themeVM.font, color: toolkit.themeVM.color, withTestStyle: true)
    }
    
    override func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onExit(ctx: ctx, toolkit: toolkit)
        toolkit.themeVM.reset()
    }
}

class ThemeNode: ASCIITestNode {
    let theme: Themable
    
    init(_ id: String, theme: Themable, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.theme = theme
        super.init(id, edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onEnter(ctx: ctx, toolkit: toolkit)
        toolkit.themeVM.theme = theme
    }
    
    override func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onExit(ctx: ctx, toolkit: toolkit)
        toolkit.themeVM.reset()
    }
}
