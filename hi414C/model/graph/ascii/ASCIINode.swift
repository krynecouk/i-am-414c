//
//  ASCIINode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

class ASCIINode : Node {
    let id: String
    let edges: [Edge]
    
    init(_ id: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.id = id
        self.edges = edges()
    }
    
    func onEnter(ctx: Context) {
        let symbols = self.id.map { ASCIISymbol.from(String($0)) }
        ctx.asciiVM.setCurrent(current: symbols)
    }
}
