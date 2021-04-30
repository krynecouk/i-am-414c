//
//  DetailRow.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.04.2021.
//

import SwiftUI

struct DetailRow<Content: View, Item>: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    let items: [Item]
    let wide: Bool
    let content: () -> Content

    init(of items: [Item], wide: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.items = items
        self.wide = wide
        self.content = content
    }
    
    var body: some View {
        Row(of: items, size: uiVM.isDetail ? (wide ? 8 : 4) : 0, content: content)
    }
}
