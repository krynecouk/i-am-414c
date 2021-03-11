//
//  EdgeBuilder.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

@_functionBuilder
struct EdgeBuilder {
    static func buildBlock() -> [Edge] { [] }
    
    static func buildBlock(_ edges: Edge...) -> [String: Edge] {
        edges.reduce(into: [String: Edge]()) {
            $0[$1.id] = $1
        }
    }
}
