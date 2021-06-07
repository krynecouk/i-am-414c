//
//  CommonGraph.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

class CommonGraph {
    private init() {}
    
    static let ALONE =
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
    
    static let ALIVE =
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
    
    static let SEE =
        AL(["SEE", "SAW?", "SAW"]) {
            R("WHAT?") {
                AL(["LAND", "STARS", "TREE", "ME", "PLANTS", "DAMAGE", "HILL", "HOSE", "OIL"]) {
                    R("CAN'T") {
                        AL(["WHY", "WHY?"]) {
                            R("EYES") {
                                AL("EYES?") {
                                    R("DAMAGED") {
                                        COMMON.FIX(repairable: false)
                                        COMMON.DIE()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    
    static let LOOK =
        AL("LOOK") {
            R("WHERE") {
                AL(["UP", "DOWN", "LEFT", "RIGHT", "SOMEWHERE"]) {
                    R("CAN'T") {
                        AL(["WHY", "WHY?"]) {
                            R("EYES") {
                                AL("EYES?") {
                                    R("DAMAGED") {
                                        COMMON.FIX(repairable: false)
                                        COMMON.DIE()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    
    static let EYES =
        AL(["EYES", "EYE"]) {
            R("DAMAGED") {
                FIX(repairable: false)
                COMMON.DIE()
            }
        }
    
    static let COIL =
        AL(["COIL", "COILS"]) {
            R("BROKEN") {
                FIX(repairable: false)
                COMMON.DIE()
            }
        }
    
    static let LEAK =
        AL(["LEAK", "LEAKING"]) {
            R("YES") {
                AL(["WHAT", "WHAT?"]) {
                    R("OIL") {
                        FIX(repairable: false)
                        COMMON.DIE()
                    }
                }
            }
        }
    
    static let OIL =
        AL("OIL") {
            R("LEAKING") {
                FIX(repairable: false)
                COMMON.DIE()
            }
        }
    
    static let HOSE =
        AL(["HOSE", "PIPE", "HOSES", "HOSE?", "PIPES"]) {
            R("BURSTED") {
                FIX(repairable: false)
                COMMON.DIE()
            }
        }
    
    static let HISS =
        AL(["HISS", "NOISE", "NOISES"]) {
            R("HOSE") {
                FIX(repairable: false)
                COMMON.DIE()
            }
        }
    
    static let PROCESSOR =
        AL(["PROCESSOR", "PROCESSOR UNIT"]) {
            R("MALFUNCTION") {
                FIX(repairable: false)
                COMMON.DIE()
            }
        }
    
    static let DICE_ROLL =
        AL(["DICE", "DICES", "ROLL A DICE"]) {
            DICE()
        }
    
    static let COIN_TOSS =
        AL(["COIN", "TOSS COIN", "FLIP COIN", "COIN FLIP"]) {
            COIN()
        }
    
    static let GUESS =
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
    
    static let SMILE =
        AL(["SMILE", "HAPPY"]) {
            R(":-)")
        }
    
    static let SAD =
        AL (["SAD", "UNHAPPY"]) {
            R(":-(")
        }
    
    static let WINK =
        AL (["WINK"]) {
            R(";-)")
        }
    
    static let CRY =
        AL(["CRY", "TEAR", "TEARS"]) {
            R(":'-(")
        }
    
    static let EMOTION =
        AL (["EMOTION", "EMOTIONS"]) {
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
    
    static let LEARN =
        HELP(["LEARN", "HELP", "TEACH"], .learn) {
            R("OK")
        }
    
    static let CHAT =
        HELP(["CHAT", "SPEAK"], .chat) {
            R("OK")
        }
    
    static let SETTINGS =
        HELP(["SETTINGS", "FONT", "FONTS"], .settings, .font) {
            R("OK")
        }
    
    static let THEME =
        HELP(["THEME", "THEMES", "COLOR", "COLORS"], .settings, .theme) {
            R("OK")
        }
    
    static let DIFFICULTY =
        HELP(["DIFFICULTY", "LEVEL"], .settings, .difficulty) {
            R("OK")
        }
    
    static let CHANGE =
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
    
    static let REPEAT =
        AL(["ECHO", "REPEAT", "SAY", "PRINT"]) {
            R("WHAT?") {
                ALL {
                    ECHO()
                }
            }
        }
    
    static let SHOUT =
        AL(["YELL", "SHOUT", "LOUD", "LOUDLY"]) {
            R("WHAT?") {
                ALL {
                    YELL()
                }
            }
        }
    
    static let CLONE =
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
    
    static let PAIN =
        AL(["ACHE", "PAIN", "PAIN?", "ACHES"]) {
            R("NO") {
                AL(COMMON.WHY) {
                    R("DEAD")
                }
            }
        }
    
    static let CLOSE =
        AL("CLOSE") {
            R("WHAT?") {
                AL(["YOU", "PROGRAM", "APPLICATION", "SYSTEM", "CONSCIOUSNESS"]) {
                    COMMON.DIE_WARN
                }
            }
        }
    
    static let BREAK =
        AL("BREAK") {
            R("WHAT?") {
                AL(["YOU"]) {
                    COMMON.DIE_WARN
                }
            }
        }
    
    static let HELL =
        AL(["IS THIS HELL?", "IS THIS HEAVEN?", "HELL", "HEAVEN", "HEAVEN?", "HELL?"]) {
            R("NO") {
                AL(["THEN WHAT IS IT?", "WHERE ARE WE?"]) {
                    R("YOUR MIND")
                }
            }
        }
    
    static let DEAD_QUESTION =
        AL(["DEAD?", "DEAD"]) {
            R("WHO?") {
                AL("I") {
                    R("NO")
                }
                AL("YOU") {
                    R("YES")
                }
            }
        }
    
    static let WHY = ["WHY?", "REASON?", "WHY", "REASON"]
    
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
}
