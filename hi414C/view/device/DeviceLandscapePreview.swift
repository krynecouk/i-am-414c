//
//  DeviceLandscapePreview.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.03.2021.
//

import SwiftUI

#if DEBUG

struct Landscape<Content>: View where Content: View {
    let content: () -> Content
    let height = UIScreen.main.bounds.width //toggle width height
    let width = UIScreen.main.bounds.height
    var body: some View {
        content().previewLayout(PreviewLayout.fixed(width: width, height: height))
    }
}

struct LightAndDark<Content>: View where Content: View {
    let content: () -> Content
    var body: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            content().environment(\.colorScheme, colorScheme).previewDisplayName("\(colorScheme)")
        }
    }
}

#endif
