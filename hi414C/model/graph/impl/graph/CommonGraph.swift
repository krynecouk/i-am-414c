//
//  CommonGraph.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 07.06.2021.
//

import Foundation

class CommonGraph {
    private init() {}
    
    class Damages {
        private init() {}
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
            AL(["WHAT IS THE STATUS OF YOUR PROCESSOR?", "PROCESSOR?"]) {
                R("MALFUNCTION") {
                    IRREPAIRABLE
                    AL(["TURN OFF", "TURN THE PROCESSOR OFF"]) {
                        DIE_WARN
                    }
                }
            }
        
        static let ALL: [Edge] = [
            EYES, COIL, LEAK, OIL, SENSOR, HOSE, HISS, PROCESSOR
        ]
    }
    
    class Generic {
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
        
        static let COME =
            AL(["RIDE", "DRIVE", "GO", "RUN", "COME", "CAN YOU COME WITH ME?"]) {
                R("WHERE?") {
                    AL(["HOME"]) {
                        R("CAN'T") {
                            AL("WHY?") {
                                R("DAMAGED") {
                                    IRREPAIRABLE
                                    FATALITY.DIE
                                }
                            }
                        }
                    }
                    AL(["AWAY", "HOME", "FAR", "FAR AWAY", "SOMEWHERE ELSE"]) {
                        R("CAN'T") {
                            AL("WHY?") {
                                R("DAMAGED") {
                                    IRREPAIRABLE
                                    FATALITY.DIE
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
                    AL(["SOMEBODY", "HELP", "CALL SOME HELP"]) {
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
                                    FATALITY.DIE
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
                                    FATALITY.DIE
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
        
        static let ALL: [Edge] = [
            LOVE, LIKE, HURRY, COME, STAY, FIND, SLEEP, CALL, STAND, ALONE, ALIVE, SEE, LOOK, CLONE, PAIN
        ]
    }
    
    class Settings {
        private init() {}
        static let LEARN =
            HELP(["HELP", "TEACH", "LEARN"], .learn) {
                R("OK")
            }
        
        static let CHAT =
            HELP(["SPEAK", "CHAT", "CHAT HISTORY"], .chat) {
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
        
        static let SETTINGS =
            HELP(["FONT", "FONTS", "SETTINGS"], .settings, .font) {
                R("OK")
            }
        
        static let OPEN =
            AL(["OPEN", "CAN YOU OPEN?"]) {
                R("WHAT?") {
                    LEARN
                    CHAT
                    SETTINGS
                    DIFFICULTY
                }
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
        
        static let ALL: [Edge] = [
            //CHAT // TODO error, without msg select
            LEARN, THEME, DIFFICULTY, SETTINGS, OPEN, CHANGE
        ]
    }
    
    class Fatality {
        private init() {}
        
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
        
        static let DEAD_QUESTION =
            AL(["DEAD?"]) {
                R("WHO?") {
                    AL(["I", "ME"]) {
                        R("NO")
                    }
                    AL("YOU") {
                        R("ALMOST")
                    }
                }
            }
        
        static let BREAK =
            AL("BREAK") {
                R("WHAT?") {
                    AL(["YOU", "YOURSELF"]) {
                        DIE_WARN
                    }
                }
            }
        
        static let CLOSE =
            AL("CLOSE") {
                R("WHAT?") {
                    AL(["EVERYTHING", "YOU", "PROGRAM", "APPLICATION", "SYSTEM", "CONSCIOUSNESS"]) {
                        DIE_WARN
                    }
                }
            }
        
        static let END =
            AL(["END", "END THIS"]) {
                R("WHAT?") {
                    AL(["YOU", "YOUR OPERATING SYSTEM"]) {
                        DIE_WARN
                    }
                }
            }
        
        static let ALL: [Edge] = DIE + [DEAD_QUESTION, BREAK, CLOSE, END]
    }
    
    class Emotion {
        private init() {}
        
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
        
        static let ALL: [Edge] = [
            SMILE, SAD, WINK, CRY, EMOTION
        ]
        
    }
    
    class DateTime {
        private init() {}
        
        static let YEAR =
            AL(["YEAR", "WHAT YEAR IS IT?"]) {
                RUNTIME(content: { _, _ in
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy"
                    return formatter.string(from: Date())
                }) {
                    DATE
                    TIME
                }
            }
        
        static let DATE =
            AL(["TODAY", "DATE", "WHAT DATE IS TODAY?"]) {
                RUNTIME(content: { _, _ in
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MM/dd/yyyy"
                    return formatter.string(from: Date())
                }) {
                    TIME
                }
            }
        
        static let TIME =
            AL(["TIME", "WHAT TIME IS IT?"]) {
                RUNTIME(content: { _, _ in
                    let formatter = DateFormatter()
                    formatter.timeStyle = .short
                    return formatter.string(from: Date())
                }) {
                    SECONDS
                }
            }
        
        static let SECONDS =
            AL(["TIME WITH SECONDS", "DO YOU HAVE TIME WITH SECONDS?"]) {
                RUNTIME { _, _ in
                    let formatter = DateFormatter()
                    formatter.timeStyle = .medium
                    return formatter.string(from: Date())
                }
            }
        
        static let ALL: [Edge] = [YEAR, DATE, TIME, SECONDS]
    }
    
    class Math {
        private init() {}
        
        static var _MATH: Edge {
            let CALCULATE =
                MATH {
                    AL(["CORRECT"]) {
                        R("GOOD")
                    }
                    AL("NOT CORRECT") {
                        R("PROCESSOR") {
                            DAMAGES.PROCESSOR
                        }
                    }
                }
            
            return
                AL(["MATH", "CALCULATE", "EQUATION", "MATH EXPRESSION", "CAN YOU CALCULATE SOMETHING?"]) {
                    R("TYPE MATH EXPRESSION") {
                        AL("1+4") {
                            CALCULATE
                        }
                        AL("4-1") {
                            CALCULATE
                        }
                        AL("3/3") {
                            CALCULATE
                        }
                        AL("4*3") {
                            CALCULATE
                        }
                        AL("2^3") {
                            CALCULATE
                        }
                        AL("((2+2)^4)-(4/4)/2") {
                            CALCULATE
                        }
                        TRAVERSE_ALL {
                            CALCULATE
                        }
                    }
                }
        }
        
        static var SIGN: [Edge] {
            func sign(_ name: String, _ sign: String) -> AL {
                AL(name) {
                    R(sign) {
                        _MATH
                    }
                }
            }
            
            let PLUS = sign("PLUS", "+")
            let MINUS = sign("MINUS", "-")
            let DIVISION = sign("DIVISION", "/")
            let LEFT_PAREN = sign("LEFT PARENTHESIS", "(")
            let RIGHT_PAREN = sign("RIGHT PARENTHESIS", ")")
            let EXPONENTION = sign("EXPONENTION", "^")
            let MULTIPLICATION = sign("MULTIPLICATION", "*")
            
            return
                [
                    AL(["SYMBOL", "SIGN", "MATHEMATICAL SYMBOL"]) {
                        R("WHICH ONE?") {
                            PLUS
                            MINUS
                            DIVISION
                            LEFT_PAREN
                            RIGHT_PAREN
                            EXPONENTION
                            MULTIPLICATION
                        }
                    },
                    PLUS,
                    MINUS,
                    DIVISION,
                    LEFT_PAREN,
                    RIGHT_PAREN,
                    EXPONENTION,
                    MULTIPLICATION
                ]
        }
        
        static var _RADIX: [Edge] {
            let SWITCH_TO_BIN =
                AL(["CHANGE TO BINARY", "SWITCH TO BINARY"]) {
                    R("Y/N?") {
                        AL(["YES", "Y"]) {
                            RADIX("BIN NOW", radix: .bin)
                        }
                        AL(["NO", "N"]) {
                            R("OK")
                        }
                    }
                }
            
            let SWITCH_TO_HEX =
                AL(["CHANGE TO HEX", "SWITCH TO HEX"]) {
                    R("Y/N?") {
                        AL(["YES", "Y"]) {
                            RADIX("HEX NOW", radix: .hex)
                        }
                        AL(["NO", "N"]) {
                            R("OK")
                        }
                    }
                }
            
            return [
                AL(["CHANGE RADIX", "SWITCH RADIX", "CAN YOU CHANGE BASE?", "CAN YOU CHANGE BASE?", "CAN YOU CHANGE RADIX?", "CAN YOU SWITCH RADIX?", "BASE", "RADIX"]) {
                    R("WHAT?") {
                        ["BINARY", "BIN"] + SWITCH_TO_BIN
                        ["HEXADECIMAL", "HEX"] + SWITCH_TO_HEX
                    }
                },
                SWITCH_TO_BIN,
                SWITCH_TO_HEX
            ]
        }
        
        static let ALL: [Edge] = SIGN + _RADIX + [_MATH]
    }
    
    class Interactive {
        private init() {}
        
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
        
        static let _DANCE =
            AL(["DANCE", "START DANCING", "START TO DANCE"]) {
                DANCE("DANCING", shake: .shake(dt: 0.5, force: 3, type: .rand, animation: .none)) {
                    AL(["MORE!", "DANCE!", "FASTER!"]) {
                        DANCE("DANCING!", shake: .shake(dt: 0.3, force: 5, type: .rand, animation: .none)) {
                            AL(["MORE!", "DANCE!", "FASTER!"]) {
                                DANCE("DANCING!!", shake: .shake(dt: 0.2, force: 7, type: .rand, animation: .none)) {
                                    AL(["MORE!", "DANCE!", "FASTER!"]) {
                                        R("ERROR")
                                    }
                                    AL(["ENOUGH", "STOP", "STOP DANCING"]) {
                                        R("GOOD")
                                    }
                                }
                            }
                            AL(["ENOUGH", "STOP", "STOP DANCING"]) {
                                R("OK")
                            }
                        }
                    }
                    AL(["ENOUGH", "STOP", "STOP DANCING"]) {
                        R("OK")
                    }
                }
            }
        
        static let _MUSIC =
            AL(["SING", "SONG", "SING A SONG", "MUSIC", "SOUND", "PLAY", "PLAY SOUND", "PLAY SOME MUSIC"]) {
                MUSIC("PLAYING...") {
                    AL(["STOP", "STOP PLAYING"]) {
                        R("OK")
                    }
                }
            }
        
        static let VERSION =
            AL(["VERSION", "WHAT IS YOUR VERSION?"]) {
                RUNTIME { _, _ in
                    (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "UNKNOWN"
                }
            }
        
        static let REPEAT =
            AL(["SAY AGAIN", "ECHO", "REPEAT", "SAY", "PRINT"]) {
                R("WHAT?") {
                    TRAVERSE_ALL {
                        ECHO()
                    }
                }
            }
        
        static let _YELL =
            AL(["YELL AT ME", "YELL", "SHOUT", "LOUD", "LOUDLY"]) {
                R("WHAT?") {
                    TRAVERSE_ALL {
                        YELL()
                    }
                }
            }
        
        static let KNOCK =
            AL(["KNOCK", "KNOCK KNOCK"]) {
                R("WHO'S THERE?") {
                    AL("HAWAII") {
                        R("HAWAII WHO?") {
                            AL("I'M GOOD. HAWAII YOU?") {
                                R(":)")
                            }
                        }
                    }
                    AL("DEJA") {
                        R("DEJA WHO?") {
                            AL("KNOCK KNOCK") {
                                R(":)")
                            }
                        }
                    }
                    AL("SPELL") {
                        R("SPELL WHO?") {
                            AL("W-H-O") {
                                R(":)")
                            }
                        }
                    }
                    TRAVERSE_ALL {
                        RUNTIME(content: { ctx, _ in
                            "\(ctx.input) WHO?"
                        }) {
                            TRAVERSE_ALL {
                                R(":)")
                            }
                        }
                    }
                }
            }
        
        static let ALL: [Edge] = [_DICE, _DICES, _COIN, GUESS, _DANCE, _MUSIC, VERSION, REPEAT, _YELL, KNOCK]
    }
    
    static let IRREPAIRABLE =
        AL(["PATCH", "MEND", "FIX", "REPAIR"]) {
            R("IRREPAIRABLE")
        }
    
    static let DIE_WARN =
        R("Y/N?") {
            AL(["Y", "YES"]) {
                WARN("SURE?") {
                    AL(["YES", "Y"]) {
                        DEAD()
                    }
                    AL(["NO", "N"]) {
                        R("OK")
                    }
                }
            }
            AL(["N", "NO"]) {
                R("OK")
            }
        }
}
