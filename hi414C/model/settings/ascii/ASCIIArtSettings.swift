//
//  ASCIIArtSettings.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

typealias FigletSettings = ASCIIArtSettings

struct ASCIIArtSettings {
    var view: ViewSettings = ViewSettings()
    var animations: [Animation] = [.print(dt: 0.3), .shake(dt: 0.8, force: 1, .wave)]
    
    enum Animation {
        case print(dt: Double = 0.3)
        case shake(dt: Double = 0.4, force: Float = 0.8, ASCIIArtShakeType = .wave)
    }
}
