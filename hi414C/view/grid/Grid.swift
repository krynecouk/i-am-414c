//
//  Grid.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct Grid<Content: View> : View {
    let content: Content
    let spacing: CGFloat
    let padding: CGFloat
    let columns: [GridItem]
    
    init(
        columns: [GridItem] = [GridItem(.adaptive(minimum: 60, maximum: .infinity))],
        spacing: CGFloat = 10,
        padding: CGFloat = 20,
        @ViewBuilder content: () -> Content) {
        
        self.columns = columns
        self.spacing = spacing
        self.padding = padding
        self.content = content()
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
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
