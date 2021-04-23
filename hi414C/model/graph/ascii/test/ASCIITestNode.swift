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
        let unknown = symbols.filter { !toolkit.asciiVM.symbols.contains($0) }
        if !unknown.isEmpty {
            // level up only if node contains unknown symbols
            toolkit.testVM.level(up: 1)
        }
        let tests: [Test] = symbols.map { toolkit.testVM.generate(for: $0) }
        toolkit.terminalVM.setContent([.test(tests)])
    }
}
