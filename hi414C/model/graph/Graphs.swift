//
//  Graphs.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

typealias ROOT = ASCIITestNode
typealias R = ASCIITestNode
typealias AL = ASCIITestEdge
typealias UPGRADE = UpgradeASCIITestNode

class Graphs {
    private init() {}
    
    static let HI =
        R("HI") {
            AL("HI") {
                R("HI")
            }
            AL("HIHI") {
                UPGRADE("DONE")
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
    
    static let HI2 =
        R("HI") {
            AL("HI") {
                R("HI")
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
                R("I AM YOU")
            }
        }
    
    static let REPAIR =
        AL("REPAIR") {
            R("Y/N?") {
                AL("Y") {
                    UPGRADE("DONE")
                }
                AL("N") {
                    R("OK")
                }
            }
        }
}
