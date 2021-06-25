//
//  RadixNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 25.06.2021.
//

class RadixNode: TestNode {
    let radix: EquationRadix
    
    init(_ name: String, radix: EquationRadix = .bin, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.radix = radix
        super.init(name, edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.testVM.radix(of: self.radix)
        super.onEnter(ctx: ctx, toolkit: toolkit)
    }
}
