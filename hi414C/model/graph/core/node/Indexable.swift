//
//  Indexable.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.06.2021.
//

typealias EdgeIndex = [String:Edge]

protocol Indexable {
    var index: EdgeIndex { get }
    func find(name: String) -> Edge?
    static func index(_ values: [Edge]) -> EdgeIndex
}

extension Indexable {
    func find(name: String) -> Edge? {
        self.index[name.tokenizeWord()]
    }
    
    static func index(_ edges: [Edge]) -> EdgeIndex {
        var index: EdgeIndex = [:]
        for edge in edges {
            for name in edge.names {
                index[name.tokenizeWord()] = edge
            }
        }
        return index
    }
}
