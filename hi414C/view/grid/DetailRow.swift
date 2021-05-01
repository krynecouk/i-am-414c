//
//  DetailRow.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.04.2021.
//

import SwiftUI

struct DetailRow<Content: View, Item>: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    let length: Int
    let wide: Bool
    let content: () -> Content

    init(of length: Int, wide: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.length = length
        self.wide = wide
        self.content = content
    }
    
    init(of items: [Item], wide: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.init(of: items.count, wide: wide, content: content)
    }
    
    init(of item: String, wide: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.init(of: item.count, wide: wide, content: content)
    }
    
    var body: some View {
        Row(size: uiVM.isDetail ? (wide ? 8 : 4) : 0, contentLength: length, content: content)
    }
}
