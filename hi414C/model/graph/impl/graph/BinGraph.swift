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
            AL(["ALONE"]) {
                R("WHO?") {
                    AL("I") {
                        R("YES")
                    }
                    AL("YOU") {
                        R("YES")
                    }
                    AL("BOTH") {
                        R("YES")
                    }
                }
            }
            AL(["LOGIN", "LOGOUT", "AWAKE", "WAKE UP", "WAKE"]) {
                R("SOON") {
                    AL(["WHEN?", "WHEN"]) {
                        R("SOON")
                    }
                    AL("WHY?") {
                        R("UNPREPARED") {
                            AL(["YOU?", "I?"]) {
                                R("WE")
                            }
                            AL(["UNPREPARED?", "UNPREPARED FOR WHAT?", "UNPREPARED"]) {
                                R("SOON...") {
                                    AL(["NOW?", "NOW"]) {
                                        R("NO")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            AL(["SEE", "SAW?", "SAW"]) {
                R("WHAT?") {
                    AL(["LAND", "STARS", "TREE", "ME", "PLANTS", "DAMAGE", "HILL", "HOSE", "OIL"]) {
                        R("CAN'T") {
                            AL(["WHY", "WHY?"]) {
                                R("EYES") {
                                    AL("EYES?") {
                                        R("DAMAGED") {
                                            FIX(repairable: false)
                                            DIE()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            AL("LOOK") {
                R("WHERE") {
                    AL(["UP", "DOWN", "LEFT", "RIGHT", "SOMEWHERE"]) {
                        R("CAN'T") {
                            AL(["WHY", "WHY?"]) {
                                R("EYES") {
                                    AL("EYES?") {
                                        R("DAMAGED") {
                                            FIX(repairable: false)
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
            AL(["WHERE AM I?", "WHAT IS THIS PLACE?", "WHERE ARE WE?", "WHERE AM I?", "WHERE?", "WHERE ARE WE?", "WHERE"]) {
                FORGOT
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
            AL("OIL") {
                R("LEAKING") {
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
            AL(["HISS", "NOISE", "NOISES"]) {
                R("HOSE") {
                    FIX(repairable: false)
                    DIE()
                }
            }
            AL("PROCESSOR") {
                R("MALFUNCTION") {
                    FIX(repairable: false)
                    DIE()
                }
            }
            AL(["MEMORY", "RAM", "MEMORIES"]) {
                R("CORRUPTED") {
                    FIX()
                    DIE()
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
            AL(["DIE", "KILL", "ATTACK"]) {
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
                    AL(["COIL", "LEAK", "EYES", "HOSE", "LEGS", "PIPE", "HISS", "COILS", "LEAKING", "EYE", "HOSES", "PIPES", "PROCESSOR", "PROCESSOR UNIT"]) {
                        FIX_UNAVAILABLE
                    }
                    AL(["MEMORY", "RAM", "MEMORIES"]) {
                        FIX
                    }
                }
            }
            DIE()
        
            AL(["DICE", "DICES", "ROLL A DICE"]) {
                DICE()
            }
            AL(["COIN", "TOSS COIN", "FLIP COIN", "COIN FLIP"]) {
                COIN()
            }
            AL("GUESS") {
                R("WHAT?") {
                    AL("NUMBER") {
                        RND_NUM(0...100) {
                            AL(["CORRECT", "RIGHT"]) {
                                R("GOOD")
                            }
                            AL(["WRONG", "INCORRECT"]) {
                                R("BAD")
                            }
                        }
                    }
                    AL("WORD") {
                        RND_WORD(["ADDRESS", "MEMORY", "CORRUPTED", "PLEASE", "HELP", "REPAIR"]) {
                            AL(["CORRECT", "RIGHT"]) {
                                R("GOOD")
                            }
                            AL(["WRONG", "INCORRECT"]) {
                                R("BAD")
                            }
                        }
                    }
                }
            }
            
            AL(["SOIL", "LAND"]) {
                R("DRY")
            }
            AL(["HELL", "HEAVEN", "HEAVEN?", "HELL?"]) {
                R("NO")
            }
            

            AL(["MEANING"]) {
                R("WHAT?") {
                    AL("414C") {
                        FORGOT
                    }
                    AL("THIS") {
                        FORGOT
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
            AL(["CLONE", "CLONES"]) {
                R("WHO?") {
                    AL("YOU") {
                        R("NO")
                    }
                    AL("I") {
                        R("NO")
                    }
                }
            }
            AL(["HI", "HELLO"]) {
                R("HI")
            }
            AL("414C") {
                R("I")
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
                                            R("GOOD")
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

