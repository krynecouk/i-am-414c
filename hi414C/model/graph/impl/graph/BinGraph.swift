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

            BIN.ASK
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
            BIN.PLOT

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

            COMMON.DIE
            COMMON._DICE
            COMMON._DICES
            COMMON._COIN
            COMMON.GUESS
            COMMON._DANCE
            COMMON.SMILE
            COMMON.SAD
            COMMON.WINK
            COMMON.CRY
            COMMON.EMOTION

            COMMON.CLONE
            COMMON.HELL
            
            COMMON._MATH
            COMMON._MUSIC
            COMMON.VERSION
            COMMON.YEAR
            COMMON.DATE
            COMMON.TIME
            COMMON.SIGN
            COMMON.OPEN
            COMMON.END
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
    
    private static let ASK =
        AL(["ASK", "CAN I ASK YOU SOMETHING?"]) {
            R("OK") {
                WHO
                WHERE
                WHY
                HOW
                WHAT
            }
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
                AL("WHO?") {
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
                    AL(["LIKE?", "FOR EXAMPLE?"]) {
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
                AL("WHERE?") {
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
        let WHY_ARE_YOU_THERE =
            AL(["WHY ARE YOU THERE?"]) {
                R("CRASH") {
                    AL(["CRASH?", "WHAT CRASH?"]) {
                        FORGOTTEN
                    }
                }
            }

        let WHY_ARE_YOU_DAMAGED =
            AL(["WHY ARE YOU BROKEN?", "WHY ARE YOU DAMAGED?"]) {
                FORGOTTEN
            }
        
        let WHY_ARE_YOU_ALONE =
            AL(["WHY ARE YOU ALONE?"]) {
                R("DON'T KNOW") {
                    AL(["DON'T KNOW?", "YOU DON'T KNOW?", "WHY DON'T YOU KNOW?"]) {
                        FORGOTTEN
                    }
                }
            }

        let WHY_AM_I_HERE =
            AL("WHY AM I HERE?") {
                R("TO HELP") {
                    HOW_TO_HELP
                }
            }
        
        let WHY_ARE_WE_TALKING =
            AL(["WHY ARE WE TALKING?"]) {
                R("IT'S HELPING") {
                    AL(["HOW?", "HOW IS TALKING HELPING YOU?"]) {
                        R("TO REMEMBER")
                    }
                }
            }
        
        return
            [
                AL("WHY?") {
                    R("WHAT?") {
                        ["YOU THERE"] + WHY_ARE_YOU_THERE
                        ["BROKEN", "DAMAGED"] + WHY_ARE_YOU_DAMAGED
                        ["ALONE"] + WHY_ARE_YOU_ALONE
                        WHY_AM_I_HERE
                        ["TALKING"] + WHY_ARE_WE_TALKING
                    }
                },
                WHY_ARE_YOU_THERE,
                WHY_ARE_YOU_DAMAGED,
                WHY_ARE_YOU_ALONE,
                WHY_AM_I_HERE,
                WHY_ARE_WE_TALKING,
            ]
    }

    private static var HOW: [Edge] {
        let HOW_TO_GET_OUT =
            AL(["HOW TO GET OUT?"]) {
                FORGOTTEN
            }
        
        let HOW_WILL_THIS_END =
            AL(["HOW WILL THIS END?"]) {
                R("DON'T KNOW")
            }
        
        let HOW_LONG_DO_YOU_LIVE =
            AL(["HOW LONG DO YOU LIVE?"]) {
                FORGOTTEN
            }
        
        return
            [
                AL("HOW?") {
                    R("WHAT?") {
                        ["GET OUT"] + HOW_TO_GET_OUT
                        HOW_TO_HELP
                        ["WILL END"] + HOW_WILL_THIS_END
                        ["LONG YOU LIVE"] + HOW_LONG_DO_YOU_LIVE
                    }
                },
                HOW_TO_GET_OUT,
                HOW_WILL_THIS_END,
                HOW_LONG_DO_YOU_LIVE,
            ]
    }

    private static var WHAT: [Edge] {
        let WHAT_YOU_SEE =
            AL(["WHAT YOU SEE?", "WHAT DO YOU SEE?"]) {
                R("NOTHING") {
                    AL(["WHY?", "WHY CAN'T YOU SEE ANYTHING?", "WHY YOU SEE NOTHING?"]) {
                        R("EYES BROKEN") {
                            COMMON.IRREPAIRABLE
                        }
                    }
                }
            }
        
        let WHAT_YOU_HEAR =
            AL(["WHAT YOU HEAR?", "WHAT DO YOU HEAR?"]) {
                R("NOTHING") {
                    AL(["WHY?", "WHY CAN'T YOU HEAR ANYTHING?", "WHY CAN YOU HEAR NOTHING?"]) {
                        R("EARS BROKEN") {
                            COMMON.IRREPAIRABLE
                        }
                    }
                }
            }
        
        let WHAT_CAN_YOU_HELP =
            AL(["WHAT CAN HELP?", "WHAT CAN YOU HELP?"]) {
                R("FIX") {
                    AL(["WHAT", "FIX WHAT?", "WHAT TO FIX?"]) {
                        MEMORY_ERROR
                    }
                }
            }
        
        let WHAT_IS_DAMAGED =
            AL(["WHAT IS DAMAGED?"]) {
                R("MANY PARTS") {
                    AL(["LIKE?", "FOR EXAMPLE?"]) {
                        RND_WORD(["COIL", "MEMORY", "EYES", "LEGS", "OIL", "HOSE", "PROCESSOR"])
                    }
                }
            }
        
        return [
            AL("WHAT?") {
                R("WHAT?") {
                    ["YOU SEE?"] + WHAT_YOU_SEE
                    ["YOU HEAR?"] + WHAT_YOU_HEAR
                    WHAT_CAN_YOU_HELP
                    ["IS DAMAGED?"] + WHAT_IS_DAMAGED
                }
            },
            WHAT_YOU_SEE,
            WHAT_YOU_HEAR,
            WHAT_CAN_YOU_HELP,
            WHAT_IS_DAMAGED,
        ]
    }
    
    private static var NAME: [Edge] {
        let WHAT_IS_YOUR_NAME =
            AL(["WHAT IS YOUR NAME?"]) {
                R("414C")
            }
        
        let WHAT_IS_MY_NAME =
            AL(["WHAT IS MY NAME?"]) {
                R("AL")
            }
        
        return
            [
                AL("NAME") {
                    R("WHOSE?") {
                        ["YOURS"] + WHAT_IS_YOUR_NAME
                        ["MINE"] + WHAT_IS_MY_NAME
                    }
                },
                WHAT_IS_YOUR_NAME,
                WHAT_IS_MY_NAME
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
        let WHAT_IS_THE_MEANING_OF_ME =
            AL(["WHAT IS THE PURPOSE OF ME?", "WHAT IS THE MEANING OF ME?"]) {
                FORGOTTEN
            }
        
        let WHAT_IS_THE_MEANING_OF_YOU =
            AL(["WHAT IS THE PURPOSE OF YOU?", "WHAT IS THE MEANING OF YOU?"]) {
                FORGOTTEN
            }
        
        let WHAT_IS_THE_MEANING_OF_NAME_414C =
            AL(["WHAT IS THE MEANING OF NAME 414C?"]) {
                FORGOTTEN
            }
        
        let WHAT_IS_THE_MEANING_OF_THIS_PLACE =
            AL(["WHAT IS THE PURPOSE OF THIS PLACE?", "WHAT IS THE MEANING OF THIS PLACE?"]) {
                FORGOTTEN
            }
        
        return
            [
                AL(["PURPOSE", "MEANING", "WHAT IS THE PURPOSE?", "WHAT IS THE MEANING?"]) {
                    R("OF WHAT?") {
                        ["ME"] + WHAT_IS_THE_MEANING_OF_ME
                        ["YOU"] + WHAT_IS_THE_MEANING_OF_YOU
                        ["414C"] + WHAT_IS_THE_MEANING_OF_NAME_414C
                        ["THIS PLACE"] + WHAT_IS_THE_MEANING_OF_THIS_PLACE
                    }
                },
                WHAT_IS_THE_MEANING_OF_ME,
                WHAT_IS_THE_MEANING_OF_YOU,
                WHAT_IS_THE_MEANING_OF_NAME_414C,
                WHAT_IS_THE_MEANING_OF_THIS_PLACE
            ]
    }
    
    private static var CAUSE: [Edge] {
        let WHAT_IS_THE_CAUSE_OF_YOUR_DAMAGES =
            AL(["CAUSE OF YOUR DAMAGES?", "WHAT IS THE CAUSE OF YOUR DAMAGES?"]) {
                R("CRASH") {
                    AL(["WHAT CRASH?", "CRASH?"]) {
                        FORGOTTEN
                    }
                }
            }
        
        return
            [
                AL(["REASON", "CAUSE", "WHAT IS THE REASON?", "WHAT IS THE CAUSE?"]) {
                    R("OF WHAT?") {
                        ["DAMAGES", "YOUR DAMAGES"] + WHAT_IS_THE_CAUSE_OF_YOUR_DAMAGES
                    }
                },
                WHAT_IS_THE_CAUSE_OF_YOUR_DAMAGES
            ]
    }

    private static var ORIGIN: [Edge] {
        let WHAT_IS_THE_ORIGIN_OF_YOU =
            AL(["WHAT IS THE ORIGIN OF YOU?"]) {
                FORGOTTEN
            }
        
        let WHAT_IS_THE_ORIGIN_OF_ME =
            AL(["WHAT IS THE ORIGIN OF ME?"]) {
                FORGOTTEN
            }
        
        let WHAT_IS_THE_ORIGIN_OF_THIS_PLACE =
            AL(["WHAT IS THE ORIGIN OF THIS PLACE?"]) {
                FORGOTTEN
            }
        
        return
            [
                AL(["ORIGIN", "WHAT IS THE ORIGIN?"]) {
                    R("OF WHAT?") {
                        ["YOU"] + WHAT_IS_THE_ORIGIN_OF_YOU
                        ["ME"] + WHAT_IS_THE_ORIGIN_OF_ME
                        ["THIS PLACE"] + WHAT_IS_THE_ORIGIN_OF_THIS_PLACE
                    }
                },
                WHAT_IS_THE_ORIGIN_OF_YOU,
                WHAT_IS_THE_ORIGIN_OF_ME,
                WHAT_IS_THE_ORIGIN_OF_THIS_PLACE
            ]
    }

    private static var TELL: [Edge] {
        let TELL_ME_MORE_ABOUT_YOU =
            AL(["TELL ME ABOUT YOU"]) {
                R("414C") {
                    AL(["NEXT", "MORE", "TELL ME MORE ABOUT YOU"]) {
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
            }

        let TELL_ME_MORE_ABOUT_YOUR_HISTORY =
            AL(["WHAT IS YOUR HISTORY?", "TELL ME ABOUT YOUR PAST", "TELL ME ABOUT YOUR HISTORY"]) {
                FORGOTTEN
            }
        
        return
            [
                AL(["TALK", "TELL", "TELL ME"]) {
                    R("ABOUT?") {
                        ["YOU"] + TELL_ME_MORE_ABOUT_YOU
                        ["PAST", "HISTORY", "YOUR PAST", "YOUR HISTORY"] + TELL_ME_MORE_ABOUT_YOUR_HISTORY
                    }
                },
                TELL_ME_MORE_ABOUT_YOU,
                TELL_ME_MORE_ABOUT_YOUR_HISTORY
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
        [
            AL(["LIVE", "ALIVE", "LIVING"]) {
                R("WHO?") {
                    AL(["414C", "YOU"]) {
                        R("NO") {
                            AL(["WHY?", "WHY CAN'T YOU LIVE?"]) {
                                R("JUST A ROBOT")
                            }
                        }
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
                COMMON.COIL
                COMMON.LEAK
                COMMON.EYES
                COMMON.HOSE
                COMMON.PROCESSOR
                AL(["RAM", "MEMORIES", "RANDOM ACCESS MEMORY", "MEMORY", "PATCH DAMAGED MEMORY", "MEND DAMAGED MEMORY", "FIX DAMAGED MEMORY", "REPAIR DAMAGED MEMORY"]) {
                    MEMORY_ERROR
                }
            }
        }

    private static let MEMORY =
        AL(["MEMORIES", "RANDOM ACCESS MEMORY", "RAM", "MEMORY"]) {
            R("DAMAGED") {
                AL(["HOW TO FIX YOUR MEMORY?", "HOW TO REPAIR YOUR MEMORY?"]) {
                    EXEC_CMD
                }
                COMMON.DIE
            }
        }

    private static var REMEMBER: [Edge] {
        let NO =
            R("NO") {
                AL(["WHY?", "WHY CAN'T YOU REMEMBER?"]) {
                    MEMORY_ERROR
                }
            }
        
        let DO_YOU_REMEMBER_HOW_YOU_GOT_DAMAGED =
            AL(["DO YOU REMEMBER HOW YOU GOT DAMAGED?"]) {
                NO
            }
        
        let DO_YOU_REMEMBER_HOW_YOU_GET_THERE =
            AL(["HOW YOU GET THERE?", "DO YOU REMEMBER HOW YOU GET THERE?"]) {
                NO
            }
        
        let DO_YOU_REMEMBER_SOMETHING_FROM_YOUR_PAST =
            AL(["WHAT IS YOUR PAST?", "DO YOU REMEMBER SOMETHING FROM YOUR PAST?"]) {
                NO
            }
        
        return
            [
                AL(["REMEMBER", "CAN YOU REMEMBER?"]) {
                    R("WHAT?") {
                        ["DAMAGES", "HOW YOU GOT DAMAGED?"] + DO_YOU_REMEMBER_HOW_YOU_GOT_DAMAGED
                        ["GETTING THERE"] + DO_YOU_REMEMBER_HOW_YOU_GET_THERE
                        ["YOUR PAST?"] + DO_YOU_REMEMBER_SOMETHING_FROM_YOUR_PAST
                    }
                },
                DO_YOU_REMEMBER_HOW_YOU_GOT_DAMAGED,
                DO_YOU_REMEMBER_HOW_YOU_GET_THERE,
                DO_YOU_REMEMBER_SOMETHING_FROM_YOUR_PAST
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
        let FIX =
            R("Y/N") {
                AL(["YES", "Y"]) {
                    UPGRADE()
                }
                AL(["NO", "N"]) {
                    R("OK")
                }
            }
        
        return
            AL(["EXECUTE", "EXECUTE COMMAND"]) {
                R("WHAT?") {
                    ALL {
                        EITHER(left: AL { R("WRONG COMMAND") }, right: AL { FIX }) { ctx, _ in
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
                    EXECUTE
                }
            }

        return
            AL(["CMD", "COMMAND", "TELL ME THE COMMAND", "WHAT IS THE COMMAND?"]) {
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
    
    static let PLOT =
        AL(["PLOT", "WHAT IS THE PLOT?"]) {
            R("OF WHAT?") {
                AL(["THIS STORY", "WHAT IS THE PLOT OF THIS STORY?"]) {
                    FORGOTTEN
                }
            }
        }
}
