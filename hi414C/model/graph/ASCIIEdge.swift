//
//  ASCIIEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

class ASCIIEdge : Edge {
    var id: Id
    var variants: [String]
    var target: [Id: Node]
    
    init(_ id: Id, variants: [Id] = [], @NodeBuilder _ content: () -> [Id: Node] = {[Id: Node]()}) {
        self.id = id
        self.variants = variants
        self.target = content()
        self.variants.append(id)
    }
    
    func isTraversable(ctx: Context) -> Bool {
        true // TODO
    }
    
    func traverse() -> Node {
        target.values.first! // TODO
    }
}
