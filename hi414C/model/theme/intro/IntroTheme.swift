//
//  IntroTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

struct IntroTheme {
    var cursor: TerminalTheme.CommandLine.Cursor
    var banner: FigletTheme
    var text: ViewTheme
    var finish: ModalTheme
}

struct ModalTheme {
    var header: ViewTheme
    var body: ViewTheme
    var button: ViewTheme
}
