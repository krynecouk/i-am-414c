//
//  Tests.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

class Tests {
    private init() {}
    static var tests: [ASCIISymbol: [Testable]] = [
        .NUL: [
            ASCIITest(symbol: .NUL),
        ],
        .SOH: [
            ASCIITest(symbol: .SOH),
        ],
        .STX: [
            ASCIITest(symbol: .STX),
        ],
        .ETX: [
            ASCIITest(symbol: .ETX),
        ],
        .EOT: [
            ASCIITest(symbol: .EOT),
        ],
        .ENQ: [
            ASCIITest(symbol: .ENQ),
        ],
        .ACK: [
            ASCIITest(symbol: .ACK),
        ],
        .BEL: [
            ASCIITest(symbol: .BEL),
        ],
        .BS: [
            ASCIITest(symbol: .BS),
        ],
        .HT: [
            ASCIITest(symbol: .HT),
        ],
        .LF: [
            ASCIITest(symbol: .LF),
        ],
        .VT: [
            ASCIITest(symbol: .VT),
        ],
        .FF: [
            ASCIITest(symbol: .FF),
        ],
        .CR: [
            ASCIITest(symbol: .CR),
        ],
        .SO: [
            ASCIITest(symbol: .SO),
        ],
        .SI: [
            ASCIITest(symbol: .SI),
        ],
        .DLE: [
            ASCIITest(symbol: .DLE),
        ],
        .DC1: [
            ASCIITest(symbol: .DC1),
        ],
        .DC2: [
            ASCIITest(symbol: .DC2),
        ],
        .DC3: [
            ASCIITest(symbol: .DC3),
        ],
        .DC4: [
            ASCIITest(symbol: .DC4),
        ],
        .NAK: [
            ASCIITest(symbol: .NAK),
        ],
        .SYN: [
            ASCIITest(symbol: .SYN),
        ],
        .ETB: [
            ASCIITest(symbol: .ETB),
        ],
        .CAN: [
            ASCIITest(symbol: .CAN),
        ],
        .EM: [
            ASCIITest(symbol: .EM),
        ],
        .SUB: [
            ASCIITest(symbol: .SUB),
        ],
        .ESC: [
            ASCIITest(symbol: .ESC),
        ],
        .FS: [
            ASCIITest(symbol: .FS),
        ],
        .GS: [
            ASCIITest(symbol: .GS),
        ],
        .RS: [
            ASCIITest(symbol: .RS),
        ],
        .US: [
            ASCIITest(symbol: .US),
        ],
        .space: [
            ASCIITest(symbol: .space),
        ],
        .exclamationMark: [
            ASCIITest(symbol: .exclamationMark),
        ],
        .doubleQuote: [
            ASCIITest(symbol: .doubleQuote),
        ],
        .hash: [
            ASCIITest(symbol: .hash),
        ],
        .dollar: [
            ASCIITest(symbol: .dollar),
        ],
        .percent: [
            ASCIITest(symbol: .percent),
        ],
        .ampersand: [
            ASCIITest(symbol: .ampersand),
        ],
        .singleQuote: [
            ASCIITest(symbol: .singleQuote),
        ],
        .leftParen: [
            ASCIITest(symbol: .leftParen),
        ],
        .rightParen: [
            ASCIITest(symbol: .rightParen),
        ],
        .asterisk: [
            ASCIITest(symbol: .asterisk),
        ],
        .plus: [
            ASCIITest(symbol: .plus),
        ],
        .comma: [
            ASCIITest(symbol: .comma),
        ],
        .dash: [
            ASCIITest(symbol: .dash),
        ],
        .dot: [
            ASCIITest(symbol: .dot),
        ],
        .slash: [
            ASCIITest(symbol: .slash),
        ],
        .zero: [
            ASCIITest(symbol: .zero),
        ],
        .one: [
            ASCIITest(symbol: .one),
        ],
        .two: [
            ASCIITest(symbol: .two),
        ],
        .three: [
            ASCIITest(symbol: .three),
        ],
        .four: [
            ASCIITest(symbol: .four),
        ],
        .five: [
            ASCIITest(symbol: .five),
        ],
        .six: [
            ASCIITest(symbol: .six),
        ],
        .seven: [
            ASCIITest(symbol: .seven),
        ],
        .eight: [
            ASCIITest(symbol: .eight),
        ],
        .nine: [
            ASCIITest(symbol: .nine),
        ],
        .colon: [
            ASCIITest(symbol: .colon),
        ],
        .semicolon: [
            ASCIITest(symbol: .semicolon),
        ],
        .lessThan: [
            ASCIITest(symbol: .lessThan),
        ],
        .equal: [
            ASCIITest(symbol: .equal),
        ],
        .greaterThan: [
            ASCIITest(symbol: .greaterThan),
        ],
        .questionMark: [
            ASCIITest(symbol: .questionMark),
        ],
        .atSign: [
            ASCIITest(symbol: .atSign),
        ],
        .A: [
            ASCIITest(symbol: .A),
        ],
        .B: [
            ASCIITest(symbol: .B),
        ],
        .C: [
            ASCIITest(symbol: .C),
        ],
        .D: [
            ASCIITest(symbol: .D),
        ],
        .E: [
            ASCIITest(symbol: .E),
        ],
        .F: [
            ASCIITest(symbol: .F),
        ],
        .G: [
            ASCIITest(symbol: .G),
        ],
        .H: [
            ASCIITest(symbol: .H),
        ],
        .I: [
            ASCIITest(symbol: .I),
        ],
        .J: [
            ASCIITest(symbol: .J),
        ],
        .K: [
            ASCIITest(symbol: .K),
        ],
        .L: [
            ASCIITest(symbol: .L),
        ],
        .M: [
            ASCIITest(symbol: .M),
        ],
        .N: [
            ASCIITest(symbol: .N),
        ],
        .O: [
            ASCIITest(symbol: .O),
        ],
        .P: [
            ASCIITest(symbol: .P),
        ],
        .Q: [
            ASCIITest(symbol: .Q),
        ],
        .R: [
            ASCIITest(symbol: .R),
        ],
        .S: [
            ASCIITest(symbol: .S),
        ],
        .T: [
            ASCIITest(symbol: .T),
        ],
        .U: [
            ASCIITest(symbol: .U),
        ],
        .V: [
            ASCIITest(symbol: .V),
        ],
        .W: [
            ASCIITest(symbol: .W),
        ],
        .X: [
            ASCIITest(symbol: .X),
        ],
        .Y: [
            ASCIITest(symbol: .Y),
        ],
        .Z: [
            ASCIITest(symbol: .Z),
        ],
        .leftSquare: [
            ASCIITest(symbol: .leftSquare),
        ],
        .backslash: [
            ASCIITest(symbol: .backslash),
        ],
        .rightSquare: [
            ASCIITest(symbol: .rightSquare),
        ],
        .caret: [
            ASCIITest(symbol: .caret),
        ],
        .underscore: [
            ASCIITest(symbol: .underscore),
        ],
        .accent: [
            ASCIITest(symbol: .accent),
        ],
        .a: [
            ASCIITest(symbol: .a),
        ],
        .b: [
            ASCIITest(symbol: .b),
        ],
        .c: [
            ASCIITest(symbol: .c),
        ],
        .d: [
            ASCIITest(symbol: .d),
        ],
        .e: [
            ASCIITest(symbol: .e),
        ],
        .f: [
            ASCIITest(symbol: .f),
        ],
        .g: [
            ASCIITest(symbol: .g),
        ],
        .h: [
            ASCIITest(symbol: .h),
        ],
        .i: [
            ASCIITest(symbol: .i),
        ],
        .j: [
            ASCIITest(symbol: .j),
        ],
        .k: [
            ASCIITest(symbol: .k),
        ],
        .l: [
            ASCIITest(symbol: .l),
        ],
        .m: [
            ASCIITest(symbol: .m),
        ],
        .n: [
            ASCIITest(symbol: .n),
        ],
        .o: [
            ASCIITest(symbol: .o),
        ],
        .p: [
            ASCIITest(symbol: .p),
        ],
        .q: [
            ASCIITest(symbol: .q),
        ],
        .r: [
            ASCIITest(symbol: .r),
        ],
        .s: [
            ASCIITest(symbol: .s),
        ],
        .t: [
            ASCIITest(symbol: .t),
        ],
        .u: [
            ASCIITest(symbol: .u),
        ],
        .v: [
            ASCIITest(symbol: .v),
        ],
        .w: [
            ASCIITest(symbol: .w),
        ],
        .x: [
            ASCIITest(symbol: .x),
        ],
        .y: [
            ASCIITest(symbol: .y),
        ],
        .z: [
            ASCIITest(symbol: .z),
        ],
        .leftCurlyBracket: [
            ASCIITest(symbol: .leftCurlyBracket),
        ],
        .pipe: [
            ASCIITest(symbol: .pipe),
        ],
        .rightCurlyBracket: [
            ASCIITest(symbol: .rightCurlyBracket),
        ],
        .tilde: [
            ASCIITest(symbol: .tilde),
        ],
        .DEL: [
            ASCIITest(symbol: .DEL),
        ],
    ]
}

extension Tests {
    static subscript(key: ASCIISymbol) -> [Testable] {
        self.tests[key]!
    }
    
    static subscript(key: ASCIISymbol, level: TestLevel) -> [Testable] {
        self.tests[key]!.filter { $0.level == level }
    }
    
    static subscript(key: ASCIISymbol, type: TestType) -> [Testable] {
        self.tests[key]!.filter { $0.type == type }
    }
    
    static subscript(key: ASCIISymbol, type: TestType, level: TestLevel) -> [Testable] {
        self.tests[key]!.filter { $0.type == type && $0.level == level }
    }
}
