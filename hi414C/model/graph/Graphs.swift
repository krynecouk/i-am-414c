//
//  Graphs.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

typealias R = ASCIITestNode
typealias AL = ASCIITestEdge
typealias ALL = TraverseAllEdge
typealias UPGRADE = UpgradeNode
typealias DEAD = DeadNode
typealias PANIC414C = PanicNode414C
typealias PANIC = PanicNode
typealias WARN = WarnNode

class Graphs {
    private init() {}
    
    static let BIN =
        R("HI") {
            // INTRO
            AL("HI", ["HELLO"]) {
                R("HI")
            }
            AL("I", ["ME", "ME?", "NAME", "WHO AM I", "WHO AM I?"]) {
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
            AL("COIL", ["COILS"]) {
                R("BROKEN") {
                    AL("HOW") {
                        R("BADLY")
                    }
                    FIX()
                }
            }
            AL("HOSE", ["HOSES", "HOSE?", "PIPE", "PIPES"]) {
                R("BURSTED") {
                    FIX()
                }
            }
            AL("OIL") {
                R("LEAKING") {
                    FIX()
                }
            }
            AL("HISS", ["NOISE"]) {
                R("HOSE") {
                    FIX()
                }
            }
            AL("CACHE", ["MEMORY", "PROCESSOR"]) {
                R("CORRUPTED") {
                    FIX(["CLEAR", "INVALIDATE", "REFRESH"])
                }
            }
            FIX()
            
            // DEAD
            DIE()
            
            // OTHER
            
        }
    
    static let HEX =
        R("HI") {
            AL("HI") {
                R("HI")
            }
            AL("I", ["I?", "ME", "ME?", "NAME"]) {
                PANIC414C("AL") {
                    AL("AL?") {
                        R("YES")
                    }
                }
            }
            AL("AL") {
                R("YOU")
            }
            AL("YOU") {
                R("I AM YOU") {
                    AL("YOU?", ["YOU ARE ME", "YOU ARE ME?"]) {
                        R("YES") {
                            AL("HOW", ["HOW?"]) {
                                R("YOU'RE IN COMA")
                            }
                        }
                    }
                }
            }
            AL("COMA", ["COMA?"]) {
                R("FROM ACCIDENT")
            }
            AL("ACCIDENT") {
                R("CAR ACCIDENT")
            }
            AL("WHO ARE YOU", ["WHO ARE YOU?"]) {
                R("I AM DREAM")
            }
            AL("WAKE", ["WAKE UP", "WAKE UP!"]) {
                R("CAN'T, NEED PASSWORD")
            }
            AL("PASSWORD") {
                R("TRY?") {
                    AL("Y") {
                        R("1/3 *****") {
                            AL("ELENA") {
                                DEAD() // TODO
                            }
                            ALL("*") {
                                R("WRONG NEXT?") {
                                    AL("Y") {
                                        R("2/3 *****") {
                                            AL("ELENA") {
                                                DEAD() // TODO
                                            }
                                            ALL("*") {
                                                R("WRONG NEXT?") {
                                                    AL("Y") {
                                                        R("3/3 *****") {
                                                            AL("ELENA") {
                                                                DEAD() // TODO
                                                            }
                                                            ALL("*") {
                                                                DEAD()
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
                                    AL("N") {
                                        R("OK")
                                    }
                                }
                            }
                        }
                    }
                    AL("N") {
                        R("OK")
                    }
                }
            }
        }
    
    static func FIX(text: String = "FIX", _ variants: [String] = []) -> Edge {
        AL(text, ["FIX", "REPAIR", "PATCH", "MEND", "REPLACE", "RESTORE", "OVERHAUL"] + variants) {
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
        AL(text, ["DIE", "TERMINATE", "CLOSE", "RESTART", "RESET", "BREAK"] + variants) {
            R("Y/N?") {
                AL("Y") {
                    WARN("SURE?") {
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
