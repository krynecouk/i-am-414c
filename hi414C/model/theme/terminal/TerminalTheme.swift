//
//  TerminalTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

import SwiftUI

struct TerminalTheme {
    var grid: Grid
    var help: Help
    var cli: CommandLine
    
    struct Grid {
        var art: ArtTheme
        var symbol: FigletTheme
        var test: TestTheme
        var message: MessageTheme
    }
    
    struct Help {
        var background: Color
        var test: TestTheme
        var message: MessageTheme
        var history: History
        var answer: ViewTheme
        
        struct History {
            var _414C: FigletTheme
            var AL: ViewTheme
        }
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
