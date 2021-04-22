//
//  ASCIITestTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

import SwiftUI

struct ASCIITestTheme {
    var symbol: Symbol
    var test: Test
    
    struct Symbol {
        var figlet: FigletTheme
    }
    
    struct Test {
        var active: Active
        var passive: Passive
        var symbol: Animation
        var detail: Animation
        
        struct Active {
            var figlet: LiteFigletTheme
            var op: FigletTheme
        }
        
        struct Passive {
            var figlet: LiteFigletTheme
            var op: FigletTheme
        }
    }
}
