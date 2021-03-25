//
//  ASCIIArt.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

struct ASCIIArt: ASCIIPrintable {
    var lines: [String]
}

extension ASCIIArt {
    static func of(_ type: ASCIIArtType) -> ASCIIArt {
        switch type {
        case .cat:
            return AnimalASCIIArts.arts[type]!
        }
    }
}
