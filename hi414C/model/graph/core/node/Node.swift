//
//  Node.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

protocol Node {
    var id: String { get }
    @EdgeBuilder var edges: [Edge] { get }
    func onEnter(ctx: Context)
    func onExit(ctx: Context)
}

extension Node {
    func onEnter(ctx: Context) {}
    func onExit(ctx: Context) {}
}
