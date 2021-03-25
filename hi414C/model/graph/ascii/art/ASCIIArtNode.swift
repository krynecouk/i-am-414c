//
//  ASCIIArtNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 25.03.2021.
//

struct ASCIIArtNode {
    let id: String
    let edges: [Edge]
    
    init(_ id: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.id = id
        self.edges = edges()
    }
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        let symbols = id.map { char in
            ASCIISymbol.from(String(char))
        }
        toolkit.contentVM.setContent(.asciiTest(symbols))
    }
}
