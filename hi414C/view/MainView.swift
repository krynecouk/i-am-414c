//
//  MainView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct MainView<Content: View> : View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
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
            .padding(30)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView {
            FigletBanner("test")
            FigletBanner("really")
        }
    }
}
