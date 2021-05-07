//
//  GraphNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.05.2021.
//

class GraphNode : Node {
    let id: String
    let edges: [Edge]
    
    init(_ id: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.id = id
        self.edges = edges()
    }
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.historyVM.add(message: Message(from: .AL, text: ctx.input))
        toolkit.terminalVM.setContent(.test([Test(symbol: .H, equation: ID().eq(ASCII.from(.H).dec))]))
    }
}
