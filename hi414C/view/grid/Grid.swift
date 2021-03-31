//
//  Grid.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct Grid<Content: View> : View {
    let content: Content
    let padding: CGFloat
    
    init(padding: CGFloat = 20, @ViewBuilder content: () -> Content) {
        self.padding = padding
        self.content = content()
    }
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 60, maximum: .infinity)),
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                content
            }
            .padding(self.padding)
        }
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid {
            Group {
                ForEach(0..<40) {i in
                    FigletView(String(i))
                }
            }
        }
    }
}
