//
//  Graphs.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

class Graphs {
    typealias ROOT = ASCIITestNode
    typealias R = ASCIITestNode
    typealias AL = ASCIITestEdge
    
    private init() {}
    
    static let HI =
        R("HI") {
            AL("HI") {
                R("HI")
            }
            AL("HIHI") {
                GraphNode("FOO")
            }
            AL("I", variants: ["I?", "ME", "ME?", "NAME"]) {
                R("AL") {
                    AL("AL?") {
                        R("YES")
                    }
                }
            }
            AL("AL") {
                R("YOU") {
                    AL("AL?") {
                        R("YES")
                    }
                }
            }
            AL("YOU") {
                R("414C") {
                    AL("414C?") {
                        R("YES")
                    }
                }
            }
            AL("414C") {
                R("I")
            }
            
            AL("HOSE") {
                R("REPAIRABLE") {
                    REPAIR
                }
            }
            REPAIR
        }
    
    static let REPAIR =
        AL("REPAIR") {
            R("Y/N?") {
                AL("Y") {
                    R("OK")
                }
                AL("N") {
                    R("NOTOK")
                }
            }
        }
}
