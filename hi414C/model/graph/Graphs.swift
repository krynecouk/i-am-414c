//
//  Graphs.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

class Graphs {
    typealias R = ASCIITestNode
    typealias N = ASCIITestNode
    typealias E = ASCIITestEdge
    
    private init() {}
    
    static let HI =
        R("HI") {
            E("HI") {
                N("HI")
            }
            E("HIIIIIIIIIIIIIIHIIIIIIIHIIIIIIIIIIIIIIIIIIHHH") {
                N("HIHI")
            }
            E("HIHI") {
                N("HIHI")
            }
            E("IHIHIH") {
                N("HI")
            }
            E("I", variants: ["I?", "ME", "ME?", "WHO AM I", "NAME"]) {
                N("AL") {
                    E("AL?") {
                        N("YES")
                    }
                }
            }
            E("AL") {
                N("YOU") {
                    E("AL?") {
                        N("YES")
                    }
                }
            }
            E("YOU") {
                N("414C") {
                    E("414C?") {
                        N("YES")
                    }
                }
            }
            E("414C") {
                ASCIIArtNode("cat") {
                    E("YES") {
                        N("TRULY")
                    }
                    E("NO") {
                        N("WAT")
                    }
                }
            }
        }
}
