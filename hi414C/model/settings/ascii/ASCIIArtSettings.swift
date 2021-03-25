//
//  ASCIIArtSettings.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

import SwiftUI

struct FigletSettings {
    var typeface: FigletTypeface = .ansi()
    var view: ViewSettings = ViewSettings()
    var animations: [ASCIIArtAnimation] = [.print(dt: 0.3), .shake(dt: 0.8, force: 1, .wave)]
}

struct ASCIIArtSettings {
    var view: ViewSettings = ViewSettings()
    var animations: [ASCIIArtAnimation] = [.print(dt: 0.3), .shake(dt: 0.8, force: 1, .wave)]
}

enum ASCIIArtAnimation {
    case print(dt: Double = 0.3, Animation? = .linear)
    case shake(dt: Double = 0.4, force: Float = 0.8, ASCIIArtShakeType = .wave)
}
