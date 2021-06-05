//
//  ThemeNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.06.2021.
//

class ThemeNode: TestNode {
    let themer: (_ font: FontTheme, _ color: ColorTheme) -> Themable
    
    init(_ name: String, themer: @escaping (FontTheme, ColorTheme) -> Themable, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.themer = themer
        super.init(name, edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onEnter(ctx: ctx, toolkit: toolkit)
        toolkit.themeVM.theme = themer(toolkit.themeVM.font, toolkit.themeVM.color)
    }
    
    override func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onExit(ctx: ctx, toolkit: toolkit)
        toolkit.themeVM.restore()
    }
}
