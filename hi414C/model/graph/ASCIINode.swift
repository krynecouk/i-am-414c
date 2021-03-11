//
//  ASCIINode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

struct ASCIINode : Node {
    let id: String
    let edges: [Id: Edge]
    //var closure: (_ ctx: Context) -> Node
    
    init(_ id: String, @EdgeBuilder _ content: () -> [Id: Edge] = {[Id: Edge]()}) {
        self.id = id
        self.edges = content()
    }
    
    subscript(id: Id) -> Edge? {
        edges[id]
    }
}
