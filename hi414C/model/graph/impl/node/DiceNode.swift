//
//  DiceNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

class DiceNode: RndNumNode {
    init(range: ClosedRange<Int> = 1...6, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(range, edges)
    }
}
