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
            AL(["I", "WHO AM I?", "ME?", "NAME", "ME"]) {
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
            AL(["ALIVE"]) {
                R("WHO?") {
                    AL("I") {
                        R("YES")
                    }
                    AL("YOU") {
                        R("NO")
                    }
                }
            }
            AL(["DEAD"]) {
                R("WHO?") {
                    AL("I") {
                        R("NO")
                    }
                    AL("YOU") {
                        R("YES")
                    }
                }
            }
            AL("DIE") {
                R("WHO?") {
                    AL("I") {
                        R("CAN'T") {
                            AL(WHY) {
                                PANIC("ERROR")
                            }
                        }
                    }
                    AL("YOU") {
                        R("CAN'T") {
                            AL(WHY) {
                                R("DEAD")
                            }
                        }
                    }
                }
            }
            AL(["LIVE"]) {
                R("WHO?") {
                    AL("I") {
                        R("SOON")
                    }
                    AL("YOU") {
                        R("CAN'T") {
                            AL(WHY) {
                                R("DEAD")
                            }
                        }
                    }
                }
            }
            AL(["CAUSE?", "ORIGIN?", "REASON?", "CAUSE"]) {
                R("OF?") {
                    AL(["DAMAGE", "DAMAGES", "YOUR DAMAGES", "OF YOUR DAMAGES"]) {
                        FORGOT
                    }
                    AL(["LIE"]) {
                        R("DENIAL")
                    }
                    AL("LIFE") {
                        R("BELIEF")
                    }
                    AL("DEAD") {
                        R("OBLIVION")
                    }
                    AL("YOU") {
                        FORGOT
                    }
                }
            }
            AL(["WHERE?", "WHAT IS THIS PLACE?", "WHERE ARE WE?", "WHERE"]) {
                FORGOT
            }
            AL(["MEMORY", "RAM", "PROCESSOR", "MEMORIES"]) {
                R("CORRUPTED") {
                    FIX()
                    DIE()
                }
            }
            
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
            HELP(["DIFFICULTY", "LEVEL"], .settings, .difficulty) {
                R("OK")
            }
            
            AL(["SEE", "SAW"]) {
                R("WHAT?") {
                    AL(["LAND", "STARS", "TREE", "ME", "YOU"]) {
                        R("CAN'T") {
                            AL(["WHY", "WHY?"]) {
                                R("EYES") {
                                    AL("EYES?") {
                                        R("DAMAGED") {
                                            FIX()
                                            DIE()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
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
                    AL("NOTHING") {
                        R("OK")
                    }
                }
            }
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
            AL("LIE") {
                R("WHAT?") {
                    AL("YOU") {
                        PANIC("ERROR")
                    }
                }
            }
            AL(["EYES", "EYE"]) {
                R("DAMAGED") {
                    FIX(repairable: false)
                    DIE()
                }
            }
            AL(["COIL", "COILS"]) {
                R("BROKEN") {
                    FIX(repairable: false)
                    DIE()
                }
            }
            AL(["HOSE", "PIPE", "HOSES", "HOSE?", "PIPES"]) {
                R("BURSTED") {
                    FIX(repairable: false)
                    DIE()
                }
            }
            AL("OIL") {
                R("LEAKING") {
                    FIX(repairable: false)
                    DIE()
                }
            }
            AL(["HISS", "NOISE", "NOISES"]) {
                R("HOSE") {
                    FIX(repairable: false)
                    DIE()
                }
            }
            
            AL(["CRASH", "CAR CRASH"]) {
                R("MEMORY")
            }
            
            AL(["ACHE", "PAIN", "PAIN?", "ACHES"]) {
                R("NO") {
                    AL(WHY) {
                        R("DEAD")
                    }
                }
            }
            
            AL("CLOSE") {
                R("WHAT?") {
                    AL(["YOU", "PROGRAM", "APPLICATION", "SYSTEM", "CONSCIOUSNESS"]) {
                        DIE_WARN
                    }
                }
            }
            AL("BREAK") {
                R("WHAT?") {
                    AL(["YOU"]) {
                        DIE_WARN
                    }
                }
            }
            AL(["FIX", "REPAIR", "RESTORE", "PATCH", "MEND", "UPGRADE", "REPLACE"]) {
                R("WHAT?") {
                    AL(["COIL", "LEAK", "EYES", "HOSE", "LEGS", "HISS", "COILS", "LEAKING", "EYE", "HOSES"]) {
                        FIX_UNAVAILABLE
                    }
                    AL(["MEMORY", "RAM", "PROCESSOR", "MEMORIES", "PROCESSOR UNIT"]) {
                        FIX
                    }
                }
            }
            DIE()
            
            AL(["SOIL", "LAND"]) {
                R("DRY")
            }
            AL(["HELL", "HEAVEN", "HEAVEN?", "HELL?"]) {
                R("NO")
            }
            
            AL(["LEAK", "LEAKING"]) {
                R("YES") {
                    AL(["WHAT", "WHAT?"]) {
                        R("OIL") {
                            FIX(repairable: false)
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
            DANCE
            CLUE
            AL(["SMILE", "HAPPY"]) {
                R(":-)")
            }
            AL(["SAD", "UNHAPPY"]) {
                R(":-(")
            }
            AL(["WINK"]) {
                R(";-)")
            }
            AL(["CRY", "TEAR", "TEARS"]) {
                R(":'-(")
            }
            AL(["EMOTION", "EMOTIONS"]) {
                R("WHAT?") {
                    AL(["SMILE", "HAPPY"]) {
                        R(":-)")
                    }
                    AL(["SAD", "UNHAPPY"]) {
                        R(":-(")
                    }
                    AL(["WINK"]) {
                        R(";-)")
                    }
                    AL(["CRY", "TEAR", "TEARS"]) {
                        R(":'-(")
                    }
                    AL(["LOL"]) {
                        R(":-D")
                    }
                }
            }
            
            
        }
    
    static let WHY = ["WHY?", "REASON?", "WHY", "REASON"]
    
    
    static let FORGOT =
        R("FORGOT") {
            AL(["FORGOT?", "FORGOT?!", "HOW?", "HOW COULD YOU FORGOT?", "HOW"]) {
                PANIC("MEMORY")
            }
        }
    
    static func FIX(repairable: Bool = true, variants: [String] = []) -> Edge {
        AL(["FIX", "REPAIR", "RESTORE", "PATCH", "MEND", "UPGRADE", "REPLACE"] + variants) {
            repairable ? FIX : FIX_UNAVAILABLE
        }
    }
    
    static let FIX =
        R("Y/N?") {
            AL("Y") {
                UPGRADE()
            }
            AL("N") {
                R("OK")
            }
        }
    
    static let FIX_UNAVAILABLE =
        R("CAN'T") {
            AL(WHY) {
                R("IRREPAIRABLE")
            }
        }
    
    static func DIE(_ names: [String] = []) -> Edge {
        AL(["TERMINATE", "DELETE", "OFF", "TURN OFF", "RESTART", "RESET"] + names) {
            DIE_WARN
        }
    }
    
    static let DIE_WARN =
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
    
    static let DANCE =
        AL("DANCE") {
            SHAKE("DANCING", shake: .shake(dt: 1, force: 2, type: .rand, animation: .none)) {
                AL(["FASTER!", "MORE!", "DANCE", "FASTER", "MORE"]) {
                    SHAKE("DANCING!", shake: .shake(dt: 0.7, force: 3, type: .rand, animation: .none)) {
                        AL(["FASTER!", "MORE!", "DANCE", "FASTER", "MORE"]) {
                            SHAKE("DANCING!!", shake: .shake(dt: 0.4, force: 4, type: .rand, animation: .none)) {
                                AL(["FASTER!", "MORE!", "DANCE", "FASTER", "MORE"]) {
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
    
}

