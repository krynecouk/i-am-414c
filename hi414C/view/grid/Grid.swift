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
    let top: CGFloat
    let showsIndicators: Bool
    let alignment: HorizontalAlignment
    let columns: [GridItem]
    
    init(
        columns: [GridItem] = [GridItem(.adaptive(minimum: 60, maximum: .infinity))],
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat = 10,
        padding: CGFloat = 20,
        top: CGFloat = 0,
        showsIndicators: Bool = false,
        @ViewBuilder content: () -> Content) {
                
        self.columns = columns
        self.alignment = alignment
        self.spacing = spacing
        self.padding = padding
        self.top = top
        self.showsIndicators = showsIndicators
        self.content = content()
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: self.showsIndicators) {
            LazyVGrid(columns: columns, alignment: alignment, spacing: spacing) {
                content
            }
            .padding(self.padding)
            .padding(.top, top)
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
