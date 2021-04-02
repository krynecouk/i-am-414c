//
//  ASCIIArtLineView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 31.03.2021.
//

import SwiftUI

struct ASCIIArtLineView: View {
    var line: String
    var offset: Offset
    var visible: Bool
    var bloom: Double
    var settings: ViewSettings
    
    init(_ line: String, settings: ViewSettings = ViewSettings(), visible: Bool = false, bloom: Double = 0, offset: Offset = (0,0)) {
        self.line = line
        self.settings = settings
        self.offset = offset
        self.visible = visible
        self.bloom = bloom
    }
    
    var body: some View {
        if visible && bloom > 0 {
            Line()
                .bloomFadeOut(speed: bloom)
        } else {
            Line()
        }
    }
    
    func Line() -> some View {
        Text(line)
            .fixedSize()
            .opacity(visible ? 1 : 0)
            .offset(x: CGFloat(offset.x), y: CGFloat(offset.y))
            .id(visible)
            .withSettings(settings)
    }
}

struct ASCIIArtLineView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            /*
            ASCIIArtLineView(" ██████ ", bloomable: true, bloomSpeed: 1)
            ASCIIArtLineView("██  ████", bloomable: true, bloomSpeed: 1)
            ASCIIArtLineView("██ ██ ██", bloomable: true, bloomSpeed: 1)
            ASCIIArtLineView("████  ██", bloomable: true, bloomSpeed: 1)
            ASCIIArtLineView(" ██████ ", bloomable: true, bloomSpeed: 1)
 */
        }
    }
}
