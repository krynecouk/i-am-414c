//
//  Node.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

protocol Node: Indexable {
    var id: String { get }
    var name: String { get }
    @EdgeBuilder var edges: [Edge] { get }
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit)
    func onExit(ctx: GraphContext, toolkit: GraphToolkit)
}

extension Node {
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {}
    func onExit(ctx: GraphContext, toolkit: GraphToolkit) {}
}
