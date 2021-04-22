//
//  TerminalTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

import SwiftUI

struct TerminalTheme {
    var grid: Grid
    var cli: CommandLine
    
    struct Grid {
        var art: ArtTheme
        var test: TestTheme
        var message: MessageTheme
    }
    
    struct CommandLine {
        var view: ViewTheme
        var prompt: Prompt
        var cursor: Cursor
        var text: Text
        
        struct Prompt {
            var figlet: FigletTheme
        }
        
        struct Cursor {
            var view: ViewTheme
            var blink: (speed: Double, animation: Animation)
        }
    
        struct Text {
            var view: ViewTheme
            var bloom: (speed: Double, color: Color)
        }
    }
}
