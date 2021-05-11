//
//  Item.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.05.2021.
//

import SwiftUI

struct Item<T>: Identifiable {
    var id: UUID
    var content: T
    
    init(id: UUID = UUID(), _ content: T) {
        self.id = id
        self.content = content
    }
}
