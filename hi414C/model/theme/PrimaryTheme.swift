//
//  PrimaryTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

import SwiftUI

struct PrimaryTheme: Themable {
    
    static var terminal: TerminalTheme = TerminalTheme(
        grid: TerminalTheme.Grid(
            art: ArtTheme(
                view: ViewTheme(
                    font: (name: .terminus, size: 13),
                    color: .primary
                ),
                animations: [.print(speed: 0.3, animation: .linear), .shake(speed: 0.8, force: 1, type: .wave)]
            ),
            symbol: FigletTheme(
                typeface: .ansi(.regular),
                view: ViewTheme(
                    font: (name: .terminus, size: 13),
                    color: Color.primary.opacity(0.2)
                ),
                animations: [.print(delay: 0.5), .bloom(speed: 0.8, color: .primary)]
            ),
            test: TestTheme(
                
                active: TestTheme.Active(
                    figlet: LiteFigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: .primary
                        )
                    ),
                    sign: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: .gray
                        ),
                        animations: [.shake(speed: 0.8, force: 1, type: .wave)]
                    )
                ),
                passive: TestTheme.Passive(
                    figlet: LiteFigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: Color.primary.opacity(0.2)
                        )
                    ),
                    sign: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: Color.gray.opacity(0.2)
                        ),
                        animations: []
                    )
                ),
                animation: TestTheme.TestAnimation(
                    detail: Animation.spring().speed(0.8),
                    symbol: Animation.spring().speed(0.8)
                )
            ),
            message: MessageTheme(
                figlet: FigletTheme(
                    typeface: .ansi(.shadow),
                    view: ViewTheme(
                        font: (name: .terminus, size: 13),
                        color: .primary
                    ),
                    animations: [.print(), .shake(speed: 0.8, force: 1, type: .wave), .bloom(speed: 1, color: .primary)]
                )
            )
        ),
        help: TerminalTheme.Help(
            background: Color.primary.opacity(0.7),
            test: TestTheme(
                active: TestTheme.Active(
                    figlet: LiteFigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: .primary
                        )
                    ),
                    sign: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: .gray
                        ),
                        animations: [.shake(speed: 0.8, force: 1, type: .wave)]
                    )
                ),
                passive: TestTheme.Passive(
                    figlet: LiteFigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: Color.primary.opacity(0.2)
                        )
                    ),
                    sign: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: (name: .terminus, size: 13),
                            color: Color.gray.opacity(0.2)
                        ),
                        animations: []
                    )
                ),
                animation: TestTheme.TestAnimation(
                    detail: Animation.spring().speed(0.8),
                    symbol: Animation.spring().speed(0.8)
                )
            ),
            message: MessageTheme(
                figlet: FigletTheme(
                    typeface: .ansi(.shadow),
                    view: ViewTheme(
                        font: (name: .terminus, size: 13),
                        color: .black
                    ),
                    animations: [.shake(speed: 0.8, force: 1, type: .wave)]
                )
            ),
            history: TerminalTheme.Help.History(
                _414C: FigletTheme(
                    typeface: .ansi(.shadow),
                    view: ViewTheme(
                        font: (name: .terminus, size: 13),
                        color: .gray
                    ),
                    animations: []
                ),
                AL: FigletTheme(
                    typeface: .ansi(.regular),
                    view: ViewTheme(
                        font: (name: .terminus, size: 13),
                        color: .gray
                    ),
                    animations: []
                )
            ),
            answer: FigletTheme(
                typeface: .ansi(.regular),
                view: ViewTheme(
                    font: (name: .terminus, size: 13),
                    color: .gray
                ),
                animations: []
            )
        ),
        cli: TerminalTheme.CommandLine(
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
        ),
        hli: TerminalTheme.HelpLine(
            background: Color("BlackBck"),
            button: TerminalTheme.HelpLine.Button(
                view: ViewTheme(
                    font: (.proggyTiny, 32),
                    color: .white
                ),
                background: TerminalTheme.HelpLine.Background(
                    active: Color("GoldBck"),
                    passive: .clear
                )
            ),
            select: TerminalTheme.HelpLine.Select(
                button: ViewTheme(
                    font: (.proggyTiny, 29),
                    color: .white,
                    background: .primary
                ),
                background: TerminalTheme.HelpLine.Background(
                    active: Color("GoldBck"),
                    passive: Color("BlackBck")
                )
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
}
