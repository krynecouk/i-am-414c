//
//  ASCIINode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

struct ASCIINode : Node {
    let id: String
    let nodes: [Node]
    //var closure: (_ ctx: Context) -> Node
    
    init(_ id: String, @GraphBuilder _ content: () -> [Node] = {[]}) {
        self.id = id
        self.nodes = content()
    }
}
