//
//  Graphs.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

typealias ROOT = ASCIITestNode
typealias R = ASCIITestNode
typealias AL = ASCIITestEdge
typealias UPGRADE = UpgradeNode
typealias DEAD = DeadNode

class Graphs {
    private init() {}
    
    static let HI =
        R("HI") {
            // INTRO
            AL("HI", variants: ["HELLO", "YO", "AHOY"]) {
                R("HI")
            }
            AL("I", variants: ["ME", "ME?", "NAME", "WHO AM I", "WHO AM I?"]) {
                R("AL")
            }
            AL("AL") {
                R("YOU")
            }
            AL("YOU") {
                R("414C") {
                    AL("414C?") {
                        R("YES")
                    }
                }
            }
            AL("414C") {
                R("I") {
                    AL("414C?") {
                        R("YES")
                    }
                }
            }
            // UPGRADE
            AL("COIL", variants: ["COILS"]) {
                R("BROKEN") {
                    AL("HOW") {
                        R("BADLY")
                    }
                    FIX()
                }
            }
            AL("HOSE", variants: ["HOSES", "HOSE?", "PIPE", "PIPES"]) {
                R("BURSTED") {
                    FIX()
                }
            }
            AL("OIL") {
                R("LEAKING") {
                    FIX()
                }
            }
            AL("HISS", variants: ["NOISE"]) {
                R("HOSE") {
                    FIX()
                }
            }
            AL("CACHE", variants: ["MEMORY", "PROCESSOR"]) {
                R("CORRUPTED") {
                    FIX(["CLEAR", "INVALIDATE", "REFRESH"])
                }
            }
            FIX()
            
            // DEAD
            DIE()
            
            // OTHER
            
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
    
    static func FIX(text: String = "FIX", _ variants: [String] = []) -> Edge {
        AL(text, variants: ["FIX", "REPAIR", "PATCH", "MEND", "REPLACE", "RESTORE", "OVERHAUL"] + variants) {
            R("Y/N?") {
                AL("Y") {
                    UPGRADE()
                }
                AL("N") {
                    R("OK")
                }
            }
        }
    }
    
    static func DIE(text: String = "DIE", _ variants: [String] = []) -> Edge {
        AL(text, variants: ["DIE", "TERMINATE", "CLOSE", "RESTART", "RESET"] + variants) {
            R("Y/N?") {
                AL("Y") {
                    R("SURE?") {
                        AL("Y") {
                            DEAD()
                        }
                        AL("N") {
                            R("OK")
                        }
                    }
                }
                AL("N") {
                    R("OK")
                }
            }
        }
    }
}
