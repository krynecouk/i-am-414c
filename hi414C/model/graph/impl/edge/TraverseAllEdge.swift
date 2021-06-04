//
//  TraverseAllEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.06.2021.
//

class TraverseAllEdge: TraverseIfEdge {
    init(_ msg: String, _ content: () -> Node) {
        super.init(msg, if: { _ in true }, content)
    }
}
