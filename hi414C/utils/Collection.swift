//
//  Collection.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.05.2021.
//

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
