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

typealias ContrastColor = (bg: Color, fg: Color)

struct ColorTheme {
    var primary: ContrastColor
    var secondary: ContrastColor
    var tertiary: ContrastColor
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
                blurIn: color.primary.bg.opacity(0.8),
                background: color.background,
                wave: color.primary.bg
            ),
            grid: TerminalTheme.Grid(
                art: ArtTheme(
                    view: ViewTheme(
                        font: font.robot,
                        color: color.primary.bg
                    ),
                    animations: [.print(speed: 0.3, animation: .linear)]
                ),
                symbol: FigletTheme(
                    typeface: .ansi(.regular),
                    view: ViewTheme(
                        font: font.robot,
                        color: color.primary.bg
                    ),
                    animations: [.print(delay: 0.5), .bloom(speed: 0.8, color: color.primary.bg)]
                ),
                test: TestTheme(
                    active: TestTheme.Active(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.primary.bg
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.tertiary.bg
                            ),
                            animations: []
                        )
                    ),
                    passive: TestTheme.Passive(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.primary.bg.opacity(0.2)
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.tertiary.bg.opacity(0.2)
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
                            color: color.primary.bg
                        ),
                        animations: [.print(), .bloom(speed: 1, color: color.primary.bg)]
                    )
                )
            ),
            help: TerminalTheme.Help(
                background: color.primary.bg.opacity(0.7),
                test: TestTheme(
                    active: TestTheme.Active(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.secondary.bg
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.tertiary.bg
                            ),
                            animations: []
                        )
                    ),
                    passive: TestTheme.Passive(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.primary.bg.opacity(0.2)
                            )
                        ),
                        sign: FigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.tertiary.bg.opacity(0.2)
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
                            color: color.secondary.bg
                        ),
                        animations: []
                    )
                ),
                history: TerminalTheme.Help.History(
                    robot: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: font.robot,
                            color: color.primary.bg,
                            background: color.secondary.bg
                        ),
                        animations: []
                    ),
                    al: ViewTheme(
                        font: font.al,
                        color: color.primary.bg,
                        background: color.secondary.bg
                    )
                ),
                hint: ViewTheme(
                    font: FontProps(.proggyTiny, 32),
                    color: color.secondary.fg,
                    background: color.secondary.bg
                )
            ),
            cli: TerminalTheme.CommandLine(
                view: ViewTheme(
                    background: color.primary.bg
                ),
                prompt: TerminalTheme.CommandLine.Prompt(
                    figlet: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: FontProps(.terminus, 6),
                            color: color.primary.fg
                        ),
                        animations: []
                    )
                ),
                cursor: TerminalTheme.CommandLine.Cursor(
                    view: ViewTheme(
                        color: color.primary.fg,
                        background: color.primary.fg
                    ),
                    blink: (1, .linear)
                ),
                text: TerminalTheme.CommandLine.Text(
                    view: ViewTheme(
                        font: FontProps(.proggyTiny, 55),
                        color: color.primary.fg
                    ),
                    bloom: (1, color.primary.fg)
                )
            ),
            hli: TerminalTheme.HelpLine(
                background: color.secondary.bg,
                button: TerminalTheme.HelpLine.Button(
                    view: ViewTheme(
                        font: FontProps(.proggyTiny, 32),
                        color: color.secondary.fg
                    ),
                    background: TerminalTheme.HelpLine.Background(
                        active: color.tertiary.bg,
                        passive: .clear
                    )
                ),
                select: TerminalTheme.HelpLine.Select(
                    button: ViewTheme(
                        font: FontProps(.proggyTiny, 32),
                        color: color.secondary.fg,
                        background: color.primary.bg
                    ),
                    background: TerminalTheme.HelpLine.Background(
                        active: color.tertiary.bg,
                        passive: color.secondary.bg
                    )
                )
            )
        )
    }
    
    static func keyboard(font: FontTheme, color: ColorTheme) -> KeyboardTheme {
        KeyboardTheme(
            view: ViewTheme(
                opacity: 1,
                background: color.primary.bg
            ),
            key: KeyboardTheme.Key(
                default: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.tertiary.fg,
                    background: color.tertiary.bg
                ),
                special: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.secondary.fg,
                    background: color.secondary.bg
                ),
                ABC: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.secondary.fg,
                    background: color.secondary.bg
                ),
                BS: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.secondary.fg,
                    background: color.secondary.bg
                ),
                CR: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.secondary.fg,
                    background: color.secondary.bg
                )
            )
        )
    }
}
