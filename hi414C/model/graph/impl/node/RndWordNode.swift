//
//  RndWordNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

class RndWordNode: TestNode {
    let words: [String]
    
    init(_ words: [String], @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.words = words
        super.init("rnd_num", edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        self.name = words.randomElement()!
        super.onEnter(ctx: ctx, toolkit: toolkit)
    }
}
