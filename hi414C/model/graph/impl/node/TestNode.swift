//
//  TestNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

import Foundation

class TestNode: Node {
    let id: String
    var name: String
    let edges: [Edge]
    var index: [String:Edge] = [:]
    
    init(_ name: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        let _edges = edges()
        self.id = UUID().uuidString
        self.name = name
        self.edges = _edges
        TestNode.asyncIndex(_edges) { index in
            self.index = index
        }
    }
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.chatVM.add(message: Message(from: .al, text: ctx.input))
        
        let symbols = name.map { char in
            ASCIISymbol.from(String(char))
        }
        
        let unknown = symbols.filter { !toolkit.asciiVM.symbols.contains($0) }
        if !unknown.isEmpty {
            // level up only if node contains unknown symbols
            toolkit.testVM.level(up: 1, store: false)
        }
        
        toolkit.graphVM?.generateTests(for: symbols)
    }
    
    func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.chatVM.add(message: Message(from: .robot, text: name))
        toolkit.testVM.storeLevel()
    }
}
