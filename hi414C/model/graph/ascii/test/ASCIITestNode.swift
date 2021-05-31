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
        toolkit.graphVM?.generateTests(for: id)
    }
    
    func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.chatVM.add(message: Message(from: .robot, text: id))
    }
}
