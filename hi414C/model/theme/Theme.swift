//
//  Theme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

import SwiftUI

struct FontTheme {
    var robot: FontProps = FontProps(.terminus, 13)
    var al: FontProps = FontProps(.proggyTiny, 60)
}

struct ColorTheme {
    var primary: Color = Color.primary
    var secondary: Color = Color("BlackBck")
    var tertiary: Color = Color.gray
}

class Theme: Themable {
    private(set) var font: FontTheme
    var terminal: TerminalTheme
    var keyboard: KeyboardTheme
    
    init(font: FontTheme) {
        print("PRIMARY THEME")
        self.font = font
        self.terminal = Theme.terminal(font: font)
        self.keyboard = Theme.keyboard(font: font)
    }
    
    static func terminal(font: FontTheme) -> TerminalTheme {
        TerminalTheme(
            grid: TerminalTheme.Grid(
                art: ArtTheme(
                    view: ViewTheme(
                        font: font.robot,
                        color: .primary
                    ),
                    animations: [.print(speed: 0.3, animation: .linear)]
                ),
                symbol: FigletTheme(
                    typeface: .ansi(.regular),
                    view: ViewTheme(
                        font: font.robot,
                        color: Color.primary
                    ),
                    animations: [.print(delay: 0.5), .bloom(speed: 0.8, color: .primary)]
                ),
                test: TestTheme(
                    
                    active: TestTheme.Active(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: .primary
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: .gray
                            ),
                            animations: []
                        )
                    ),
                    passive: TestTheme.Passive(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: Color.primary.opacity(0.2)
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: Color.gray.opacity(0.2)
                            ),
                            animations: []
                        )
                    ),
                    animation: TestTheme.TestAnimation(
                        detail: Animation.easeOut.speed(0.8),
                        symbol: Animation.easeOut.speed(0.8)
                    )
                ),
                message: MessageTheme(
                    figlet: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: font.robot,
                            color: .primary
                        ),
                        animations: [.print(), .bloom(speed: 1, color: .primary)]
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
                                font: font.robot,
                                color: .black
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: .gray
                            ),
                            animations: []
                        )
                    ),
                    passive: TestTheme.Passive(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: Color.primary.opacity(0.2)
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
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
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: font.robot,
                            color: .black
                        ),
                        animations: []
                    )
                ),
                history: TerminalTheme.Help.History(
                    robot: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: font.robot,
                            color: .primary
                        ),
                        animations: []
                    ),
                    al: ViewTheme(
                        font: font.al,
                        color: .primary
                    )
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
                            font: FontProps(.terminus, 6),
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
                        font: FontProps(.proggyTiny, 55),
                        color: .primary
                    ),
                    bloom: (1, .primary)
                )
            ),
            hli: TerminalTheme.HelpLine(
                background: Color("BlackBck"),
                button: TerminalTheme.HelpLine.Button(
                    view: ViewTheme(
                        font: FontProps(.proggyTiny, 32),
                        color: .white
                    ),
                    background: TerminalTheme.HelpLine.Background(
                        active: Color("GoldBck"),
                        passive: .clear
                    )
                ),
                select: TerminalTheme.HelpLine.Select(
                    button: ViewTheme(
                        font: FontProps(.proggyTiny, 32),
                        color: .white,
                        background: .primary
                    ),
                    background: TerminalTheme.HelpLine.Background(
                        active: Color("GoldBck"),
                        passive: Color("BlackBck")
                    )
                ),
                prompt: TerminalTheme.CommandLine.Prompt(
                    figlet: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: FontProps(.terminus, 9),
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
                    blink: (0.9, .easeIn)
                )
            )
        )
    }
    
    static func keyboard(font: FontTheme) -> KeyboardTheme {
        KeyboardTheme(
            view: ViewTheme(
                opacity: 1,
                background: Color("GoldBck") // TODO
            ),
            key: KeyboardTheme.Key(
                default: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: .black,
                    background: .orange
                ),
                special: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: .black,
                    background: .primary
                ),
                ABC: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: .white,
                    background: .gray
                ),
                BS: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: .white,
                    background: .gray
                ),
                CR: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: .white,
                    background: .blue
                )
            )
        )
    }
}
