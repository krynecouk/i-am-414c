//
//  EdgeBuilder.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

@resultBuilder
struct EdgeBuilder {
    static func buildBlock() -> [Edge] { [] }

    static func buildBlock(_ edges: EdgeArray...) -> [Edge] {
        edges.flatMap { $0.edges }
    }
}
