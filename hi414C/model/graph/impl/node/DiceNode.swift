//
//  DiceNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

class DiceNode: RndNumNode {
    init(_ edges: () -> [Edge] = {[]}) {
        super.init(range: 1...6, edges)
    }
}
