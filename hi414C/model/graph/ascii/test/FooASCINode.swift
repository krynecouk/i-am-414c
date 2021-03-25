//
//  ASCIINode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

class FooASCIINode : Node {
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
        toolkit.contentVM.setContent([.asciiTest(symbols)])
        toolkit.settingsVM.asciiTest.symbol.figlet.animations = []
    }
    
    func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.settingsVM.reset(of: .asciiTest)
    }
}
