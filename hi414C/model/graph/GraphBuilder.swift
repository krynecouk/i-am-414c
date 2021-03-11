//
//  GraphBuilder.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

@_functionBuilder
struct GraphBuilder {
    static func buildBlock() -> [Node] { [] }
    
    static func buildBlock(_ nodes: Node...) -> [Node] {
        nodes
    }
}
