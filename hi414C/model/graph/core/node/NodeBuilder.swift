//
//  NodeBuilder.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

@_functionBuilder
struct NodeBuilder {
    static func buildBlock() -> [String: Node] { [String: Node]() }
    
    static func buildBlock(_ nodes: Node...) -> [String: Node] {
        nodes.reduce(into: [String: Node]()) {
            $0[$1.id] = $1
        }
    }
}
