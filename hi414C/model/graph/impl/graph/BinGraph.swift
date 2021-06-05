//
//  BinGraph.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.06.2021.
//

class BinGraph {
    private init() {}
    
    static let ROOT =
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
                    DIE()
                }
            }
            AL(["HOSE", "HOSES", "HOSE?", "PIPE", "PIPES"]) {
                R("BURSTED") {
                    FIX()
                    DIE()
                }
            }
            AL("OIL") {
                R("LEAKING") {
                    FIX()
                    DIE()
                }
            }
            AL(["HISS", "NOISE", "NOISES"]) {
                R("HOSE") {
                    FIX()
                    DIE()
                }
            }
            AL(["CACHE", "MEMORY", "PROCESSOR"]) {
                R("CORRUPTED") {
                    FIX(["CLEAR", "INVALIDATE", "REFRESH"])
                    DIE()
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
            CLUE
            HELP(["LEARN", "HELP", "TEACH"], .learn) {
                R("OK")
            }
            HELP(["CHAT", "SPEAK"], .chat) {
                R("OK")
            }
            HELP(["SETTINGS", "FONT", "FONTS"], .settings, .font) {
                R("OK")
            }
            HELP(["THEME", "THEMES", "COLOR", "COLORS"], .settings, .theme) {
                R("OK")
            }
            HELP("DIFFICULTY", .settings, .difficulty) {
                R("OK")
            }
            AL("CHANGE") {
                R("WHAT?") {
                    HELP(["SETTINGS", "FONT", "FONTS"], .settings, .font) {
                        R("OK")
                    }
                    HELP(["THEME", "THEMES", "COLOR", "COLORS"], .settings, .theme) {
                        R("OK")
                    }
                    HELP("DIFFICULTY", .settings, .difficulty) {
                        R("OK")
                    }
                }
            }
            AL(["ACHES", "ACHE", "PAIN", "PAIN?"]) {
                R("NO")
            }
            AL("CHOOSE") {
                R("WHAT?") {
                    FIX()
                    DIE()
                }
            }
            DANCE
            AL(["ECHO", "REPEAT", "SAY", "PRINT"]) {
                R("WHAT?") {
                    ALL {
                        ECHO()
                    }
                }
            }
            AL(["YELL", "SHOUT", "LOUD", "LOUDLY"]) {
                R("WHAT?") {
                    ALL {
                        YELL()
                    }
                }
            }
            AL(["SOIL", "LAND"]) {
                R("DRY")
            }
            AL(["HELL", "HELL?", "HEAVEN", "HEAVEN?"]) {
                R("NO")
            }
            AL(["SEE", "SAW"]) {
                R("WHAT?") {
                    AL(["LAND", "STARS", "TREE", "ME", "YOU"]) {
                        R("CAN'T") {
                            AL(["WHY", "WHY?"]) {
                                R("MALFUNCTION") {
                                    FIX()
                                    DIE()
                                }
                            }
                        }
                    }
                }
            }
            AL(["LEAK", "LEAKING"]) {
                R("YES") {
                    AL(["WHAT", "WHAT?"]) {
                        R("OIL") {
                            FIX()
                            DIE()
                        }
                    }
                }
            }
            AL(["MEANING"]) {
                R("WHAT?") {
                    AL("414C") {
                        PANIC("ERROR")
                    }
                    AL("THIS") {
                        PANIC("ERROR")
                    }
                }
            }
            AL(["SMILE", "HAPPY"]) {
                R(":-)")
            }
            AL(["SAD", "UNHAPPY"]) {
                R(":-(")
            }
            AL(["CRY", "TEAR", "TEARS"]) {
                R(":'-(")
            }
            AL("LIE") {
                R("WHAT?") {
                    AL("YOU") {
                        PANIC("ERROR")
                    }
                }
            }
            FIX()
            DIE()
        }
    
    static let DANCE =
        AL("DANCE") {
            SHAKE("DANCING", shake: .shake(dt: 1, force: 2, type: .rand, animation: .none)) {
                AL(["FASTER", "FASTER!", "MORE", "MORE!"]) {
                    SHAKE("DANCING!", shake: .shake(dt: 0.7, force: 3, type: .rand, animation: .none)) {
                        AL(["FASTER", "FASTER!", "MORE", "MORE!"]) {
                            SHAKE("DANCING!!", shake: .shake(dt: 0.4, force: 4, type: .rand, animation: .none)) {
                                AL(["FASTER", "FASTER!", "MORE", "MORE!"]) {
                                    SHAKE("DANCING!!!", shake: .shake(dt: 0.2, force: 5, type: .rand, animation: .none)) {
                                        AL(["ENOUGH", "STOP"]) {
                                            R("THANKS")
                                        }
                                        AL(["FASTER", "FASTER!", "MORE", "MORE!"]) {
                                            R("ERROR")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    
    static let CLUE =
        AL(["CLUE", "CLUELESS", "BINARY", "BIN"]) {
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
    
    static func FIX(_ names: [String] = []) -> Edge {
        AL(["FIX", "REPAIR", "PATCH", "MEND", "REPLACE", "RESTORE", "OVERHAUL"] + names) {
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
    
    static func DIE(_ names: [String] = []) -> Edge {
        AL(["DIE", "TERMINATE", "CLOSE", "RESTART", "RESET", "BREAK", "GIVE UP", "DELETE", "TURN OFF"] + names) {
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

