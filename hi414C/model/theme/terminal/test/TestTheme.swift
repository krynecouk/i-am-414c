//
//  TerminalTestTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

import SwiftUI

struct TestTheme {
    var figlet: LiteFigletTheme
    var sign: LiteFigletTheme
    var animation: TestAnimation
    
    struct TestAnimation {
        var detail: Animation?
        var symbol: Animation?
    }
}
