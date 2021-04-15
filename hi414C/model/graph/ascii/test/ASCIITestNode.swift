//
//  ASCIITestNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

class ASCIITestNode : Node {
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
        let tests: [Test] = symbols.map { symbol in
            let ascii = ASCII.from(symbol)
            let equation = AND().eq(ascii.dec) // TODO
            return Test(symbol: symbol, equation: equation)
        }
        toolkit.contentVM.setContent([.asciiTest(tests)])
    }
}
