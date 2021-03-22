//
//  Traversable.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

protocol Traversable {
    func isTraversable(ctx: GraphContext) -> Bool
    func traverse() -> Node
}
