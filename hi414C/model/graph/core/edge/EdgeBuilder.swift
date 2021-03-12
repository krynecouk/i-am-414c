//
//  EdgeBuilder.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

@_functionBuilder
struct EdgeBuilder {
    static func buildBlock() -> [Edge] { [] }

    static func buildBlock(_ edges: Edge...) -> [Edge] {
        edges
    }
}
