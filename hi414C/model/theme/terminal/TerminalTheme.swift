//
//  TerminalTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

import SwiftUI

struct TerminalTheme {
    var cathode: Cathode
    var grid: Grid
    var help: Help
    var cli: CommandLine
    var hli: HelpLine
    
    struct Cathode {
        var blurIn: Color
        var background: Color
        var wave: Color
    }
    
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
        var hint: ViewTheme
        var settings: Settings
        
        struct History {
            var robot: ViewTheme
            var al: ViewTheme
        }
        
        struct Settings {
            var active: LiteFigletTheme
            var passive: LiteFigletTheme
            var background: Background
        }
        
        struct Background {
            var active: Color
            var passive: Color
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
    
    struct HelpLine {
        var background: Color
        var button: Button
        var select: Select
        
        struct Button {
            var active: ViewTheme
            var passive: ViewTheme
            var background: Background
        }
        
        struct Select {
            var button: ViewTheme
            var messageButton: ViewTheme
            var background: Background
        }
        
        struct Background {
            var active: Color
            var passive: Color
        }
    }
}
