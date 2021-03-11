//
//  Node.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

protocol Node {
    typealias Id = String
    var id: Id {get}
    @EdgeBuilder var edges: [Id: Edge] { get }
    subscript(id: Id) -> Edge? { get }
}
