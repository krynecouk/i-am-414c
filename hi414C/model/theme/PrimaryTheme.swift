//
//  PrimaryTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

import SwiftUI

struct PrimaryTheme: Themable {
    
    static var ascii: ASCIITheme = ASCIITheme(
        art: ASCIIArtTheme(
            view: ViewTheme(
                font: (name: .terminus, size: 13),
                color: .primary
            ),
            animations: [.print(dt: 0.3, animation: .linear), .shake(dt: 0.8, force: 1, type: .wave)]
        ),
        test: ASCIITestTheme(
            symbol: ASCIITestTheme.Symbol(
                figlet: FigletTheme(
                    typeface: .ansi(.regular),
                    view: ViewTheme(
                        font: (name: .terminus, size: 13),
                        color: Color.primary.opacity(0.2)
                    ),
                    animations: [.print(), .bloom(speed: 1, color: .primary)]
                )
            ),
            test: ASCIITestTheme.Test(
                active: ASCIITestTheme.Test.Active(
                    figlet: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: .primary
                        ),
                        animations: [.print(), .bloom(speed: 1, color: .primary)]
                    ),
                    special: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: .gray
                        ),
                        animations: [.print(), .bloom(speed: 1, color: .primary)]
                    )
                ),
                passive: ASCIITestTheme.Test.Passive(
                    figlet: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: Color.primary.opacity(0.2)
                        ),
                        animations: [.print(), .bloom(speed: 1, color: .primary)]
                    ),
                    special: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: Color.gray.opacity(0.2)
                        ),
                        animations: [.print(), .bloom(speed: 1, color: .primary)]
                    )
                )
            )
        ),
        message: ASCIIMessageTheme(
            figlet: FigletTheme(
                typeface: .ansi(.regular),
                view: ViewTheme(
                    font: (name: .terminus, size: 13),
                    color: .primary
                ),
                animations: [.print(), .shake(dt: 0.8, force: 1, type: .wave), .bloom(speed: 1, color: .primary)]
            )
        )
    )
    
    static var keyboard: KeyboardTheme = KeyboardTheme(
        view: ViewTheme(
            opacity: 1,
            background: Color("GoldBck") // TODO
        ),
        key: KeyboardTheme.Key(
            default: ViewTheme(
                font: (.proggyTiny, 35),
                color: .black,
                background: .orange
            ),
            special: ViewTheme(
                font: (.proggyTiny, 35),
                color: .black,
                background: .primary
            ),
            ABC: ViewTheme(
                font: (.proggyTiny, 35),
                color: .white,
                background: .gray
            ),
            BS: ViewTheme(
                font: (.proggyTiny, 35),
                color: .white,
                background: .gray
            ),
            CR: ViewTheme(
                font: (.proggyTiny, 35),
                color: .white,
                background: .blue
            )
        )
    )
    
    static var terminal: TerminalTheme = TerminalTheme(
        commandLine: TerminalTheme.CommandLine(
            view: ViewTheme(
                background: Color("GoldBck") // TODO
            ),
            prompt: TerminalTheme.CommandLine.Prompt(
                figlet: FigletTheme(
                    typeface: .ansi(.regular),
                    view: ViewTheme(
                        font: (name: .terminus, size: 6),
                        color: .primary
                    ),
                    animations: []
                )
            ),
            cursor: TerminalTheme.CommandLine.Cursor(
                view: ViewTheme(
                    color: .primary,
                    background: .primary
                ),
                blink: (1, .linear)
            ),
            text: TerminalTheme.CommandLine.Text(
                view: ViewTheme(
                    font: (.proggyTiny, 55),
                    color: .primary
                ),
                bloom: (1, .primary)
            )
        )
    )
}
