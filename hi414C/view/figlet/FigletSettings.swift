//
//  FigletSettings.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.03.2021.
//

import SwiftUI

struct FigletSettings {
    var typeface: FigletTypeface = .ansi()
    var animations: [FigletAnimation] = []
    var offset: CGFloat = 0
    var isVisible: Bool = false
    var color: Color = Color("Primary")
    var fontName: FontName = .terminus
    var fontSize: CGFloat = 13
}
