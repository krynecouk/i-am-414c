//
//  RndNumNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

class RndNumNode: TestNode {
    let range: ClosedRange<Int>
    
    init(_ range: ClosedRange<Int>, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.range = range
        super.init("rnd_num", edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        self.name = String(range.randomElement()!)
        super.onEnter(ctx: ctx, toolkit: toolkit)
    }
}
