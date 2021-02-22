//
//  FontManager.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.02.2021.
//

import Foundation
import SwiftUI

// TODO singleton class
struct FontManager {
    
    static func fontFamilies() -> [String] {
        UIFont.familyNames
    }
    
    struct ModernTerminus {
        static let terminus = "Terminus (TTF)"
    }
    
}
