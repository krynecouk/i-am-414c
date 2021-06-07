//
//  DiceNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

class DiceNode: RndNumNode {
    init(@EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(1...6, edges)
    }
}
