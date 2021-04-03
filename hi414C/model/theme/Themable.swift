//
//  Themable.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

protocol Themable {
    static var ascii: ASCIITheme { get }
    static var keyboard: KeyboardTheme { get }
    static var terminal: TerminalTheme { get }
}
