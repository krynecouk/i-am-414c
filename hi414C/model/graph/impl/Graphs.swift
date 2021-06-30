//
//  Graphs.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.06.2021.
//

class Graphs {
    private init() {}
    
    public static func root(of type: GraphType) -> Node {
        switch type {
        case .BIN:
            return BinGraph.HI
        case .HEX:
            return HexGraph.HI
        }
    }
}

enum GraphType: String, Storable {
    case BIN, HEX
}
