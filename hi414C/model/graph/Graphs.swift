//
//  Graphs.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

typealias R = ASCIITestNode
typealias UPGRADE = UpgradeNode
typealias DEAD = DeadNode
typealias FINISH = FinishNode
typealias PANIC414C = PanicNode414C
typealias PANIC = PanicNode
typealias WARN = WarnNode

typealias AL = ASCIITestEdge
typealias ALL = TraverseAllEdge
typealias IF = TraverseIfEdge
typealias HELP = HelpEdge

class Graphs {
    private init() {}
    
    static let BIN =
        R("HI") {
            AL(["HI", "HELLO"]) {
                R("HI")
            }
            AL(["I", "ME", "ME?", "NAME", "WHO AM I", "WHO AM I?"]) {
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
                R("I")
            }
            AL(["COIL", "COILS"]) {
                R("BROKEN") {
                    AL("HOW") {
                        R("BADLY")
                    }
                    FIX()
                }
            }
            AL(["HOSE", "HOSES", "HOSE?", "PIPE", "PIPES"]) {
                R("BURSTED") {
                    FIX()
                }
            }
            AL("OIL") {
                R("LEAKING") {
                    FIX()
                }
            }
            AL(["HISS", "NOISE", "NOISES"]) {
                R("HOSE") {
                    FIX()
                }
            }
            AL(["CACHE", "MEMORY", "PROCESSOR"]) {
                R("CORRUPTED") {
                    FIX(["CLEAR", "INVALIDATE", "REFRESH"])
                }
            }
            AL(["CAUSE", "CAUSE?"]) {
                R("OF...?") {
                    AL(["INJURY", "INJURIES", "DAMAGE", "DAMAGES"]) {
                        R("ACCIDENT")
                    }
                }
            }
            AL("ACCIDENT") {
                R("MEMORY")
            }
            BINCLUE
            HELP(["LEARN", "HELP", "TEACH"], .learn) {
                R("OK")
            }
            HELP(["CHAT", "SPEAK"], .chat) {
                R("OK")
            }
            HELP(["SETTINGS", "FONT", "FONTS"], .settings, .font) {
                R("OK")
            }
            HELP(["THEMES", "COLOR", "COLORS"], .settings, .theme) {
                R("OK")
            }
            HELP("DIFFICULTY", .settings, .difficulty) {
                R("OK")
            }
            /*
             - clue (clueless)
             - cool?
             - heal
             - hole
             - ill
             - soule?
             - aches (boli)
             - ache (bolest)
               --------------
             - upgrade
             - fix
             - repair
             - wake
             ----------------
             - choose
             - loose
             - holy
             - ash(es)
             - echo
             - hill
             - hoise (zvednout)
             - hell
             - lousy (mizerny)
             - noise
             - silly
             - yell
             - calculus
             - cheese
             - ice
             - us
             - aha
             - all
             - lie
             - sea
             - say
             - shy
             - use (usualy)
             - also
             - case
             - else
             - eye
             - hall
             - sail
             - see (sees)
             - seel (zavrit oci)
             - seal
             - sell
             - soil (answer: sucha?)
             - slay
             - slee (spat)
             - chaos
             - chill
             - sally
             - scall (strasidlo)
             - accuse
             - casual
             - school
             - claches (kleste)
             - year
             - leak


             
             
             */
            
            
            AL("LIE") {
                R("")
            }
            FIX()
            DIE()
        }
    
    static let BINCLUE =
        AL(["CLUE", "BINARY", "BIN"]) {
            R("0001=2^0") {
                AL(["2", "20"]) {
                    R("WRONG")
                }
                IF({ Int($0.input) != nil && $0.input != "1" }) {
                    R("WRONG")
                }
                AL("1") {
                    R("0010=2^1") {
                        AL(["1", "21"]) {
                            R("WRONG")
                        }
                        IF({ Int($0.input) != nil && $0.input != "2" }) {
                            R("WRONG")
                        }
                        AL("2") {
                            R("0100=2^2") {
                                AL(["2", "22"]) {
                                    R("WRONG")
                                }
                                IF({ Int($0.input) != nil && $0.input != "4"}) {
                                    R("WRONG")
                                }
                                AL("4") {
                                    R("1000=2^3") {
                                        AL(["6", "23"]) {
                                            R("WRONG")
                                        }
                                        IF({ Int($0.input) != nil && $0.input != "8"}) {
                                            R("WRONG")
                                        }
                                        AL("8") {
                                            R("GREAT!")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    
    static let HEX =
        R("HI") {
            AL("HI") {
                R("HI")
            }
            AL(["I", "I?", "ME", "ME?", "NAME"]) {
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
                    AL(["YOU?", "YOU ARE ME", "YOU ARE ME?"]) {
                        R("YES") {
                            AL(["HOW", "HOW?"]) {
                                R("YOU'RE IN COMA")
                            }
                        }
                    }
                }
            }
            AL(["COMA", "COMA?"]) {
                R("FROM ACCIDENT")
            }
            AL("ACCIDENT") {
                R("CAR ACCIDENT")
            }
            AL(["WHO ARE YOU", "WHO ARE YOU?"]) {
                R("I AM DREAM")
            }
            AL(["WAKE", "WAKE UP", "WAKE UP!"]) {
                R("CAN'T, NEED PASSWORD")
            }
            PASSWORD()
        }
    
    
    static func PASSWORD() -> Edge {
        AL("PASSWORD") {
            R("TRY?") {
                AL("Y") {
                    R("*****") {
                        AL("ELENA") {
                            FINISH(with: .dawn)
                        }
                        ALL {
                            R("BAD. NEXT?") {
                                AL("Y") {
                                    R("*****") {
                                        AL("ELENA") {
                                            FINISH(with: .dawn)
                                        }
                                        ALL {
                                            R("BAD. NEXT?") {
                                                AL("Y") {
                                                    R("*****") {
                                                        AL("ELENA") {
                                                            FINISH(with: .dawn)
                                                        }
                                                        ALL {
                                                            FINISH(with: .sunset)
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
        AL([text, "FIX", "REPAIR", "PATCH", "MEND", "REPLACE", "RESTORE", "OVERHAUL"] + variants) {
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
        AL([text, "DIE", "TERMINATE", "CLOSE", "RESTART", "RESET", "BREAK", "GIVE UP", "DELETE"] + variants) {
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
