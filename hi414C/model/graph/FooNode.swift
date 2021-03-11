//
//  FooNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

struct FooNode : Node {
    let id: String
    let edges: [Id: Edge]
    
    init(_ id: String, @EdgeBuilder _ content: () -> [Id: Edge] = {[Id: Edge]()}) {
        self.id = id
        self.edges = content()
    }
    
    subscript(id: Id) -> Edge? {
        edges[id]
    }
}
