//
//  Themable.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

protocol Themable {
    var font: FontTheme { get }
    var terminal: TerminalTheme { get }
    var keyboard: KeyboardTheme { get }
}
