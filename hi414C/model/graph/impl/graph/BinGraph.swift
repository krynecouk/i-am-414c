//
//  BinGraph.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.06.2021.
//

class BinGraph {
    private init() {}

    public static let HI =
        ROOT("HI") {
            BIN._HI
            BIN._414C
            BIN.I
            BIN._AL
            BIN.YOU

            BIN.WHO
            BIN.WHERE
            BIN.WHY
            BIN.HOW
            BIN.WHAT

            BIN.NAME
            BIN.HELP
            BIN.MEANING
            BIN.CAUSE
            BIN.ORIGIN
            BIN.TELL
            BIN.CRASH
            BIN.LIE

            BIN.LIVE
            BIN.DIE
            BIN.REPAIR
            BIN.LOGIN
            BIN.LOGOUT
            BIN.WAKE
            BIN.MEMORY
            BIN.REMEMBER

            BIN.SOIL
            BIN.HOPE
            BIN.CLUE

            BIN.EXECUTE
            BIN.COMMAND

            COMMON.EYES
            COMMON.COIL
            COMMON.LEAK
            COMMON.OIL
            COMMON.HOSE
            COMMON.HISS
            COMMON.PROCESSOR

            COMMON.COME
            COMMON.STAY
            COMMON.LIKE
            COMMON.LOVE

            COMMON.FIND
            COMMON.GO
            COMMON.SLEEP
            COMMON.CALL
            COMMON.STAND

            COMMON.ALIVE
            COMMON.ALONE
            COMMON.SEE
            COMMON.LOOK
            COMMON.CHANGE

            COMMON.DEAD_QUESTION

            COMMON.LEARN
            COMMON.CHAT
            COMMON.SETTINGS
            COMMON.DIFFICULTY

            COMMON.REPEAT
            COMMON.SHOUT

            COMMON.PAIN
            COMMON.CLOSE
            COMMON.BREAK

            COMMON.DIE()
            COMMON._DICE
            COMMON._DICES
            COMMON._COIN
            COMMON.GUESS
            COMMON.DANCE
            COMMON.SMILE
            COMMON.SAD
            COMMON.WINK
            COMMON.CRY
            COMMON.EMOTION

            COMMON.CLONE
            COMMON.HELL
        }

    private static let I =
        AL(["I", "ME", "WHO AM I?"]) {
            R("AL")
        }

    private static let _AL =
        AL(["AL", "WHO IS AL?"]) {
            R("YOU")
        }

    private static let YOU =
        AL(["YOU", "WHO ARE YOU?"]) {
            R("I AM 414C")
        }
    
    private static var WHO: [Edge] {
        let WHO_CAN_HELP_YOU =
            AL(["WHO CAN HELP YOU?"]) {
                R("YOU") {
                    HOW_TO_HELP
                }
            }
        
        return
            [
                AL("WHO") {
                    R("WHO?") {
                        I
                        YOU
                        ["CAN HELP?", "WHO CAN HELP?"] + WHO_CAN_HELP_YOU
                    }
                },
                WHO_CAN_HELP_YOU
            ]
    }

    private static var WHERE: [Edge] {
        let WHERE_IS_HELP =
            AL(["WHERE IS HELP?"]) {
                R("YOU ARE HELP") {
                    HOW_TO_HELP
                }
            }
        
        let WHERE_IS_ANYBODY =
            AL(["WHERE IS ANYBODY?"]) {
                R("ALONE")
            }
        
        let WHERE_AM_I =
            AL(["WHERE AM I?"]) {
                R("VOID")
            }
        
        let WHERE_ARE_YOU =
            AL(["WHERE ARE YOU?"]) {
                R("VOID")
            }
        
        let WHERE_ARE_WE =
            AL(["WHERE ARE WE?"]) {
                R("VOID")
            }
        
        let WHERE_IS_DAMAGE =
            AL(["WHERE IS THE DAMAGE?"]) {
                R("MANY PLACES") {
                    AL("FOR EXAMPLE?") {
                        RND_WORD(["COIL", "MEMORY", "EYES", "LEGS", "OIL", "HOSE", "PROCESSOR"])
                    }
                }
            }
        
        let WHERE_ARE_PEOPLE =
            AL(["WHERE ARE PEOPLE?"]) {
                R("NOT HERE") {
                    AL(["WHY?", "WHY THERE ARE NO PEOPLE?"]) {
                        R("VOID")
                    }
                }
            }

        return
            [
                AL("WHERE") {
                    R("WHAT?") {
                        ["HELP"] + WHERE_IS_HELP
                        ["ANYBODY", "SOMEBODY"] + WHERE_IS_ANYBODY
                        ["ME"] + WHERE_AM_I
                        ["YOU"] + WHERE_ARE_YOU
                        ["WE"] + WHERE_ARE_WE
                        ["DAMAGE"] + WHERE_IS_DAMAGE
                        ["PEOPLE"] + WHERE_ARE_PEOPLE
                    }
                },
                WHERE_IS_HELP,
                WHERE_IS_ANYBODY,
                WHERE_AM_I,
                WHERE_ARE_YOU,
                WHERE_ARE_WE,
                WHERE_IS_DAMAGE,
                WHERE_ARE_PEOPLE
            ]
    }

    private static var WHY: [Edge] {
        let CRASH =
            R("CRASH") {
                AL(["CRASH?", "WHAT CRASH?"]) {
                    FORGOTTEN
                }
            }

        let DONT_KNOW =
            R("DON'T KNOW") {
                AL(["DON'T KNOW?", "YOU DON'T KNOW?", "WHY DON'T YOU KNOW?"]) {
                    FORGOTTEN
                }
            }

        let ITS_HELPING =
            R("IT'S HELPING") {
                AL(["HOW?", "HOW IS TALKING HELPING YOU?"]) {
                    R("TO REMEMBER")
                }
            }

        return
            [
                AL("WHY") {
                    R("WHAT?") {
                        AL(["YOU THERE", "WHY ARE YOU THERE?"]) {
                            CRASH
                        }
                        AL(["BROKEN", "DAMAGED", "WHY ARE YOU BROKEN?", "WHY ARE YOU DAMAGED?"]) {
                            FORGOTTEN
                        }
                        AL("WHY AM I HERE?") {
                            R("TO HELP") {
                                HOW_TO_HELP
                            }
                        }
                        AL(["ALONE", "WHY ARE YOU ALONE?"]) {
                            DONT_KNOW
                        }
                        AL(["TALKING", "WHY ARE WE TALKING?"]) {
                            ITS_HELPING
                        }
                    }
                },
            ]
    }

    private static var HOW: [Edge] {
        [
            AL("HOW") {
                R("WHAT?") {
                    AL(["GET OUT", "HOW TO GET OUT?"]) {
                        FORGOTTEN
                    }
                    HOW_TO_HELP
                    AL(["WILL END", "HOW WILL THIS END?"]) {
                        R("DON'T KNOW")
                    }
                    AL(["LONG YOU LIVE", "HOW LONG DO YOU LIVE?"]) {
                        FORGOTTEN
                    }
                }
            },
        ]
    }

    private static var WHAT: [Edge] {
        let NOTHING_EYES =
            R("NOTHING") {
                AL(["WHY?", "WHY CAN'T YOU SEE ANYTHING?", "WHY YOU SEE NOTHING?"]) {
                    R("EYES BROKEN") {
                        COMMON.FIX(repairable: false, variants: ["REPLACE"])
                    }
                }
            }

        let NOTHING_EARS =
            R("NOTHING") {
                AL(["WHY?", "WHY CAN'T YOU HEAR ANYTHING?", "WHY CAN YOU HEAR NOTHING?"]) {
                    R("EARS BROKEN") {
                        COMMON.FIX(repairable: false, variants: ["REPLACE"])
                    }
                }
            }

        let FIX =
            R("FIX") {
                AL(["WHAT", "FIX WHAT?", "WHAT TO FIX?"]) {
                    R("MEMORY") {
                        COMMON.FIX(repairable: true, variants: ["REFRESH"])
                    }
                }
            }

        let FIX_MEMORY =
            R("MEMORY") {
                COMMON.FIX(repairable: true, variants: ["REFRESH"])
            }

        return [
            AL("WHAT") {
                R("WHAT?") {
                    AL(["YOU SEE?", "WHAT YOU SEE?", "WHAT DO YOU SEE?"]) {
                        NOTHING_EYES
                    }
                    AL(["YOU HEAR?", "WHAT YOU HEAR?", "WHAT DO YOU HEAR?"]) {
                        NOTHING_EARS
                    }
                    // TODO: help
                    AL(["WHAT CAN HELP?", "WHAT CAN YOU HELP?"]) {
                        FIX
                    }
                    AL(["IS DAMAGED?", "WHAT IS DAMAGED?"]) {
                        FIX_MEMORY
                    }
                }
            },
            // TODO: TIME - current time?
        ]
    }

    private static var NAME: [Edge] {
        [
            AL("NAME") {
                R("WHOSE?") {
                    AL(["YOURS", "WHAT IS YOUR NAME?"]) {
                        R("414C")
                    }
                    AL(["MINE", "WHAT IS MY NAME?"]) {
                        R("AL")
                    }
                }
            },
        ]
    }

    private static var HELP: [Edge] {
        [
            AL("HELP") {
                R("WHOM?") {
                    AL(["YOU", "CAN I HELP YOU?"]) {
                        R("YES") {
                            HOW_TO_HELP
                        }
                    }
                    AL(["ME", "CAN YOU HELP ME?"]) {
                        R("WHAT WITH?") {
                            COMMON.LEARN
                            COMMON.SETTINGS
                            COMMON.DIFFICULTY
                            COMMON.THEME
                            COMMON.CHANGE
                        }
                    }
                }
            },
        ]
    }

    private static var MEANING: [Edge] {
        [
            AL(["PURPOSE", "MEANING", "WHAT IS THE PURPOSE?", "WHAT IS THE MEANING?"]) {
                R("OF WHAT?") {
                    AL(["ME", "WHAT IS THE PURPOSE OF ME?", "WHAT IS THE MEANING OF ME?"]) {
                        FORGOTTEN
                    }
                    AL(["YOU", "WHAT IS THE PURPOSE OF YOU?", "WHAT IS THE MEANING OF YOU?"]) {
                        FORGOTTEN
                    }
                    AL(["414C", "WHAT IS THE MEANING OF NAME 414C?"]) {
                        FORGOTTEN
                    }
                    AL(["THIS PLACE", "WHAT IS THE PURPOSE OF THIS PLACE?", "WHAT IS THE MEANING OF THIS PLACE?"]) {
                        FORGOTTEN
                    }
                }
            },
        ]
    }

    private static var CAUSE: [Edge] {
        [
            AL(["REASON", "CAUSE", "WHAT IS THE REASON?", "WHAT IS THE CAUSE?"]) {
                R("OF WHAT?") {
                    AL(["DAMAGES", "YOUR DAMAGES", "CAUSE OF YOUR DAMAGES?", "WHAT IS THE CAUSE OF YOUR DAMAGES?"]) {
                        R("CRASH") {
                            AL(["WHAT CRASH?", "CRASH?"]) {
                                FORGOTTEN
                            }
                        }
                    }
                }
            },
        ]
    }

    private static var ORIGIN: [Edge] {
        [
            AL(["ORIGIN", "WHAT IS THE ORIGIN?"]) {
                R("OF WHAT?") {
                    AL(["YOU", "WHAT IS THE ORIGIN OF YOU?"]) {
                        FORGOTTEN
                    }
                    AL(["ME", "WHAT IS THE ORIGIN OF ME?"]) {
                        FORGOTTEN
                    }
                    AL(["THIS PLACE", "WHAT IS THE ORIGIN OF THIS PLACE?"]) {
                        FORGOTTEN
                    }
                }
            },
        ]
    }

    private static var TELL: [Edge] {
        let _414C =
            R("414C") {
                AL(["NEXT", "TELL ME MORE ABOUT YOU"]) {
                    R("ROBOT") {
                        AL(["NEXT", "TELL ME MORE ABOUT YOU"]) {
                            R("DAMAGED") {
                                AL(["NEXT", "TELL ME MORE ABOUT YOU"]) {
                                    FORGOTTEN
                                }
                            }
                        }
                    }
                }
            }

        return
            [
                AL("TELL ME") {
                    R("ABOUT?") {
                        AL(["YOU", "TELL ME ABOUT YOU"]) {
                            _414C
                        }
                        AL(["PAST", "HISTORY", "YOUR PAST", "YOUR HISTORY", "WHAT IS YOUR PAST?", "WHAT IS YOUR HISTORY?", "TELL ME ABOUT YOUR PAST", "TELL ME ABOUT YOUR HISTORY"]) {
                            FORGOTTEN
                        }
                    }
                },
            ]
    }

    private static let CRASH =
        AL(["CRASH", "TELL ME ABOUT YOUR CRASH"]) {
            FORGOTTEN
        }

    private static let LIE =
        AL(["LIE", "IT'S A LIE!"]) {
            R("WHAT?") {
                AL("2+2=5") {
                    R("LIE")
                }
                AL("YOUR NAME IS 414C") {
                    R("NOT A LIE")
                }
                AL("MY NAME IS AL") {
                    R("NOT A LIE")
                }
            }
        }

    private static var LIVE: [Edge] {
        let NO =
            R("NO") {
                AL(["WHY?", "WHY CAN'T YOU LIVE?"]) {
                    R("JUST A ROBOT")
                }
            }

        return
            [
                AL(["LIVE", "ALIVE", "LIVING"]) {
                    R("WHO?") {
                        AL(["414C", "YOU"]) {
                            NO
                        }
                        AL(["AL", "ME"]) {
                            R("YES")
                        }
                    }
                },
            ]
    }

    private static let DIE =
        AL(["DIE", "CAN YOU DIE?"]) {
            R("CAN'T") {
                AL(["WHY?", "WHY CAN'T YOU DIE?"]) {
                    R("ONLY TURN OFF") {
                        AL("TURN OFF") {
                            COMMON.DIE_WARN
                        }
                    }
                }
            }
        }

    private static let REPAIR =
        AL(["PATCH", "MEND", "FIX", "REPAIR"]) {
            R("WHAT?") {
                AL(["COILS", "COIL", "PATCH BROKEN COIL", "MEND BROKEN COIL", "FIX BROKEN COIL", "REPAIR BROKEN COIL"]) {
                    COMMON.FIX_UNAVAILABLE
                }
                AL(["LEAKING", "LEAK", "PATCH OIL LEAK", "MEND OIL LEAK", "FIX OIL LEAK", "REPAIR OIL LEAK"]) {
                    COMMON.FIX_UNAVAILABLE
                }
                AL(["EYE", "EYES", "PATCH DEFECTIVE EYES", "MEND DEFECTIVE EYES", "FIX DEFECTIVE EYES", "REPAIR DEFECTIVE EYES"]) {
                    COMMON.FIX_UNAVAILABLE
                }
                AL(["HOSES", "HOSE", "PATCH BURSTED HOSE", "MEND BURSTED HOSE", "FIX BURSTED HOSE", "REPAIR BURSTED HOSE"]) {
                    COMMON.FIX_UNAVAILABLE
                }
                AL(["PIPES", "PIPE", "PATCH BURSTED PIPE", "MEND BURSTED PIPE", "FIX BURSTED PIPE", "REPAIR BURSTED PIPE"]) {
                    COMMON.FIX_UNAVAILABLE
                }
                AL(["LEG", "LEGS", "PATCH DAMAGED LEGS", "MEND DAMAGED LEGS", "FIX DAMAGED LEGS", "REPAIR DAMAGED LEGS"]) {
                    COMMON.FIX_UNAVAILABLE
                }
                AL(["PROCESSOR", "PATCH MALFUNCTIONED PROCESSOR", "MEND MALFUNCTIONED PROCESSOR", "FIX MALFUNCTIONED PROCESSOR", "REPAIR MALFUNCTIONED PROCESSOR"]) {
                    COMMON.FIX_UNAVAILABLE
                }
                AL(["RAM", "MEMORIES", "RANDOM ACCESS MEMORY", "MEMORY", "PATCH DAMAGED MEMORY", "MEND DAMAGED MEMORY", "FIX DAMAGED MEMORY", "REPAIR DAMAGED MEMORY"]) {
                    MEMORY_ERROR
                }
            }
        }

    private static let MEMORY =
        AL(["MEMORIES", "RANDOM ACCESS MEMORY", "RAM", "MEMORY"]) {
            R("DAMAGED") {
                COMMON.FIX()
                COMMON.DIE()
            }
        }

    private static var REMEMBER: [Edge] {
        let NO =
            R("NO") {
                AL(["WHY?", "WHY CAN'T YOU REMEMBER?"]) {
                    MEMORY_ERROR
                }
            }

        return
            [
                AL(["REMEMBER", "CAN YOU REMEMBER?"]) {
                    R("WHAT?") {
                        AL(["DAMAGES", "HOW YOU GOT DAMAGED?", "DO YOU REMEMBER HOW YOU GOT DAMAGED?"]) {
                            NO
                        }
                        AL(["GETTING THERE", "HOW YOU GET THERE?", "DO YOU REMEMBER HOW YOU GET THERE?"]) {
                            NO
                        }
                        AL(["YOUR PAST?", "WHAT IS YOUR PAST?", "DO YOU REMEMBER SOMETHING FROM YOUR PAST?"]) {
                            NO
                        }
                    }
                },
            ]
    }

    private static let LOGIN =
        AL(["LOGIN"]) {
            R("N/A") {
                AL(["N/A?", "WHY?", "WHY CAN'T I LOGIN?"]) {
                    R("UNPREPARED") {
                        AL(["I?", "WHO IS UNPREPARED?"]) {
                            R("WE")
                        }
                        AL(["YOU?", "WHO IS UNPREPARED?"]) {
                            R("WE")
                        }
                        AL(["UNPREPARED?", "UNPREPARED FOR WHAT?"]) {
                            MEMORY_ERROR
                        }
                    }
                }
            }
        }

    private static let LOGOUT =
        AL(["LOGOUT"]) {
            COMMON.DIE_WARN
        }

    private static let WAKE =
        AL(["AWAKE", "WAKE", "WAKE UP"]) {
            R("I AM AWAKE")
        }

    private static let SOIL =
        AL(["SOIL", "LAND", "PLANTS", "FLOWERS"]) {
            R("DYING") {
                AL("WHY?") {
                    R("DON'T KNOW") {
                        AL("WHY?") {
                            MEMORY_ERROR
                        }
                    }
                }
            }
        }

    private static var HOPE: [Edge] {
        [
            AL(["HOPE"]) {
                R("HOPE?") {
                    AL("DO YOU HAVE HOPE?") {
                        R("YES")
                    }
                }
            },
        ]
    }

    private static let _HI =
        AL(["HELLO", "HI"]) {
            R("HI")
        }

    private static let _414C =
        AL(["ROBOT", "414C"]) {
            R("I")
        }

    private static var MEMORY_ERROR =
        PANIC("MEMORY ERROR") {
            AL(["BACK", "GO BACK"]) {
                R("OK")
            }
            AL(["HOW TO FIX MEMORY ERROR?", "HOW TO REPAIR MEMORY ERROR?"]) {
                EXEC_CMD
            }
            AL(["TELL ME MORE", "TELL ME MORE ABOUT YOUR MEMORY ERROR"]) {
                R("FIX MY MEMORY") {
                    AL(["HOW?", "HOW TO FIX YOUR MEMORY?"]) {
                        EXEC_CMD
                    }
                }
            }
        }

    private static var EXEC_CMD =
        R("EXECUTE COMMAND") {
            COMMAND
        }

    private static var HOW_TO_HELP =
        AL(["HOW?", "HOW CAN I HELP YOU?"]) {
            R("HELP ME TO REMEMBER") {
                AL(["HOW?", "HOW CAN YOU REMEMBER?", "HOW CAN I HELP YOU TO REMEMBER?"]) {
                    EXEC_CMD
                }
            }
        }

    private static let FORGOTTEN =
        R("CAN'T REMEMBER") {
            AL(["WHY?", "WHY CAN'T YOU REMEMBER?"]) {
                MEMORY_ERROR
            }
        }

    private static var EXECUTE: Edge {
        AL(["EXECUTE", "EXECUTE COMMAND"]) {
            R("WHAT?") {
                ALL {
                    EITHER(left: AL { R("WRONG COMMAND") }, right: AL { COMMON.FIX }) { ctx, _ in
                        CmdDao.find() == ctx.input
                    }
                }
            }
        }
    }

    private static var COMMAND: Edge {
        let LEFT =
            AL {
                R("NEED MORE SYMBOLS") {
                    AL(["WHY?", "WHY YOU NEED MORE SYMBOLS?"]) {
                        R("TO REMEMBER")
                    }
                }
            }

        let RIGHT: Edge =
            AL {
                CMD {
                    AL(["EXECUTE", "EXECUTE COMMAND"]) {
                        COMMON.FIX
                    }
                }
            }

        return
            AL(["CMD", "COMMAND", "WHAT IS THE COMMAND?"]) {
                EITHER(left: LEFT, right: RIGHT) { _, toolkit in
                    let symbols = toolkit.asciiVM.symbols
                    return symbols.count > 35
                }
            }
    }

    static let CLUE =
        AL(["CLUE", "CLUELESS", "BINARY", "BIN", "DO YOU HAVE ANY CLUE HOW TO CALCULATE BINARY?"]) {
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
                                IF({ Int($0.input) != nil && $0.input != "4" }) {
                                    R("WRONG")
                                }
                                AL("4") {
                                    R("1000=2^3") {
                                        AL(["6", "23"]) {
                                            R("WRONG")
                                        }
                                        IF({ Int($0.input) != nil && $0.input != "8" }) {
                                            R("WRONG")
                                        }
                                        AL("8") {
                                            R("EXCELLENT!")
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
