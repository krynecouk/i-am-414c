//
//  Edge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

protocol Edge: Traversable, EdgeArray {
    var id: String { get }
    var names: [String] { get }
    var target: Node { get }
    var edges: [Edge] { get }
}

extension Edge {
    var edges: [Edge] { [self] }
}

extension Array: EdgeArray where Element == Edge {
    var edges: [Edge] { self }
}
