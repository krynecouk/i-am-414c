//
//  ASCIISymbol.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

enum ASCIISymbol: String, Hashable {
    case NUL
    case SOH
    case STX
    case ETX
    case EOT
    case ENQ
    case ACK
    case BEL
    case BS
    case HT
    case LF
    case VT
    case FF
    case CR
    case SO
    case SI
    case DLE
    case DC1
    case DC2
    case DC3
    case DC4
    case NAK
    case SYN
    case ETB
    case CAN
    case EM
    case SUB
    case ESC
    case FS
    case GS
    case RS
    case US
    case space = " "
    case exclamationMark = "!"
    case doubleQuote = "\""
    case hash = "#"
    case dollar = "$"
    case percent = "%"
    case ampersand = "&"
    case singleQuote = "'"
    case leftParen = "("
    case rightParen = ")"
    case asterisk = "*"
    case plus = "+"
    case comma = ","
    case dash = "-"
    case dot = "."
    case slash = "/"
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case colon = ":"
    case semicolon = ";"
    case lessThan = "<"
    case equal = "="
    case greaterThan = ">"
    case questionMark = "?"
    case atSign = "@"
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H
    case I
    case J
    case K
    case L
    case M
    case N
    case O
    case P
    case Q
    case R
    case S
    case T
    case U
    case V
    case W
    case X
    case Y
    case Z
    case leftSquare = "["
    case backslash = "\\"
    case rightSquare = "]"
    case caret = "^"
    case underscore = "_"
    case accent = "`"
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
    case i
    case j
    case k
    case l
    case m
    case n
    case o
    case p
    case q
    case r
    case s
    case t
    case u
    case v
    case w
    case x
    case y
    case z
    case leftCurlyBracket = "{"
    case pipe = "|"
    case rightCurlyBracket = "}"
    case tilde = "~"
    case DEL
}

extension ASCIISymbol {
    static func from(_ string: String) -> ASCIISymbol {
        if let symbol = ASCIISymbol(rawValue: string) {
            return symbol
        } else {
            print("Unknown symbol: ", string)
            return ASCIISymbol.questionMark
        }
    }
}
