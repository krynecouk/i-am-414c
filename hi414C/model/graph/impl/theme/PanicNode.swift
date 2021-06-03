//
//  PanicNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.06.2021.
//

class PanicNode: ASCIITestNode {
    let styled: Bool
    
    init(_ id: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}, styled: Bool = false) {
        self.styled = styled
        super.init(id, edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onEnter(ctx: ctx, toolkit: toolkit)
        toolkit.themeVM.theme = PanicTheme(font: toolkit.themeVM.font, color: toolkit.themeVM.color, styled: styled)
    }
    
    override func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onExit(ctx: ctx, toolkit: toolkit)
        toolkit.themeVM.restore()
    }
}

class PanicNode414C: PanicNode {
    init(_ id: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(id, edges, styled: true)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.testVM.level(reset: true)
        toolkit.testVM.difficulty(.easy, store: false)
        super.onEnter(ctx: ctx, toolkit: toolkit)
    }
    
    override func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.testVM.restoreLevel()
        toolkit.testVM.restoreDifficulty()
        super.onExit(ctx: ctx, toolkit: toolkit)
    }
}
