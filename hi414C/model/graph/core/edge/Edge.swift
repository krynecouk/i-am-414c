//
//  Edge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

protocol Edge {
    typealias Id = String
    var id: Id {get}
    @NodeBuilder var target: [Id: Node] { get }
    func isTraversable(ctx: Context) -> Bool
    func traverse() -> Node
    subscript(id: Id) -> Node? { get }
}

extension Edge {
    subscript(id: Id) -> Node? {
        target[id]
    }
}
