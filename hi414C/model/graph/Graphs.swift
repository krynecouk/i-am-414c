//
//  Graphs.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

class Graphs {
    typealias N = ASCIITestNode
    typealias E = ASCIITestEdge
    
    private init() {}
    
    static let HI =
        N("HI") {
            E("HI") {
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
                FooASCIINode("YOU") {
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
