//
//  FontName.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.03.2021.
//

import Foundation
import SwiftUI

enum FontName: String {

    static func fontFamilies() -> [String] {
        UIFont.familyNames
    }
    
    case terminus = "Terminus (TTF)"
    case proggyTiny = "ProggyTinyTTSZ"
}
