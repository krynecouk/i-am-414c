//
//  Indexable.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.06.2021.
//

import Foundation

typealias EdgeIndex = [String:Edge]

protocol Indexable {
    var index: EdgeIndex { get }
    func find(name: String) -> Edge?
    static func index(_ edges: [Edge]) -> EdgeIndex
    static func asyncIndex(_ edges: [Edge], _ callback: @escaping (EdgeIndex) -> Void)
}

extension Indexable {
    func find(name: String) -> Edge? {
        self.index[name.tokenizeWord()] ?? self.index[name.lemmatizeWord()]
    }
    
    static func index(_ edges: [Edge]) -> EdgeIndex {
        var index: EdgeIndex = [:]
        for edge in edges {
            for name in edge.names {
                let token = name.tokenizeWord()
                if !token.isEmpty {
                    index[token] = edge
                }
                
                let lemma = name.lemmatizeWord()
                if !lemma.isEmpty {
                    index[lemma] = edge
                }
            }
        }
        return index
    }
    
    static func asyncIndex(_ edges: [Edge], _ callback: @escaping (EdgeIndex) -> Void) {
        DispatchQueue.global().async {
            callback(index(edges))
        }
    }
}
