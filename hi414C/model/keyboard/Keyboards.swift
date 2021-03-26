//
//  Keyboards.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.03.2021.
//

struct Keyboards {
    private init() {}
    static var qwerty: Keyboard =
        [.alphabetic: [
            .row1: [
                KeyboardKey("Q"),
                KeyboardKey("W"),
                KeyboardKey("E"),
                KeyboardKey("R"),
                KeyboardKey("T"),
                KeyboardKey("Y"),
                KeyboardKey("U"),
                KeyboardKey("I"),
                KeyboardKey("O"),
                KeyboardKey("P"),
            ],
            .row2: [
                KeyboardKey("A"),
                KeyboardKey("S"),
                KeyboardKey("D"),
                KeyboardKey("F"),
                KeyboardKey("G"),
                KeyboardKey("H"),
                KeyboardKey("J"),
                KeyboardKey("K"),
                KeyboardKey("L"),
            ],
            .row3: [
                KeyboardKey("Z"),
                KeyboardKey("X"),
                KeyboardKey("C"),
                KeyboardKey("V"),
                KeyboardKey("B"),
                KeyboardKey("N"),
                KeyboardKey("M"),
            ],
            .space: [
                KeyboardKey("SPC", value: " ")
            ]
        ],
        .numeric: [
            .row1: [
                KeyboardKey("1"),
                KeyboardKey("2"),
                KeyboardKey("3"),
                KeyboardKey("4"),
                KeyboardKey("5"),
                KeyboardKey("6"),
                KeyboardKey("7"),
                KeyboardKey("8"),
                KeyboardKey("9"),
                KeyboardKey("0"),
            ],
            .row2: [
                KeyboardKey("-"),
                KeyboardKey("/"),
                KeyboardKey(":"),
                KeyboardKey(";"),
                KeyboardKey("("),
                KeyboardKey(")"),
                KeyboardKey("$"),
                KeyboardKey("&"),
                KeyboardKey("@"),
                KeyboardKey("\""),
            ],
            .row3: [
                KeyboardKey("."),
                KeyboardKey(","),
                KeyboardKey("?"),
                KeyboardKey("!"),
                KeyboardKey("'"),
            ],
            .space: [
                KeyboardKey("SPC", value: " ")
            ]
        ]
        ]
}
