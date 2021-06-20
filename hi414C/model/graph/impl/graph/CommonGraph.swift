//
//  CommonGraph.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

import Foundation

class CommonGraph {
    private init() {}

    static let LOVE =
        AL(["LOVE", "DO YOU LOVE?"]) {
            R("WHO?") {
                AL(["YOU", "ME", "SOMEBODY", "DO YOU LOVE SOMEBODY?"]) {
                    R("CAN'T") {
                        AL(["WHY?"]) {
                            R("ONLY A ROBOT")
                        }
                    }
                }
            }
        }

    static let HURRY =
        AL(["HURRY", "HURRY!", "HURRY UP!"]) {
            R("WHY?") {
                AL(["CAN YOU?", "CAN YOU HURRY UP?"]) {
                    R("NO, DAMAGED")
                }
                AL("ARE YOU IN A HURRY?") {
                    R("NO, I'AM NOT")
                }
                AL(["TIME", "DO WE HAVE TIME?"]) {
                    R("A LITTLE")
                }
                AL(["LATE", "BECAUSE IT'S LATE"]) {
                    R("NEVERMIND")
                }
                AL("ARE WE RUNNING OUT OF TIME?") {
                    R("MAYBE")
                }
            }
        }

    static let LIKE =
        AL(["LIKE?", "DO YOU LIKE?"]) {
            R("WHAT?") {
                AL(["TALKING", "DO YOU LIKE TALKING WITH ME?"]) {
                    R("YES")
                }
                AL(["HERE", "DO YOU LIKE IT HERE?"]) {
                    R("NO")
                }
                AL(["THIS PLACE", "DO YOU LIKE THIS PLACE?"]) {
                    R("SOMETIMES")
                }
            }
        }

    static let COME =
        AL(["RIDE", "DRIVE", "GO", "RUN", "COME", "CAN YOU COME WITH ME?"]) {
            R("WHERE?") {
                AL(["HOME"]) {
                    R("CAN'T") {
                        AL("WHY?") {
                            R("DAMAGED") {
                                IRREPAIRABLE
                                DIE
                            }
                        }
                    }
                }
                AL(["AWAY", "HOME", "FAR", "FAR AWAY", "SOMEWHERE ELSE"]) {
                    R("CAN'T") {
                        AL("WHY?") {
                            R("DAMAGED") {
                                IRREPAIRABLE
                                DIE
                            }
                        }
                    }
                }
            }
        }

    static let STAY =
        AL(["STAY", "DON'T MOVE", "STAY THERE"]) {
            R("OK")
        }

    static let FIND =
        AL(["SEARCH", "FOUND", "FINDING", "FIND", "CAN YOU FIND?"]) {
            R("WHAT?") {
                AL(["SOMEONE", "SOMEBODY"]) {
                    R("CAN'T") {
                        AL(["WHY?", "WHY CAN'T WE FIND SOMEONE?"]) {
                            R("ALONE")
                        }
                    }
                }
                AL(["HELP"]) {
                    R("CAN'T") {
                        AL(["WHY?", "WHY CAN'T WE FIND HELP?"]) {
                            R("ALONE")
                        }
                    }
                }
            }
        }
    
    static let SLEEP =
        AL(["SLEEP", "EAT", "DRINK"]) {
            R("CAN'T") {
                AL("WHY?") {
                    R("ROBOT")
                }
            }
        }

    static let CALL =
        AL(["CALL"]) {
            R("WHO?") {
                AL(["SOMEONE", "SOMEBODY", "HELP", "CALL SOME HELP"]) {
                    R("CAN'T") {
                        AL("WHY?") {
                            R("ALONE")
                        }
                    }
                }
                AL(["SOMEONE", "CALL SOMEONE"]) {
                    R("CAN'T") {
                        AL("WHY?") {
                            R("ALONE")
                        }
                    }
                }
            }
        }

    static let STAND =
        AL(["STAND-UP", "STAND UP", "STAND", "RISE", "STANDUP", "CAN YOU STAND UP?"]) {
            R("CAN'T") {
                AL(["WHY", "WHY CAN'T YOU STAND UP?"]) {
                    R("LEGS") {
                        AL(["LEGS?", "WHAT IS WITH YOUR LEGS?"]) {
                            R("DAMAGED") {
                                IRREPAIRABLE
                                DIE
                            }
                        }
                    }
                }
            }
        }

    static let ALONE =
        AL(["ALONE"]) {
            R("WHO?") {
                AL(["YOU", "ARE YOU ALONE HERE?"]) {
                    R("YES")
                }
                AL(["WE", "ARE WE ALONE HERE?"]) {
                    R("YES")
                }
            }
        }

    static let ALIVE =
        AL(["ALIVE"]) {
            R("WHO?") {
                AL(["I", "AM I ALIVE?"]) {
                    R("YES")
                }
                AL(["YOU", "ARE YOU ALIVE?"]) {
                    R("NO")
                }
            }
        }

    static var SEE: Edge {
        let CANT =
            R("CAN'T") {
                AL(["WHY?", "WHY CAN'T YOU SEE?"]) {
                    R("EYES") {
                        // TODO EYES
                        AL(["EYES?", "WHAT IS WITH YOUR EYES?"]) {
                            R("DAMAGED") {
                                IRREPAIRABLE
                                DIE
                            }
                        }
                    }
                }
            }
        
        return
            AL(["SAW", "SEE", "SAW?", "SEE?", "DID YOU SAW?", "CAN YOU SEE?"]) {
                R("WHAT?") {
                    AL(["LAND", "CAN YOU SEE LAND?"]) {
                        CANT
                    }
                    AL(["STARS", "CAN YOU SEE STARS?"]) {
                        CANT
                    }
                    AL(["TREE", "CAN YOU SEE TREES?"]) {
                        CANT
                    }
                    AL(["ME", "CAN YOU SEE ME?"]) {
                        CANT
                    }
                    AL(["PLANTS", "CAN YOU SEE PLANTS?"]) {
                        CANT
                    }
                    AL(["DAMAGE", "CAN YOU SEE DAMAGE?"]) {
                        CANT
                    }
                    AL(["HILL", "CAN YOU SEE HILL?"]) {
                        CANT
                    }
                }
            }
    }

    static var LOOK: Edge {
        let CANT =
            R("CAN'T") {
                AL(["WHY?", "WHY CAN'T YOU LOOK?"]) {
                    R("EYES DAMAGED") {
                        IRREPAIRABLE
                        AL(["RIP OUT", "RIP THEM OUT OF YOUR HEAD"]) {
                            DIE_WARN
                        }
                    }
                }
            }
        
        return
            AL("LOOK") {
                R("WHERE") {
                    AL(["UP"]) {
                        CANT
                    }
                    AL(["DOWN"]) {
                        CANT
                    }
                    AL(["LEFT"]) {
                        CANT
                    }
                    AL(["RIGHT"]) {
                        CANT
                    }
                    AL(["SOMEBODY", "LOOK FOR SOMEBODY ELSE"]) {
                        CANT
                    }
                    AL(["SOMEWHERE", "LOOK SOMEWHERE ELSE"]) {
                        CANT
                    }
                }
            }
    }

    static let EYES =
        AL(["EYE", "EYES"]) {
            R("DEFECTIVE") {
                IRREPAIRABLE
                AL(["RIP OUT", "RIP THEM OUT OF YOUR HEAD"]) {
                    DIE_WARN
                }
            }
        }

    static let COIL =
        AL(["COIL", "COILS", "COIL SPRING"]) {
            R("BROKEN") {
                IRREPAIRABLE
                AL(["BREAK", "BREAK IT COMPLETELY"]) {
                    DIE_WARN
                }
            }
        }

    static let LEAK =
        AL(["LEAK", "LEAKING", "WHERE IS IT LEAKING?", "WHAT IS LEAKING?"]) {
            R("OIL") {
                IRREPAIRABLE
                AL(["DUMP", "DUMP ALL THE OIL"]) {
                    DIE_WARN
                }
            }
        }

    static let OIL =
        AL("OIL") {
            R("LEAKING") {
                IRREPAIRABLE
                AL(["DUMP", "DUMP ALL THE OIL"]) {
                    DIE_WARN
                }
            }
        }
    
    static let SENSOR =
        AL(["SENSOR", "SENSOR", "SENSORS"]) {
            R("MALFUNCTIONING") {
                IRREPAIRABLE
                AL(["THROW", "THROW IT AWAY", "THROW THAT SENSORS AWAY"]) {
                    DIE_WARN
                }
            }
        }

    static let HOSE =
        AL(["PIPE", "HOSES", "PIPES", "HOSE", "MAIN INLET HOSE"]) {
            R("BURSTED") {
                IRREPAIRABLE
                AL(["THROW", "THROW IT AWAY", "THROW THAT BURSTED HOSE AWAY"]) {
                    DIE_WARN
                }
            }
        }

    static let HISS =
        AL(["NOISES", "NOISE", "HISS", "HISSING", "WHAT ARE THOSE NOISES?", "WHERE IS IT HISSING?"]) {
            R("BURSTED HOSE") {
                IRREPAIRABLE
                AL(["THROW", "THROW IT AWAY"]) {
                    DIE_WARN
                }
            }
        }

    static let PROCESSOR =
        AL(["WHAT IS THE STATUS OF YOUR PROCESSOR?", "PROCESSOR", "PROCESSOR UNIT"]) {
            R("MALFUNCTION") {
                IRREPAIRABLE
                AL(["TURN OFF", "TURN THE PROCESSOR OFF"]) {
                    DIE_WARN
                }
            }
        }

    static let _DICE =
        AL(["ROLL A DICE", "DICE"]) {
            DICE()
        }

    static let _DICES =
        AL(["ROLL TWO DICES", "DICES"]) {
            DICE(range: 1 ... 12)
        }

    static let _COIN =
        AL(["FLIP A COIN", "TOSS A COIN", "COIN", "COIN FLIP"]) {
            COIN()
        }

    static let GUESS =
        AL(["TRY TO GUESS", "GUESS"]) {
            R("WHAT?") {
                AL("NUMBER") {
                    RND_NUM(0 ... 100) {
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
        AL(["SAD", "UNHAPPY"]) {
            R(":-(")
        }

    static let WINK =
        AL(["WINK"]) {
            R(";-)")
        }

    static let CRY =
        AL(["CRY", "TEAR", "TEARS"]) {
            R(":'-(")
        }

    static let EMOTION =
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
        AL(["DO YOU FEEL PAIN?", "ACHE", "PAIN", "HURT", "PAIN?", "ACHES", "HURTING?", "HURT?", "HURTING"]) {
            R("NO") {
                AL(["WHY?", "WHY DON'T YOU FEEL ANY PAIN?"]) {
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
        AL(["DEAD", "DEAD?"]) {
            R("WHO?") {
                AL(["I", "ME"]) {
                    R("NO")
                }
                AL("YOU") {
                    R("ALMOST")
                }
            }
        }
    
    static let IRREPAIRABLE =
        AL(["PATCH", "MEND", "FIX", "REPAIR"]) {
            R("IRREPAIRABLE")
        }
    
    static var DIE: [Edge] {
        return
            [
                AL(["OFF", "TURN OFF", "TURN IT OFF"]) {
                    DIE_WARN
                },
                AL(["RESTART"]) {
                    DIE_WARN
                },
                AL(["RESET"]) {
                    DIE_WARN
                },
                AL(["TERMINATE"]) {
                    DIE_WARN
                }
            ]
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
    
    static var MATH: Edge {
        AL(["MATH", "CALCULATE", "EQUATION", "CAN YOU CALCULATE SOMETHING?"]) {
            R("WHAT?") {
                ALL {
                    RUNTIME(content: { ctx, toolkit in
                        let expr = NSExpression(format: ctx.input)
                        if let result = expr.expressionValue(with: nil, context: nil) as? NSNumber {
                            let x = result.doubleValue
                            return String(x)
                        } else {
                            return "ERROR"
                        }
                    }) {
                        AL(["CORRECT"]) {
                            R("GOOD")
                        }
                        AL("NOT CORRECT") {
                            R("PROCESSOR") {
                                PROCESSOR
                            }
                        }
                    }
                }
            }
        }
    }
}
