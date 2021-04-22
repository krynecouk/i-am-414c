//
//  Set.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.04.2021.
//

extension Set {
    static func + (left: Set<Element>, right: Set<Element>) -> Set<Element> {
        var copy = left
        copy.formUnion(right)
        return copy
    }
}
