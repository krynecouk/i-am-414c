//
//  ASCIITestNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

import Foundation

class ASCIITestNode: Node {
    let id: String
    let msg: String
    let edges: [Edge]
    
    init(_ msg: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.id = UUID().uuidString
        self.msg = msg
        self.edges = edges()
    }
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.chatVM.add(message: Message(from: .al, text: ctx.input))
        
        let symbols = msg.map { char in
            ASCIISymbol.from(String(char))
        }
        
        let unknown = symbols.filter { !toolkit.asciiVM.symbols.contains($0) }
        if !unknown.isEmpty {
            // level up only if node contains unknown symbols
            toolkit.testVM.level(up: 1)
        }
        
        toolkit.graphVM?.generateTests(for: symbols)
    }
    
    func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.chatVM.add(message: Message(from: .robot, text: msg))
        toolkit.testVM.storeLevel()
    }
}
