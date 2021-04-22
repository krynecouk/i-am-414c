//
//  TerminalTestTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

import SwiftUI

struct TestTheme {
    var symbol: Symbol
    var test: Test
    
    struct Symbol {
        var figlet: FigletTheme
    }
    
    struct Test {
        var active: Active
        var passive: Passive
        var animation: TestAnimation
        
        struct Active {
            var figlet: LiteFigletTheme
            var op: FigletTheme
        }
        
        struct Passive {
            var figlet: LiteFigletTheme
            var op: FigletTheme
        }
        
        struct TestAnimation {
            var detail: Detail
            var symbol: Animation?
            
            struct Detail {
                var active: Animation?
                var passive: Animation?
            }
        }
    }
}
