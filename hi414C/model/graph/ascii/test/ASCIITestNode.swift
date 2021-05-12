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
        toolkit.historyVM.add(message: Message(from: .AL, text: ctx.input))
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
        
        print(toolkit.historyVM.history)
    }
    
    func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.historyVM.add(message: Message(from: ._414C, text: id))
    }
}

class UpgradeASCIITestNode: ASCIITestNode {
    override init(_ id: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(id, edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        super.onEnter(ctx: ctx, toolkit: toolkit)
        toolkit.testVM.level(reset: true)
        toolkit.testVM.radix(of: .hex)
        toolkit.asciiVM.reset()
        toolkit.graphVM?.setGraph(root: Graphs.HI2)
    }
}
