//
//  CommonGraph.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

class CommonGraph {
    private init() {}
    
    static let LOVE =
        AL(["DO YOU LOVE?", "LOVE"]) {
            R("WHO?") {
                AL(["YOU", "ME", "ANYBODY"]) {
                    R("CAN'T") {
                        AL(WHY) {
                            R("ROBOT")
                        }
                    }
                }
            }
        }
    
    static let HURRY =
        AL(["HURRY UP!", "HURRY!", "HURRY"]) {
            R("WHY?") {
                AL("CAN YOU HURRY UP?") {
                    R("NO, DAMAGED")
                }
                AL("ARE YOU IN HURRY?") {
                    R("NO, I'AM NOT")
                }
                AL("TIME") {
                    R("PLENTY")
                }
                AL("LATE") {
                    R("NEVERMIND")
                }
                AL("WE ARE RUNNING OUT OF TIME") {
                    R("NO, WE'RE NOT")
                }
            }
        }
    
    static let LIKE =
        AL(["DO YOU LIKE?", "LIKE?", "LIKE"]) {
            R("WHAT?") {
                AL(["DO YOU LIKE ME?", "DO YOU LIKE YOURSELF?", "ME", "YOURSELF"]) {
                    R("SOMETIMES")
                }
                AL(["DO YOU LIKE TALKING WITH ME?", "TALKING"]) {
                    R("YES")
                }
                AL(["DO YOU LIKE IT HERE?", "HERE", "LYING", "DYING"]) {
                    R("NO")
                }
            }
        }
    
    static let COME =
        AL(["COME", "GO", "RIDE", "DRIVE"]) {
            R("WHERE?") {
                AL(["SOMEWHERE ELSE", "AWAY", "HOME", "FAR", "FAR AWAY"]) {
                    R("CAN'T") {
                        AL(WHY) {
                            R("DAMAGED") {
                                COMMON.FIX(repairable: false)
                                COMMON.DIE()
                            }
                        }
                    }
                }
            }
        }
    
    static let STAY =
        AL(["STAY THERE", "STAY", "DON'T MOVE"]) {
            R("OK")
        }

    
    static let FIND =
        AL(["FIND", "SEARCH"], silent: ["FOUND", "FINDING"]) {
            R("WHAT?") {
                AL(["HELP", "SOMEONE", "SOMEBODY"]) {
                    R("CAN'T") {
                        AL(WHY) {
                            R("DAMAGED") {
                                COMMON.FIX(repairable: false)
                                COMMON.DIE()
                            }
                        }
                    }
                }
                AL("MEMORIES") {
                    R("CAN'T") {
                        AL(WHY) {
                            PANIC("MEMORY") {
                                COMMON.FIX()
                                COMMON.DIE()
                            }
                        }
                    }
                }
            }
        }
    
    static let GO =
        AL(["GO", "RUN"]) {
            R("WHERE?") {
                AL(["HOME", "AWAY"]) {
                    R("CAN'T") {
                        AL(WHY) {
                            R("DAMAGED") {
                                COMMON.FIX(repairable: false)
                                COMMON.DIE()
                            }
                        }
                    }
                }
            }
        }
    
    static let SLEEP =
        AL(["SLEEP", "EAT", "DRINK"]) {
            R("CAN'T") {
                AL(WHY) {
                    R("ROBOT")
                }
            }
        }
    
    static let CALL =
        AL(["CALL"]) {
            R("WHO?") {
                AL(["HELP", "SOMEONE", "SOMEBODY"]) {
                    R("CAN'T") {
                        AL(WHY) {
                            R("DAMAGED") {
                                COMMON.FIX(repairable: false)
                                COMMON.DIE()
                            }
                        }
                    }
                }
            }
        }
    
    static let STAND =
        AL(["STAND-UP", "STAND UP", "STAND", "RISE", "STANDUP"]) {
            R("CAN'T") {
                AL(WHY) {
                    R("LEGS") {
                        AL(["LEGS?"]) {
                            R("DAMAGED") {
                                COMMON.FIX(repairable: false)
                                COMMON.DIE()
                            }
                        }
                    }
                    
                }
            }
            
        }
    
    static let ALONE =
        AL(["ALONE"]) {
            R("WHO?") {
                AL(["I", "YOU", "BOTH"]) {
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
        AL(["SAW?", "SEE", "SAW"]) {
            R("WHAT?") {
                AL(["LAND", "STARS", "TREE", "ME", "PLANTS", "DAMAGE", "HILL"]) {
                    R("CAN'T") {
                        AL(["WHY?", "WHY"]) {
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
                OIL
                HOSE
                PROCESSOR
            }
        }
    
    static let LOOK =
        AL("LOOK") {
            R("WHERE") {
                AL(["FOR HELP", "FOR SOMEBODY ELSE", "UP", "DOWN", "LEFT", "RIGHT", "SOMEBODY", "SOMEWHERE"]) {
                    R("CAN'T") {
                        AL(["WHY?", "WHY"]) {
                            R("DAMAGED") {
                                COMMON.FIX(repairable: false)
                                COMMON.DIE()
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
        AL(["WHAT IS LEAKING?", "WHERE IS IT LEAKING?", "LEAK", "LEAKING"]) {
            R("OIL") {
                FIX(repairable: false)
                COMMON.DIE()
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
        AL(["WHAT ARE THOSE NOISES?", "WHERE IS IT HISSING?", "HISS", "HISSING", "NOISE", "NOISES"]) {
            R("HOSE") {
                FIX(repairable: false)
                COMMON.DIE()
            }
        }
    
    static let PROCESSOR =
        AL(["WHAT IS THE STATUS OF YOUR PROCESSOR?", "PROCESSOR", "PROCESSOR UNIT"]) {
            R("MALFUNCTION") {
                FIX(repairable: false)
                COMMON.DIE()
            }
        }
    
    static let _DICE =
        AL(["ROLL A DICE", "DICE"]) {
            DICE()
        }
    
    static let _DICES =
        AL(["ROLL TWO DICES", "DICES"]) {
            DICE(range: 1...12)
        }
    
    static let _COIN =
        AL(["FLIP A COIN", "TOSS A COIN", "COIN", "COIN FLIP"]) {
            COIN()
        }
    
    static let GUESS =
        AL(["TRY TO GUESS", "GUESS"]) {
            R("WHAT?") {
                AL("NUMBER") {
                    RND_NUM(0...100) {
                        AL(["YES, THAT'S CORRECT", "CORRECT", "RIGHT"]) {
                            R("GOOD")
                        }
                        AL(["NO, THAT'S WRONG", "WRONG", "INCORRECT"]) {
                            R("BAD")
                        }
                    }
                }
                AL("WORD") {
                    RND_WORD(["ADDRESS", "MEMORY", "CORRUPTED", "PLEASE", "HELP", "REPAIR"]) {
                        AL(["YES, THAT'S CORRECT", "CORRECT", "RIGHT"]) {
                            R("GOOD")
                        }
                        AL(["NO, THAT'S WRONG", "WRONG", "INCORRECT"]) {
                            R("BAD")
                        }
                    }
                }
            }
        }
    
    static let DANCE =
        AL("DANCE") {
            SHAKE("DANCING", shake: .shake(dt: 0.5, force: 3, type: .rand, animation: .none)) {
                AL(["FASTER!", "DANCE!", "MORE!", "DANCE", "FASTER", "MORE"]) {
                    SHAKE("DANCING!", shake: .shake(dt: 0.3, force: 5, type: .rand, animation: .none)) {
                        AL(["FASTER!", "DANCE!", "MORE!", "DANCE", "FASTER", "MORE"]) {
                            SHAKE("DANCING!!", shake: .shake(dt: 0.2, force: 7, type: .rand, animation: .none)) {
                                AL(["ENOUGH", "STOP"]) {
                                    R("GOOD")
                                }
                                AL(["FASTER!", "DANCE!", "MORE!", "DANCE", "FASTER", "MORE"]) {
                                    R("ERROR")
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
        AL(["SAY AGAIN", "ECHO", "REPEAT", "SAY", "PRINT"]) {
            R("WHAT?") {
                ALL {
                    ECHO()
                }
            }
        }
    
    static let SHOUT =
        AL(["YELL AT ME", "YELL", "SHOUT", "LOUD", "LOUDLY"]) {
            R("WHAT?") {
                ALL {
                    YELL()
                }
            }
        }
    
    static let CLONE =
        AL(["CLONE", "CLONES"]) {
            R("WHO?") {
                AL(["YOU", "I"]) {
                    R("NO")
                }
            }
        }
    
    static let PAIN =
        AL(["DO YOU FEEL PAIN?", "ACHE", "PAIN", "PAIN?", "ACHES", "HURT?", "HURTING?", "HURT", "HURTING"]) {
            R("NO") {
                AL(COMMON.WHY) {
                    R("INANIMATE")
                }
            }
        }
    
    static let CLOSE =
        AL("CLOSE") {
            R("WHAT?") {
                AL(["EVERYTHING", "YOU", "PROGRAM", "APPLICATION", "SYSTEM", "CONSCIOUSNESS"]) {
                    COMMON.DIE_WARN
                }
            }
        }
    
    static let BREAK =
        AL("BREAK") {
            R("WHAT?") {
                AL(["YOU", "YOURSELF"]) {
                    COMMON.DIE_WARN
                }
            }
        }
    
    static let HELL =
        AL(["IS THIS HELL?", "IS THIS HEAVEN?", "HELL", "HEAVEN", "HEAVEN?", "HELL?"]) {
            R("NO") {
                AL(["WHAT IS IT", "THEN WHAT IS IT?", "WHERE ARE WE?"]) {
                    R("YOUR MIND")
                }
            }
        }
    
    static let DEAD_QUESTION =
        AL(["DEAD?", "DEAD"]) {
            R("WHO?") {
                AL(["I", "ME"]) {
                    R("NO")
                }
                AL("YOU") {
                    R("ALMOST")
                }
            }
        }
    
    static let WHY = ["WHY", "TELL ME MORE", "EXPLAIN", "REASON", "TELL MORE"]
    
    static func FIX(repairable: Bool = true, variants: [String] = []) -> Edge {
        AL(["RELOAD", "REFRESH", "FIX", "REPAIR", "RESTORE", "PATCH", "MEND", "UPGRADE", "REPLACE"] + variants) {
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
    
    static let FIX_UNAVAILABLE = R("IRREPAIRABLE")
    
    
    static func DIE(_ names: [String] = []) -> Edge {
        AL(["OFF", "TURN OFF", "RESTART", "RESET", "TERMINATE", "DELETE"] + names) {
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
