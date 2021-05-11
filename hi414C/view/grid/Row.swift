//
//  Row.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 29.04.2021.
//

import SwiftUI

struct Row<Content: View>: View {
    let size: Int
    let content: () -> Content
    let contentLength: Int

    init(size: Int, contentLength: Int, @ViewBuilder content: @escaping () -> Content) {
        self.size = size
        self.content = content
        self.contentLength = contentLength
    }
     
    var body: some View {
        content()
        
        if size > 0 {
            let mod = contentLength % size
            if mod > 0 {
                ForEach((0 ..< (size - mod)).map { Item($0) }) { _ in
                    Color.clear
                }
            }
        }
    }
}

