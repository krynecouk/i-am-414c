//
//  TerminalTestTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

import SwiftUI

struct TestTheme {
    var active: Active
    var passive: Passive
    var animation: TestAnimation
    
    struct Active {
        var figlet: LiteFigletTheme
        var sign: FigletTheme
    }
    
    struct Passive {
        var figlet: LiteFigletTheme
        var sign: FigletTheme
    }
    
    struct TestAnimation {
        var detail: Animation?
        var symbol: Animation?
    }
}
