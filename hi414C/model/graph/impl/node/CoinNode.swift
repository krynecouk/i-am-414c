//
//  CoinNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

class CoinNode: RndWordNode {
    init(@EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(["HEAD", "TAIL"], edges)
    }
}
