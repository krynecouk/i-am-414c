//
//  Row.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 29.04.2021.
//

import SwiftUI

struct Row<Content: View, Item: Identifiable>: View {
    let items: [Item]
    let size: Int
    let content: (Item) -> Content

    init(of items: [Item], size: Int, @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        self.size = size
        self.content = content
    }
    
    var body: some View {
        ForEach(items) { item in
            content(item)
        }
        
        ForEach(0 ..< (size - (items.count % size))) { _ in
            Color.clear
        }
    }
}

