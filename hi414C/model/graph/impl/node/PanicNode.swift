//
//  PanicNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.06.2021.
//

class PanicNode: ThemeNode {
    init(_ name: String, styled: Bool = false, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(name, themer: { PanicTheme(font: $0, color: $1, styled: styled) }, edges)
    }
}

class PanicNode414C: PanicNode {
    init(_ name: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(name, styled: true, edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.testVM.level(reset: true, store: false)
        toolkit.testVM.difficulty(.easy, store: false)
        super.onEnter(ctx: ctx, toolkit: toolkit)
    }
    
    override func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.testVM.restoreLevel()
        toolkit.testVM.restoreDifficulty()
        super.onExit(ctx: ctx, toolkit: toolkit)
    }
}
