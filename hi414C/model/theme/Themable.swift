//
//  Themable.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

protocol Themable {
    var type: ThemeType { get }
    var font: FontTheme { get }
    var color: ColorTheme { get }
    var intro: IntroTheme { get }
    var terminal: TerminalTheme { get set }
    var keyboard: KeyboardTheme { get }
}
