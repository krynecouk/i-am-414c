//
//  String.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

extension String {
    func pad(with character: String, toLength length: Int) -> String {
        let padCount = length - self.count
        guard padCount > 0 else { return self }
        return String(repeating: character, count: padCount) + self
    }
}
