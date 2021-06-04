//
//  Edge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

protocol Edge: Traversable {
    var id: String { get }
    var names: [String] { get }
    var target: Node { get }
}
