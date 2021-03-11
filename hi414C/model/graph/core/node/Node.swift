//
//  Node.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

protocol Node {
    typealias Id = String
    var id: Id { get }
    @EdgeBuilder var edges: [Id: Edge] { get }
    var path: [Id] { get set }
    subscript(id: Id) -> Edge? { get }
}

extension Node {
    subscript(id: Id) -> Edge? {
        edges[id]
    }
}
