//
//  ThemeNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.06.2021.
//

class ThemeNode: ASCIITestNode {
    let theme: Themable
    
    init(_ msg: String, theme: Themable, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.theme = theme
        super.init(msg, edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onEnter(ctx: ctx, toolkit: toolkit)
        toolkit.themeVM.theme = theme
    }
    
    override func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onExit(ctx: ctx, toolkit: toolkit)
        toolkit.themeVM.restore()
    }
}
