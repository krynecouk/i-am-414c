//
//  MessageRow.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.05.2021.
//

import SwiftUI

struct MessageRow<Content: View>: View {
    let length: Int
    let wide: Bool
    let content: () -> Content

    init(of length: Int, wide: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.length = length
        self.wide = wide
        self.content = content
    }
    
    init(of items: Array<Any>, wide: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.init(of: items.count, wide: wide, content: content)
    }
    
    init(of item: String, wide: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.init(of: item.count, wide: wide, content: content)
    }
    
    init(of item: Substring, wide: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.init(of: item.count, wide: wide, content: content)
    }
    
    var body: some View {
        Row(size: wide ? 10 : 5, contentLength: length, content: content)
    }
}
