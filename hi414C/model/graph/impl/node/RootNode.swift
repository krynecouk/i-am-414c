//
//  RootNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.06.2021.
//

class RootNode: TestNode {
    override init(_ name: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(name, edges)
    }
}
