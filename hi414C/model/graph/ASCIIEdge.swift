//
//  ASCIIEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

struct ASCIIEdge : Edge {
    var id: Id
    var variants: [String]
    var target: [Id: Node]
    
    init(_ id: Id, variants: [Id] = [], @NodeBuilder _ content: () -> [Id: Node] = {[Id: Node]()}) {
        self.id = id
        self.variants = variants
        self.target = content()
        self.variants.append(id)
    }
    
    subscript(id: Id) -> Node? {
        target[id]
    }
}
