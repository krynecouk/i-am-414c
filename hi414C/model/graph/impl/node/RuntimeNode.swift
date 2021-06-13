//
//  RuntimeNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.06.2021.
//

class RuntimeNode: TestNode {
    let content: (GraphContext, GraphToolkit) -> String
    
    init(content: @escaping (GraphContext, GraphToolkit) -> String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.content = content
        super.init("runtime", edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        self.name = self.content(ctx, toolkit)
        super.onEnter(ctx: ctx, toolkit: toolkit)
    }
}
