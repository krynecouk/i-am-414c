//
//  ASCII.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.03.2021.
//

struct ASCII: Hashable {
    let dec: UInt8
    let hex: UInt8
    let bin: UInt8
    let symbol: ASCIISymbol
}

extension ASCII {
    static func from(symbol: String) -> ASCII? {
        if let asciiSymbol = ASCIISymbol(rawValue: symbol) {
            return ASCII.from(symbol: asciiSymbol)
        }
        return .none
    }
    
    static func from(symbol: ASCIISymbol) -> ASCII {
        switch symbol {
        case .NUL: return ASCIITable.NUL
        case .SOH: return ASCIITable.SOH
        case .STX: return ASCIITable.STX
        case .ETX: return ASCIITable.ETX
        case .EOT: return ASCIITable.EOT
        case .ENQ: return ASCIITable.ENQ
        case .ACK: return ASCIITable.ACK
        case .BEL: return ASCIITable.BEL
        case .BS: return ASCIITable.BS
        case .HT: return ASCIITable.HT
        case .LF: return ASCIITable.LF
        case .VT: return ASCIITable.VT
        case .FF: return ASCIITable.FF
        case .CR: return ASCIITable.CR
        case .SO: return ASCIITable.SO
        case .SI: return ASCIITable.SI
        case .DLE: return ASCIITable.DLE
        case .DC1: return ASCIITable.DC1
        case .DC2: return ASCIITable.DC2
        case .DC3: return ASCIITable.DC3
        case .DC4: return ASCIITable.DC4
        case .NAK: return ASCIITable.NAK
        case .SYN: return ASCIITable.SYN
        case .ETB: return ASCIITable.ETB
        case .CAN: return ASCIITable.CAN
        case .EM: return ASCIITable.EM
        case .SUB: return ASCIITable.SUB
        case .ESC: return ASCIITable.ESC
        case .FS: return ASCIITable.FS
        case .GS: return ASCIITable.GS
        case .RS: return ASCIITable.RS
        case .US: return ASCIITable.US
        case .space: return ASCIITable.space
        case .exclamationMark: return ASCIITable.exclamationMark
        case .doubleQuote: return ASCIITable.doubleQuote
        case .hash: return ASCIITable.hash
        case .dollar: return ASCIITable.dollar
        case .percent: return ASCIITable.percent
        case .ampersand: return ASCIITable.ampersand
        case .singleQuote: return ASCIITable.singleQuote
        case .leftParen: return ASCIITable.leftParen
        case .rightParen: return ASCIITable.rightParen
        case .asterisk: return ASCIITable.asterisk
        case .plus: return ASCIITable.plus
        case .comma: return ASCIITable.comma
        case .dash: return ASCIITable.dash
        case .dot: return ASCIITable.dot
        case .slash: return ASCIITable.slash
        case .zero: return ASCIITable.zero
        case .one: return ASCIITable.one
        case .two: return ASCIITable.two
        case .three: return ASCIITable.three
        case .four: return ASCIITable.four
        case .five: return ASCIITable.five
        case .six: return ASCIITable.six
        case .seven: return ASCIITable.seven
        case .eight: return ASCIITable.eight
        case .nine: return ASCIITable.nine
        case .colon: return ASCIITable.colon
        case .semicolon: return ASCIITable.semicolon
        case .lessThan: return ASCIITable.lessThan
        case .equal: return ASCIITable.equal
        case .greaterThan: return ASCIITable.greaterThan
        case .questionMark: return ASCIITable.questionMark
        case .atSign: return ASCIITable.atSign
        case .A: return ASCIITable.A
        case .B: return ASCIITable.B
        case .C: return ASCIITable.C
        case .D: return ASCIITable.D
        case .E: return ASCIITable.E
        case .F: return ASCIITable.F
        case .G: return ASCIITable.G
        case .H: return ASCIITable.H
        case .I: return ASCIITable.I
        case .J: return ASCIITable.J
        case .K: return ASCIITable.K
        case .L: return ASCIITable.L
        case .M: return ASCIITable.M
        case .N: return ASCIITable.N
        case .O: return ASCIITable.O
        case .P: return ASCIITable.P
        case .Q: return ASCIITable.Q
        case .R: return ASCIITable.R
        case .S: return ASCIITable.S
        case .T: return ASCIITable.T
        case .U: return ASCIITable.U
        case .V: return ASCIITable.V
        case .W: return ASCIITable.W
        case .X: return ASCIITable.X
        case .Y: return ASCIITable.Y
        case .Z: return ASCIITable.Z
        case .leftSquare: return ASCIITable.leftSquare
        case .backslash: return ASCIITable.backslash
        case .rightSquare: return ASCIITable.rightSquare
        case .caret: return ASCIITable.caret
        case .underscore: return ASCIITable.underscore
        case .accent: return ASCIITable.accent
        case .a: return ASCIITable.a
        case .b: return ASCIITable.b
        case .c: return ASCIITable.c
        case .d: return ASCIITable.d
        case .e: return ASCIITable.e
        case .f: return ASCIITable.f
        case .g: return ASCIITable.g
        case .h: return ASCIITable.h
        case .i: return ASCIITable.i
        case .j: return ASCIITable.j
        case .k: return ASCIITable.k
        case .l: return ASCIITable.l
        case .m: return ASCIITable.m
        case .n: return ASCIITable.n
        case .o: return ASCIITable.o
        case .p: return ASCIITable.p
        case .q: return ASCIITable.q
        case .r: return ASCIITable.r
        case .s: return ASCIITable.s
        case .t: return ASCIITable.t
        case .u: return ASCIITable.u
        case .v: return ASCIITable.v
        case .w: return ASCIITable.w
        case .x: return ASCIITable.x
        case .y: return ASCIITable.y
        case .z: return ASCIITable.z
        case .leftCurlyBracket: return ASCIITable.leftCurlyBracket
        case .pipe: return ASCIITable.pipe
        case .rightCurlyBracket: return ASCIITable.rightCurlyBracket
        case .tilde: return ASCIITable.tilde
        case .DEL: return ASCIITable.DEL
        }
    }
}
