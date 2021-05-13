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
    var primary: Color
    var secondary: Color
    var tertiary: Color
    var background: Color
}

class Theme: Themable {
    private(set) var font: FontTheme
    private(set) var color: ColorTheme
    var terminal: TerminalTheme
    var keyboard: KeyboardTheme
    
    init(font: FontTheme, color: ColorTheme) {
        self.font = font
        self.color = color
        self.terminal = Theme.terminal(font: font, color: color)
        self.keyboard = Theme.keyboard(font: font, color: color)
    }
    
    static func terminal(font: FontTheme, color: ColorTheme) -> TerminalTheme {
        TerminalTheme(
            cathode: TerminalTheme.Cathode(
                blurIn: color.primary.opacity(0.8),
                background: color.background,
                wave: color.primary
            ),
            grid: TerminalTheme.Grid(
                art: ArtTheme(
                    view: ViewTheme(
                        font: font.robot,
                        color: color.primary
                    ),
                    animations: [.print(speed: 0.3, animation: .linear)]
                ),
                symbol: FigletTheme(
                    typeface: .ansi(.regular),
                    view: ViewTheme(
                        font: font.robot,
                        color: color.primary
                    ),
                    animations: [.print(delay: 0.5), .bloom(speed: 0.8, color: color.primary)]
                ),
                test: TestTheme(
                    active: TestTheme.Active(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.primary
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.tertiary
                            ),
                            animations: []
                        )
                    ),
                    passive: TestTheme.Passive(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.primary.opacity(0.2)
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.tertiary.opacity(0.2)
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
                            color: color.primary
                        ),
                        animations: [.print(), .bloom(speed: 1, color: color.primary)]
                    )
                )
            ),
            help: TerminalTheme.Help(
                background: color.primary.opacity(0.7),
                test: TestTheme(
                    active: TestTheme.Active(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.secondary
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.tertiary
                            ),
                            animations: []
                        )
                    ),
                    passive: TestTheme.Passive(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.primary.opacity(0.2)
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.tertiary.opacity(0.2)
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
                            color: color.secondary
                        ),
                        animations: []
                    )
                ),
                history: TerminalTheme.Help.History(
                    robot: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: font.robot,
                            color: color.primary,
                            background: color.secondary
                        ),
                        animations: []
                    ),
                    al: ViewTheme(
                        font: font.al,
                        color: color.primary,
                        background: color.secondary
                    )
                ),
                hint: ViewTheme(
                    background: color.secondary
                )
            ),
            cli: TerminalTheme.CommandLine(
                view: ViewTheme(
                    background: color.primary
                ),
                prompt: TerminalTheme.CommandLine.Prompt(
                    figlet: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: FontProps(.terminus, 6),
                            color: color.secondary
                        ),
                        animations: []
                    )
                ),
                cursor: TerminalTheme.CommandLine.Cursor(
                    view: ViewTheme(
                        color: color.secondary,
                        background: color.secondary
                    ),
                    blink: (1, .linear)
                ),
                text: TerminalTheme.CommandLine.Text(
                    view: ViewTheme(
                        font: FontProps(.proggyTiny, 55),
                        color: color.secondary
                    ),
                    bloom: (1, color.secondary)
                )
            ),
            hli: TerminalTheme.HelpLine(
                background: color.secondary,
                button: TerminalTheme.HelpLine.Button(
                    view: ViewTheme(
                        font: FontProps(.proggyTiny, 32),
                        color: .white
                    ),
                    background: TerminalTheme.HelpLine.Background(
                        active: color.tertiary,
                        passive: .clear
                    )
                ),
                select: TerminalTheme.HelpLine.Select(
                    button: ViewTheme(
                        font: FontProps(.proggyTiny, 32),
                        color: .white,
                        background: color.primary
                    ),
                    background: TerminalTheme.HelpLine.Background(
                        active: color.tertiary,
                        passive: color.secondary
                    )
                ),
                prompt: TerminalTheme.CommandLine.Prompt(
                    figlet: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: FontProps(.terminus, 9),
                            color: color.primary
                        ),
                        animations: []
                    )
                ),
                cursor: TerminalTheme.CommandLine.Cursor(
                    view: ViewTheme(
                        color: color.primary,
                        background: color.primary
                    ),
                    blink: (0.9, .easeIn)
                )
            )
        )
    }
    
    static func keyboard(font: FontTheme, color: ColorTheme) -> KeyboardTheme {
        KeyboardTheme(
            view: ViewTheme(
                opacity: 1,
                background: color.primary
            ),
            key: KeyboardTheme.Key(
                default: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.secondary,
                    background: color.tertiary
                ),
                special: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: .white,
                    background: color.secondary
                ),
                ABC: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: .white,
                    background: color.tertiary
                ),
                BS: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: .white,
                    background: color.tertiary
                ),
                CR: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: .white,
                    background: color.tertiary
                )
            )
        )
    }
}
