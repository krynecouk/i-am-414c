//
//  ASCIINode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

class ASCIINode : Node {
    let id: Id
    let edges: [Id: Edge]
    var path: [Id] = []
    
    //var closure: (_ ctx: Context) -> Node
    
    init(_ id: String, @EdgeBuilder _ edges: () -> [Id: Edge] = {[Id: Edge]()}) {
        self.id = id
        self.edges = edges()
        self.path.append(id)
        
        // TODO not working - reverse order of creation
        for (_, value) in self.edges {
            for (key, var node) in value.target {
                print("ADDING PATH OF \(self.id) for \(key)")
                node.path += self.path
            }
        }
    }
}
