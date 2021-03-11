//
//  FooNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

import Foundation

struct FooNode : Node {
    let id: String
    let nodes: [Node]
    
    init(_ id: String, @GraphBuilder _ content: () -> [Node] = {[]}) {
        self.id = id
        self.nodes = content()
    }
}
