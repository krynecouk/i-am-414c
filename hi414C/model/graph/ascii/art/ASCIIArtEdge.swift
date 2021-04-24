//
//  ASCIIArtEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 25.03.2021.
//

struct ASCIIArtEdge: Edge {
    var id: String
    var variants: [String]
    var target: Node
    
    init(_ id: String, variants: [String] = [], _ content: () -> Node) {
        self.id = id
        self.variants = variants
        self.target = content()
        self.variants.append(id)
    }
    
    func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        self.variants.contains(ctx.input) // TODO need to be smarter
    }
    
    func traverse(ctx: GraphContext, toolkit: GraphToolkit) -> Node {
        target
    }
}
