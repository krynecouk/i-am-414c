//
//  Theme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

import SwiftUI

struct FontSize: Encodable, Decodable {
    var robot: CGFloat = 13
    var robotMsg: CGFloat = 55
    var al: CGFloat = 60
    var settings: CGFloat = 28

    func inc() -> FontSize {
        if isIncreasable() {
            return FontSize(robot: self.robot + 1, robotMsg: self.robotMsg + 3, al: self.al + 3, settings: self.settings + 2)
        }
        return FontSize()
    }
    
    func dec() -> FontSize {
        if isDecreasable() {
            return FontSize(robot: self.robot - 1, robotMsg: self.robotMsg - 3, al: self.al - 3, settings: self.settings - 2)
        }
        return FontSize()
    }
    
    func reset() -> FontSize {
        FontSize(robot: 13, robotMsg: 55, al: 60, settings: 28)
    }
    
    func isIncreasable() -> Bool {
        robot < 15
    }
    
    func isDecreasable() -> Bool {
        robot > 6 && al > 20
    }
}

struct FontTheme {
    let robot: FontProps
    let robotMsg: FontProps
    let al: FontProps
    let settings: FontProps
    
    init(robot: FontProps = FontProps(.terminus, 13), robotMsg: FontProps = FontProps(.ansiRegular, 55), al: FontProps = FontProps(.proggyTiny, 60), settings: FontProps = FontProps(.ansiRegular, 28)) {
        self.robot = robot
        self.robotMsg = robotMsg
        self.al = al
        self.settings = settings
    }
    
    init(size: FontSize = FontSize()) {
        self.init(robot: FontProps(.terminus, size.robot), robotMsg: FontProps(.ansiRegular, size.robotMsg), al: FontProps(.proggyTiny, size.al), settings: FontProps(.ansiRegular, size.settings))
    }
}

typealias ContrastColor = (value: Color, contrast: Color)

struct ColorTheme {
    var primary: ContrastColor
    var secondary: ContrastColor
    var tertiary: ContrastColor
    var background: Color
}

class Theme: Themable {
    var type: ThemeType { .generic }
    private(set) var font: FontTheme
    private(set) var color: ColorTheme
    var terminal: TerminalTheme
    var keyboard: KeyboardTheme
    var intro: IntroTheme
    
    init(font: FontTheme, color: ColorTheme) {
        self.font = font
        self.color = color
        self.terminal = Theme.terminal(font: font, color: color)
        self.keyboard = Theme.keyboard(font: font, color: color)
        self.intro = Theme.intro(font: font, color: color)
    }
    
    static func intro(font: FontTheme, color: ColorTheme) -> IntroTheme {
        IntroTheme(
            cursor: TerminalTheme.CommandLine.Cursor(
                view: ViewTheme(
                    color: color.primary.value,
                    background: color.primary.value
                ),
                blink: (0.6, .easeOut)
            ),
            banner: FigletTheme(
                typeface: .ansi(.shadow),
                view: ViewTheme(
                    font: FontProps(.terminus, 23),
                    color: color.primary.value
                ),
                animations: [.print(dt: 0.4, delay: 0.3), .bloom(speed: 0.3, color: color.primary.value)]
            ),
            text: ViewTheme(
                font: FontProps(.proggyTiny, 32),
                color: color.primary.value
            ),
            finish: ModalTheme(
                header: ViewTheme(
                    font: FontProps(.proggyTiny, 32),
                    color: color.secondary.contrast,
                    background: color.secondary.value
                ),
                body: ViewTheme(
                    font: FontProps(.proggyTiny, 32),
                    color: color.tertiary.contrast,
                    background: color.tertiary.value
                ),
                button: ViewTheme(
                    font: FontProps(.proggyTiny, 32),
                    color: color.primary.contrast,
                    background: color.primary.value
                )
            )
        )
    }
    
    static func terminal(font: FontTheme, color: ColorTheme) -> TerminalTheme {
        TerminalTheme(
            cathode: TerminalTheme.Cathode(
                blurIn: color.primary.value.opacity(0.8),
                background: color.background,
                wave: color.primary.value
            ),
            grid: TerminalTheme.Grid(
                art: ArtTheme(
                    view: ViewTheme(
                        font: font.robot,
                        color: color.primary.value
                    ),
                    animations: [.print(dt: 0.3, animation: .none)]
                ),
                symbol: FigletTheme(
                    typeface: .ansi(.regular),
                    view: ViewTheme(
                        font: font.robot,
                        color: color.primary.value
                    ),
                    animations: [.print(delay: 0.5), .bloom(speed: 0.8, color: color.primary.value)],
                    shadow: true
                ),
                test: TestTheme(
                    active: TestTheme.Active(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.primary.value
                            )
                        ),
                        sign: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.secondary.contrast.opacity(0.7)
                            )
                        )
                    ),
                    passive: TestTheme.Passive(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.primary.value.opacity(0.2)
                            )
                        ),
                        sign: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.secondary.contrast.opacity(0.7)
                            )
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
                            color: color.primary.value
                        ),
                        animations: [
                            .print(dt: 0.3, delay: 0, animation: .none),
                            //.shake(dt: 0.8, force: 1, type: .wave, animation: .none),
                            .bloom(speed: 0.4, color: color.primary.value)
                        ],
                        shadow: true
                    )
                )
            ),
            help: TerminalTheme.Help(
                background: color.primary.value.opacity(0.8),
                test: TestTheme(
                    active: TestTheme.Active(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.primary.contrast
                            )
                        ),
                        sign: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.tertiary.contrast.opacity(0.7)
                            )
                        )
                    ),
                    // not needed
                    passive: TestTheme.Passive(
                        figlet: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.primary.value.opacity(0.2)
                            )
                        ),
                        sign: LiteFigletTheme(
                            typeface: .ansi(.regular),
                            view: ViewTheme(
                                font: font.robot,
                                color: color.tertiary.value.opacity(0.2)
                            )
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
                            color: color.secondary.value
                        ),
                        animations: []
                    )
                ),
                history: TerminalTheme.Help.History(
                    robot: ViewTheme(
                        font: FontProps(font.robotMsg.name, font.robotMsg.size),
                        color: color.secondary.contrast.opacity(0.7),
                        background: color.secondary.value
                    ),
                    al: ViewTheme(
                        font: FontProps(font.al.name, font.al.size - 9),
                        color: color.secondary.contrast.opacity(0.7),
                        background: color.secondary.value
                    )
                ),
                hint: ViewTheme(
                    font: FontProps(.proggyTiny, 32),
                    color: color.secondary.contrast,
                    background: color.secondary.value
                ),
                settings: TerminalTheme.Help.Settings(
                    active: ViewTheme(
                        font: FontProps(font.settings.name, font.settings.size),
                        color: color.secondary.contrast.opacity(0.7)
                    ),
                    passive: ViewTheme(
                        font: FontProps(font.settings.name, font.settings.size),
                        color: color.tertiary.contrast.opacity(0.7)
                    ),
                    background: TerminalTheme.Help.Background(
                        active: color.secondary.value,
                        passive: color.tertiary.value
                    )
                )
            ),
            cli: TerminalTheme.CommandLine(
                view: ViewTheme(
                    background: color.primary.value
                ),
                prompt: TerminalTheme.CommandLine.Prompt(
                    figlet: FigletTheme(
                        typeface: .ansi(.regular),
                        view: ViewTheme(
                            font: FontProps(.terminus, 6),
                            color: color.primary.contrast
                        ),
                        animations: []
                    )
                ),
                cursor: TerminalTheme.CommandLine.Cursor(
                    view: ViewTheme(
                        color: color.primary.contrast,
                        background: color.primary.contrast
                    ),
                    blink: (1, .linear)
                ),
                text: TerminalTheme.CommandLine.Text(
                    view: ViewTheme(
                        font: FontProps(.proggyTiny, 55),
                        color: color.primary.contrast
                    ),
                    bloom: (1, color.primary.contrast)
                )
            ),
            hli: TerminalTheme.HelpLine(
                background: color.secondary.value,
                button: TerminalTheme.HelpLine.Button(
                    active: ViewTheme(
                        font: FontProps(.proggyTiny, 32),
                        color: color.tertiary.contrast
                    ),
                    passive: ViewTheme(
                        font: FontProps(.proggyTiny, 32),
                        color: color.secondary.contrast
                    ),
                    background: TerminalTheme.HelpLine.Background(
                        active: color.tertiary.value,
                        passive: color.secondary.value
                    )
                ),
                quit: ViewTheme(
                    font: FontProps(.proggyTiny, 40),
                    color: color.secondary.contrast
                ),
                select: TerminalTheme.HelpLine.Select(
                    button: ViewTheme(
                        font: FontProps(.proggyTiny, 32),
                        color: color.primary.contrast,
                        background: color.primary.value
                    ),
                    messageButton: ViewTheme(
                        font: FontProps(.proggyTiny, 46),
                        color: color.secondary.contrast.opacity(0.8),
                        background: color.secondary.value
                    ),
                    noMessageButton: ViewTheme(
                        font: FontProps(.proggyTiny, 46),
                        color: color.secondary.contrast.opacity(0.3),
                        background: color.secondary.value.opacity(0.3)
                    ),
                    background: TerminalTheme.HelpLine.Background(
                        active: color.tertiary.value,
                        passive: color.secondary.value
                    )
                )
            )
        )
    }
    
    static func keyboard(font: FontTheme, color: ColorTheme) -> KeyboardTheme {
        KeyboardTheme(
            view: ViewTheme(
                opacity: 1,
                background: color.primary.value
            ),
            key: KeyboardTheme.Key(
                default: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.tertiary.contrast,
                    background: color.tertiary.value
                ),
                decrypted: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.secondary.contrast,
                    background: color.secondary.value
                ),
                ABC: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.secondary.contrast,
                    background: color.secondary.value
                ),
                BS: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.secondary.contrast,
                    background: color.secondary.value
                ),
                CR: ViewTheme(
                    font: FontProps(.proggyTiny, 35),
                    color: color.secondary.contrast,
                    background: color.secondary.value
                )
            )
        )
    }
}
