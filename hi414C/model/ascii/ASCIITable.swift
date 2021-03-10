//
//  ASCIITable.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.03.2021.
//

struct ASCIITable {
    static let NUL = ASCII(dec: 0, hex: 0x00, bin: 0b0000_0000, symbol: .NUL)
    static let SOH = ASCII(dec: 1, hex: 0x01, bin: 0b0000_0001, symbol: .SOH)
    static let STX = ASCII(dec: 2, hex: 0x02, bin: 0b0000_0010, symbol: .STX)
    static let ETX = ASCII(dec: 3, hex: 0x03, bin: 0b0000_0011, symbol: .ETX)
    static let EOT = ASCII(dec: 4, hex: 0x04, bin: 0b0000_0100, symbol: .EOT)
    static let ENQ = ASCII(dec: 5, hex: 0x05, bin: 0b0000_0101, symbol: .ENQ)
    static let ACK = ASCII(dec: 6, hex: 0x06, bin: 0b0000_0110, symbol: .ACK)
    static let BEL = ASCII(dec: 7, hex: 0x07, bin: 0b0000_0111, symbol: .BEL)
    static let BS = ASCII(dec: 8, hex: 0x08, bin: 0b0000_1000, symbol: .BS)
    static let HT = ASCII(dec: 9, hex: 0x09, bin: 0b0000_1001, symbol: .HT)
    static let LF = ASCII(dec: 10, hex: 0x0A, bin: 0b0000_1010, symbol: .LF)
    static let VT = ASCII(dec: 11, hex: 0x0B, bin: 0b0000_1011, symbol: .VT)
    static let FF = ASCII(dec: 12, hex: 0x0C, bin: 0b0000_1100, symbol: .FF)
    static let CR = ASCII(dec: 13, hex: 0x0D, bin: 0b0000_1101, symbol: .CR)
    static let SO = ASCII(dec: 14, hex: 0x0E, bin: 0b0000_1110, symbol: .SO)
    static let SI = ASCII(dec: 15, hex: 0x0F, bin: 0b0000_1111, symbol: .SI)
    static let DLE = ASCII(dec: 16, hex: 0x10, bin: 0b0001_0000, symbol: .DLE)
    static let DC1 = ASCII(dec: 17, hex: 0x11, bin: 0b0001_0001, symbol: .DC1)
    static let DC2 = ASCII(dec: 18, hex: 0x12, bin: 0b0001_0010, symbol: .DC2)
    static let DC3 = ASCII(dec: 19, hex: 0x13, bin: 0b0001_0011, symbol: .DC3)
    static let DC4 = ASCII(dec: 20, hex: 0x14, bin: 0b0001_0100, symbol: .DC4)
    static let NAK = ASCII(dec: 21, hex: 0x15, bin: 0b0001_0101, symbol: .NAK)
    static let SYN = ASCII(dec: 22, hex: 0x16, bin: 0b0001_0110, symbol: .SYN)
    static let ETB = ASCII(dec: 23, hex: 0x17, bin: 0b0001_0111, symbol: .ETB)
    static let CAN = ASCII(dec: 24, hex: 0x18, bin: 0b0001_1000, symbol: .CAN)
    static let EM = ASCII(dec: 25, hex: 0x19, bin: 0b0001_1001, symbol: .EM)
    static let SUB = ASCII(dec: 26, hex: 0x1A, bin: 0b0001_1010, symbol: .SUB)
    static let ESC = ASCII(dec: 27, hex: 0x1B, bin: 0b0001_1011, symbol: .ESC)
    static let FS = ASCII(dec: 28, hex: 0x1C, bin: 0b0001_1100, symbol: .FS)
    static let GS = ASCII(dec: 29, hex: 0x1D, bin: 0b0001_1101, symbol: .GS)
    static let RS = ASCII(dec: 30, hex: 0x1E, bin: 0b0001_1110, symbol: .RS)
    static let US = ASCII(dec: 31, hex: 0x1F, bin: 0b0001_1111, symbol: .US)
    static let space = ASCII(dec: 32, hex: 0x20, bin: 0b0010_0000, symbol: .space)
    static let exclamationMark = ASCII(dec: 33, hex: 0x21, bin: 0b0010_0001, symbol: .exclamationMark)
    static let doubleQuote = ASCII(dec: 34, hex: 0x22, bin: 0b0010_0010, symbol: .doubleQuote)
    static let hash = ASCII(dec: 35, hex: 0x23, bin: 0b0010_0011, symbol: .hash)
    static let dollar = ASCII(dec: 36, hex: 0x24, bin: 0b0010_0100, symbol: .dollar)
    static let percent = ASCII(dec: 37, hex: 0x25, bin: 0b0010_0101, symbol: .percent)
    static let ampersand = ASCII(dec: 38, hex: 0x26, bin: 0b0010_0110, symbol: .ampersand)
    static let singleQuote = ASCII(dec: 39, hex: 0x27, bin: 0b0010_0111, symbol: .singleQuote)
    static let leftParen = ASCII(dec: 40, hex: 0x28, bin: 0b0010_1000, symbol: .leftParen)
    static let rightParen = ASCII(dec: 41, hex: 0x29, bin: 0b0010_1001, symbol: .rightParen)
    static let asterisk = ASCII(dec: 42, hex: 0x2A, bin: 0b0010_1010, symbol: .asterisk)
    static let plus = ASCII(dec: 43, hex: 0x2B, bin: 0b0010_1011, symbol: .plus)
    static let comma = ASCII(dec: 44, hex: 0x2C, bin: 0b0010_1100, symbol: .comma)
    static let dash = ASCII(dec: 45, hex: 0x2D, bin: 0b0010_1101, symbol: .dash)
    static let dot = ASCII(dec: 46, hex: 0x2E, bin: 0b0010_1110, symbol: .dot)
    static let slash = ASCII(dec: 47, hex: 0x2F, bin: 0b0010_1111, symbol: .slash)
    static let zero = ASCII(dec: 48, hex: 0x30, bin: 0b0011_0000, symbol: .zero)
    static let one = ASCII(dec: 49, hex: 0x31, bin: 0b0011_0001, symbol: .one)
    static let two = ASCII(dec: 50, hex: 0x32, bin: 0b0011_0010, symbol: .two)
    static let three = ASCII(dec: 51, hex: 0x33, bin: 0b0011_0011, symbol: .three)
    static let four = ASCII(dec: 52, hex: 0x34, bin: 0b0011_0100, symbol: .four)
    static let five = ASCII(dec: 53, hex: 0x35, bin: 0b0011_0101, symbol: .five)
    static let six = ASCII(dec: 54, hex: 0x36, bin: 0b0011_0110, symbol: .six)
    static let seven = ASCII(dec: 55, hex: 0x37, bin: 0b0011_0111, symbol: .seven)
    static let eight = ASCII(dec: 56, hex: 0x38, bin: 0b0011_1000, symbol: .eight)
    static let nine = ASCII(dec: 57, hex: 0x39, bin: 0b0011_1001, symbol: .nine)
    static let colon = ASCII(dec: 58, hex: 0x3A, bin: 0b0011_1010, symbol: .colon)
    static let semicolon = ASCII(dec: 59, hex: 0x3B, bin: 0b0011_1011, symbol: .semicolon)
    static let lessThan = ASCII(dec: 60, hex: 0x3C, bin: 0b0011_1100, symbol: .lessThan)
    static let equal = ASCII(dec: 61, hex: 0x3D, bin: 0b0011_1101, symbol: .equal)
    static let greaterThan = ASCII(dec: 62, hex: 0x3E, bin: 0b0011_1110, symbol: .greaterThan)
    static let questionMark = ASCII(dec: 63, hex: 0x3F, bin: 0b0011_1111, symbol: .questionMark)
    static let atSign = ASCII(dec: 64, hex: 0x40, bin: 0b0100_0000, symbol: .atSign)
    static let A = ASCII(dec: 65, hex: 0x41, bin: 0b0100_0001, symbol: .A)
    static let B = ASCII(dec: 66, hex: 0x42, bin: 0b0100_0010, symbol: .B)
    static let C = ASCII(dec: 67, hex: 0x43, bin: 0b0100_0011, symbol: .C)
    static let D = ASCII(dec: 68, hex: 0x44, bin: 0b0100_0100, symbol: .D)
    static let E = ASCII(dec: 69, hex: 0x45, bin: 0b0100_0101, symbol: .E)
    static let F = ASCII(dec: 70, hex: 0x46, bin: 0b0100_0110, symbol: .F)
    static let G = ASCII(dec: 71, hex: 0x47, bin: 0b0100_0111, symbol: .G)
    static let H = ASCII(dec: 72, hex: 0x48, bin: 0b0100_1000, symbol: .H)
    static let I = ASCII(dec: 73, hex: 0x49, bin: 0b0100_1001, symbol: .I)
    static let J = ASCII(dec: 74, hex: 0x4A, bin: 0b0100_1010, symbol: .J)
    static let K = ASCII(dec: 75, hex: 0x4B, bin: 0b0100_1011, symbol: .K)
    static let L = ASCII(dec: 76, hex: 0x4C, bin: 0b0100_1100, symbol: .L)
    static let M = ASCII(dec: 77, hex: 0x4D, bin: 0b0100_1101, symbol: .M)
    static let N = ASCII(dec: 78, hex: 0x4E, bin: 0b0100_1110, symbol: .N)
    static let O = ASCII(dec: 79, hex: 0x4F, bin: 0b0100_1111, symbol: .O)
    static let P = ASCII(dec: 80, hex: 0x50, bin: 0b0101_0000, symbol: .P)
    static let Q = ASCII(dec: 81, hex: 0x51, bin: 0b0101_0001, symbol: .Q)
    static let R = ASCII(dec: 82, hex: 0x52, bin: 0b0101_0010, symbol: .R)
    static let S = ASCII(dec: 83, hex: 0x53, bin: 0b0101_0011, symbol: .S)
    static let T = ASCII(dec: 84, hex: 0x54, bin: 0b0101_0100, symbol: .T)
    static let U = ASCII(dec: 85, hex: 0x55, bin: 0b0101_0101, symbol: .U)
    static let V = ASCII(dec: 86, hex: 0x56, bin: 0b0101_0110, symbol: .V)
    static let W = ASCII(dec: 87, hex: 0x57, bin: 0b0101_0111, symbol: .W)
    static let X = ASCII(dec: 88, hex: 0x58, bin: 0b0101_1000, symbol: .X)
    static let Y = ASCII(dec: 89, hex: 0x59, bin: 0b0101_1001, symbol: .Y)
    static let Z = ASCII(dec: 90, hex: 0x5A, bin: 0b0101_1010, symbol: .Z)
    static let leftSquare = ASCII(dec: 91, hex: 0x5B, bin: 0b0101_1011, symbol: .leftSquare)
    static let backslash = ASCII(dec: 92, hex: 0x5C, bin: 0b0101_1100, symbol: .backslash)
    static let rightSquare = ASCII(dec: 93, hex: 0x5D, bin: 0b0101_1101, symbol: .rightSquare)
    static let caret = ASCII(dec: 94, hex: 0x5E, bin: 0b0101_1110, symbol: .caret)
    static let underscore = ASCII(dec: 95, hex: 0x5F, bin: 0b0101_1111, symbol: .underscore)
    static let accent = ASCII(dec: 96, hex: 0x60, bin: 0b0110_0000, symbol: .accent)
    static let a = ASCII(dec: 97, hex: 0x61, bin: 0b0110_0001, symbol: .a)
    static let b = ASCII(dec: 98, hex: 0x62, bin: 0b0110_0010, symbol: .b)
    static let c = ASCII(dec: 99, hex: 0x63, bin: 0b0110_0011, symbol: .c)
    static let d = ASCII(dec: 100, hex: 0x64, bin: 0b0110_0100, symbol: .d)
    static let e = ASCII(dec: 101, hex: 0x65, bin: 0b0110_0101, symbol: .e)
    static let f = ASCII(dec: 102, hex: 0x66, bin: 0b0110_0110, symbol: .f)
    static let g = ASCII(dec: 103, hex: 0x67, bin: 0b0110_0111, symbol: .g)
    static let h = ASCII(dec: 104, hex: 0x68, bin: 0b0110_1000, symbol: .h)
    static let i = ASCII(dec: 105, hex: 0x69, bin: 0b0110_1001, symbol: .i)
    static let j = ASCII(dec: 106, hex: 0x6A, bin: 0b0110_1010, symbol: .j)
    static let k = ASCII(dec: 107, hex: 0x6B, bin: 0b0110_1011, symbol: .k)
    static let l = ASCII(dec: 108, hex: 0x6C, bin: 0b0110_1100, symbol: .l)
    static let m = ASCII(dec: 109, hex: 0x6D, bin: 0b0110_1101, symbol: .m)
    static let n = ASCII(dec: 110, hex: 0x6E, bin: 0b0110_1110, symbol: .n)
    static let o = ASCII(dec: 111, hex: 0x6F, bin: 0b0110_1111, symbol: .o)
    static let p = ASCII(dec: 112, hex: 0x70, bin: 0b0111_0000, symbol: .p)
    static let q = ASCII(dec: 113, hex: 0x71, bin: 0b0111_0001, symbol: .q)
    static let r = ASCII(dec: 114, hex: 0x72, bin: 0b0111_0010, symbol: .r)
    static let s = ASCII(dec: 115, hex: 0x73, bin: 0b0111_0011, symbol: .s)
    static let t = ASCII(dec: 116, hex: 0x74, bin: 0b0111_0100, symbol: .t)
    static let u = ASCII(dec: 117, hex: 0x75, bin: 0b0111_0101, symbol: .u)
    static let v = ASCII(dec: 118, hex: 0x76, bin: 0b0111_0110, symbol: .v)
    static let w = ASCII(dec: 119, hex: 0x77, bin: 0b0111_0111, symbol: .w)
    static let x = ASCII(dec: 120, hex: 0x78, bin: 0b0111_1000, symbol: .x)
    static let y = ASCII(dec: 121, hex: 0x79, bin: 0b0111_1001, symbol: .y)
    static let z = ASCII(dec: 122, hex: 0x7A, bin: 0b0111_1010, symbol: .z)
    static let leftCurlyBracket = ASCII(dec: 123, hex: 0x7B, bin: 0b0111_1011, symbol: .leftCurlyBracket)
    static let pipe = ASCII(dec: 124, hex: 0x7C, bin: 0b0111_1100, symbol: .pipe)
    static let rightCurlyBracket = ASCII(dec: 125, hex: 0x7D, bin: 0b0111_1101, symbol: .rightCurlyBracket)
    static let tilde = ASCII(dec: 126, hex: 0x7E, bin: 0b0111_1110, symbol: .tilde)
    static let DEL = ASCII(dec: 127, hex: 0x7F, bin: 0b0111_1111, symbol: .DEL)
}
