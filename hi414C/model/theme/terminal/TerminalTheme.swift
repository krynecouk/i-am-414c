//
//  TerminalTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

import SwiftUI

struct TerminalTheme {
    var commandLine: CommandLine
    
    struct CommandLine {
        var view: ViewTheme
        var prompt: ViewTheme
        var cursor: Cursor
        var text: Text
    
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
