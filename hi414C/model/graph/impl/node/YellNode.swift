//
//  YellNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.06.2021.
//

class YellNode: ASCIITestNode {
    init(_ edges: () -> [Edge] = {[]}) {
        super.init("echo", edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        self.name = "\(ctx.input)!!!"
        super.onEnter(ctx: ctx, toolkit: toolkit)
    }
}
