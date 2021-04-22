//
//  Themable.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

protocol Themable {
    static var terminal: TerminalTheme { get }
    static var keyboard: KeyboardTheme { get }
}
