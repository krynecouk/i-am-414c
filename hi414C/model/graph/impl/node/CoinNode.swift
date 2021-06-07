//
//  CoinNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

class CoinNode: RndWordNode {
    init(_ edges: () -> [Edge] = {[]}) {
        super.init(words: ["HEAD", "TAIL"], edges)
    }
}
