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
        AL("I", hidden: ["ME"], ctx: "WHO AM I?") {
            R("AL")
        }
    
    private static let _AL =
        AL("AL", ctx: "WHO IS AL?") {
            R("YOU")
        }
    
    private static let YOU =
        AL("YOU", ctx: "WHO ARE YOU?") {
            R("I AM 414C")
        }
    
    private static var WHO: [Edge] {
        [
            AL("WHO") {
                R("WHO?") {
                    AL("WHO AM I?", hidden: ["ME"], ctx: "WHO AM I?") {
                        R("AL")
                    }
                    AL("WHO ARE YOU?", hidden: ["YOU"], ctx: "WHO ARE YOU?") {
                        R("414C")
                    }
                    AL("WHO CAN HELP?", ctx: "WHO CAN HELP YOU?") {
                        R("YOU") {
                            HOW_TO_HELP
                        }
                    }
                }
            },
            AL(ctx: "WHO CAN HELP YOU?") {
                R("YOU") {
                    HOW_TO_HELP
                }
            },
        ]
    }
    
    private static var WHERE: [Edge] {
        let MANY_PLACES =
            R("MANY PLACES") {
                AL("FOR EXAMPLE?") {
                    RND_WORD(["COIL", "MEMORY", "EYES", "LEGS", "OIL", "HOSE", "PROCESSOR"])
                }
            }
        
        let NOT_HERE =
            R("NOT HERE") {
                AL("WHY?", ctx: "WHY THERE ARE NO PEOPLE?") {
                    R("VOID")
                }
            }
        
        return
            [
                AL("WHERE", ctx: "WHERE IS IT?") {
                    R("WHAT?") {
                        AL(["WHERE IS HELP?"], hidden: ["HELP"], ctx: "WHERE IS HELP?") {
                            R("YOU ARE HELP") {
                                HOW_TO_HELP
                            }
                        }
                        AL("WHERE IS ANYBODY?", hidden: ["ANYBODY", "SOMBODY"], ctx: "WHERE IS ANYBODY?") {
                            R("ALONE")
                        }
                        AL(["ME", "YOU", "WE"], ctx: "WHERE ARE ME YOU WE?") {
                            R("VOID")
                        }
                        AL("WHERE ARE YOU DAMAGED?", hidden: ["DAMAGE"], ctx: "WHERE IS THE DAMAGE?") {
                            MANY_PLACES
                        }
                        AL("WHERE ARE PEOPLE?", hidden: ["PEOPLE"], ctx: "WHERE ARE PEOPLE?") {
                            NOT_HERE
                        }
                    }
                },
                AL(ctx: "WHERE IS HELP?") {
                    R("YOU ARE HELP") {
                        HOW_TO_HELP
                    }
                },
                AL(ctx: "WHERE IS ANYBODY?") {
                    R("ALONE")
                },
                AL(ctx: "WHERE ARE ME YOU WE?") {
                    R("VOID")
                },
                AL(ctx: "WHERE IS THE DAMAGE?") {
                    MANY_PLACES
                },
                AL(ctx: "WHERE ARE PEOPLE?") {
                    NOT_HERE
                }
            ]
    }
    
    private static var WHY: [Edge] {
        let CRASH =
            R("CRASH") {
                AL(["CRASH?", "WHAT CRASH?"], ctx: "WHAT CRASH?") {
                    FORGOTTEN
                }
            }
        
        let DONT_KNOW =
            R("DON'T KNOW") {
                AL("YOU DON'T KNOW?", ctx: "WHY DON'T YOU KNOW?") {
                    FORGOTTEN
                }
            }
        
        let ITS_HELPING =
            R("IT'S HELPING") {
                AL("HOW?", ctx: "HOW IS TALKING HELPING YOU?") {
                    R("TO REMEMBER")
                }
            }
        
        return
            [
                AL("WHY") {
                    R("WHAT?") {
                        AL("WHY ARE YOU THERE?", ctx: "WHY ARE YOU THERE?") {
                            CRASH
                        }
                        AL(["WHY ARE YOU BROKEN?", "WHY ARE YOU DAMAGED?"], ctx: "WHY ARE YOU BROKEN OR DAMAGED?") {
                            FORGOTTEN
                        }
                        AL("WHY AM I HERE?", ctx: "WHY AM I HERE?") {
                            R("TO HELP") {
                                HOW_TO_HELP
                            }
                        }
                        AL(["ALONE", "WHY ARE YOU ALONE?"], ctx: "WHY ARE YOU ALONE?") {
                            DONT_KNOW
                        }
                        AL(["TALKING", "WHY ARE WE TALKING?"], ctx: "WHY ARE WE TALKING?") {
                            ITS_HELPING
                        }
                    }
                },
                AL(ctx: ["WHY ARE YOU HERE?", "WHY ARE YOU THERE?"]) {
                    CRASH
                },
                AL(ctx: "WHY ARE YOU BROKEN OR DAMAGED?") {
                    FORGOTTEN
                },
                AL(ctx: "WHY AM I HERE?") {
                    R("TO HELP") {
                        HOW_TO_HELP
                    }
                },
                AL(ctx: "WHY ARE YOU ALONE?") {
                    DONT_KNOW
                },
                AL(ctx: "WHY ARE WE TALKING?") {
                    ITS_HELPING
                }
            ]
    }
    
    private static var HOW: [Edge] {
        [
            AL("HOW") {
                R("WHAT?") {
                    AL("HOW TO GET OUT?", ctx: "HOW TO GET OUT?") {
                        FORGOTTEN
                    }
                    HOW_TO_HELP
                    AL("HOW WILL THIS END?", ctx: "HOW WILL THIS END?") {
                        R("DON'T KNOW")
                    }
                    AL("HOW LONG YOU LIVE?", ctx: "HOW LONG DO YOU LIVE?") {
                        FORGOTTEN
                    }
                }
            },
            AL(ctx: "HOW TO GET OUT?") {
                FORGOTTEN
            },
            AL(ctx: "HOW WILL THIS END?") {
                R("DON'T KNOW")
            },
            AL(ctx: "HOW LONG DO YOU LIVE?") {
                FORGOTTEN
            },
        ]
    }
    
    private static var WHAT: [Edge] {
        let NOTHING_EYES =
            R("NOTHING") {
                AL("WHY?", ctx: ["WHY CAN'T YOU SEE ANYTHING NOTHING?"]) {
                    R("EYES BROKEN") {
                        COMMON.FIX(repairable: false, variants: ["REPLACE"])
                    }
                }
            }
        
        let NOTHING_EARS =
            R("NOTHING") {
                AL("WHY?", ctx: "WHY CAN'T YOU HEAR ANYTHING NOTHING?") {
                    R("EARS BROKEN") {
                        COMMON.FIX(repairable: false, variants: ["REPLACE"])
                    }
                }
            }
        
        let FIX =
            R("FIX") {
                AL("WHAT", ctx: "WHAT?") {
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
                    AL("WHAT YOU SEE?", ctx: "WHAT DO YOU SEE?") {
                        NOTHING_EYES
                    }
                    AL("WHAT YOU HEAR?", ctx: "WHAT DO YOU HEAR?") {
                        NOTHING_EARS
                    }
                    // TODO help
                    AL("WHAT CAN HELP?", ctx: "WHAT CAN YOU HELP?") {
                        FIX
                    }
                    AL("WHAT IS DAMAGED?", ctx: "WHAT IS DAMAGED?") {
                        FIX_MEMORY
                    }
                }
            },
            AL(ctx: "WHAT DO YOU SEE?") {
                NOTHING_EYES
            },
            AL(ctx: "WHAT DO YOU HEAR?") {
                NOTHING_EARS
            },
            // TODO
            AL(ctx: "WHAT CAN HELP YOU?") {
                FIX
            },
            AL(ctx: "WHAT IS DAMAGED?") {
                MEMORY_ERROR
            },
            // TODO: TIME - current time?
        ]
    }
    
    private static var NAME: [Edge] {
        [
            AL("NAME") {
                R("WHOSE?") {
                    AL(["YOURS"], ctx: "WHAT IS YOUR NAME?") {
                        R("414C")
                    }
                    AL("MINE", ctx: "WHAT IS MY NAME?") {
                        R("AL")
                    }
                }
            },
            AL(ctx: "WHAT IS YOUR NAME?") {
                R("414C")
            },
            AL(ctx: "WHAT IS MY NAME?") {
                R("AL")
            },
        ]
    }
    
    private static var HELP: [Edge] {
        [
            AL("HELP", ctx: "CAN YOU HELP?") {
                R("WHOM?") {
                    AL("YOU", ctx: "CAN I HELP YOU?") {
                        R("YES") {
                            HOW_TO_HELP
                        }
                    }
                    AL("ME", ctx: "CAN YOU HELP ME?") {
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
            AL(ctx: "CAN I HELP YOU?") {
                R("YES") {
                    HOW_TO_HELP
                }
            },
            AL(ctx: "CAN YOU HELP ME?") {
                R("WITH WHAT?") {
                    COMMON.LEARN
                    COMMON.SETTINGS
                    COMMON.DIFFICULTY
                    COMMON.THEME
                    COMMON.CHANGE
                }
            },
        ]
    }
    
    private static var MEANING: [Edge] {
        [
            AL(["MEANING", "PURPOSE"], ctx: "WHAT IS THE MEANING?") {
                R("OF WHAT?") {
                    AL(["ME", "YOU", "414C", "THIS PLACE"], ctx: [
                        "WHAT IS THE MEANING OR PURPOSE OF YOU?",
                        "WHAT IS THE MEANING OR PURPOSE OF ME?",
                    ]) {
                        FORGOTTEN
                    }
                }
            },
            AL(ctx: [
                "WHAT IS THE MEANING OR PURPOSE OF YOU?",
                "WHAT IS THE MEANING OR PURPOSE OF ME?",
            ]) {
                FORGOTTEN
            },
        ]
    }
    
    private static var CAUSE: [Edge] {
        [
            AL(["CAUSE", "REASON"], ctx: "WHAT IS THE CAUSE OR REASON?") {
                R("OF WHAT?") {
                    AL("CAUSE OF YOUR DAMAGES?", ctx: "WHAT IS THE CAUSE OF YOUR DAMAGES?") {
                        R("CRASH") {
                            AL(["WHAT CRASH?", "CRASH?"]) {
                                FORGOTTEN
                            }
                        }
                    }
                }
            },
            AL(ctx: "WHAT IS THE CAUSE OF YOUR DAMAGES?") {
                R("CRASH") {
                    AL(["WHAT CRASH?", "CRASH?"]) {
                        FORGOTTEN
                    }
                }
            },
        ]
    }
    
    private static var ORIGIN: [Edge] {
        [
            AL("ORIGIN", ctx: ["WHAT IS THE ORIGIN?"]) {
                R("OF WHAT?") {
                    AL(["YOU", "ME", "THIS PLACE"], ctx: "WHAT IS THE ORIGIN OF YOU OR ME OR THIS PLACE?") {
                        FORGOTTEN
                    }
                }
            },
            AL(ctx: "WHAT IS THE ORIGIN OF YOU OR ME OR THIS PLACE?") {
                FORGOTTEN
            },
        ]
    }
    
    private static var TELL: [Edge] {
        let _414C =
            R("414C") {
                AL("NEXT") {
                    R("ROBOT") {
                        AL("NEXT") {
                            R("DAMAGED") {
                                AL("NEXT") {
                                    FORGOTTEN
                                }
                            }
                        }
                    }
                }
            }
        
        return
            [
                AL("TELL ME", ctx: "COULD YOU TELL ME SOMETHING?") {
                    R("ABOUT?") {
                        AL("YOU", ctx: "TELL ME ABOUT YOU") {
                            _414C
                        }
                        AL(["YOUR HISTORY", "YOUR PAST", "HISTORY", "PAST"], ctx: "TELL ME ABOUT YOUR HISTORY OR PAST") {
                            FORGOTTEN
                        }
                    }
                },
                AL(ctx: "TELL ME ABOUT YOU") {
                    _414C
                },
                AL(["YOUR HISTORY", "YOUR PAST", "HISTORY", "PAST"], ctx: "TELL ME ABOUT YOUR HISTORY OR PAST") {
                    FORGOTTEN
                },
            ]
    }
    
    private static let CRASH =
        AL("CRASH", hidden: ["CAR CRASH"], ctx: "TELL ME ABOUT YOUR CAR CRASH") {
            FORGOTTEN
        }
    
    private static let LIE =
        AL("LIE", ctx: "IT'S A LIE!") {
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
                AL(ctx: ["YOU ARE AL", "WE ARE ONE", "WE ARE THE SAME", "WE ARE INSIDE MY HEAD", "THIS IS JUST A DREAM"]) {
                    R("NOT A LIE")
                }
            }
        }
    
    private static var LIVE: [Edge] {
        let NO =
            R("NO") {
                AL("WHY?", ctx: "WHY CAN'T YOU LIVE?") {
                    R("JUST A ROBOT")
                }
            }
        
        return
            [
                AL("LIVE", hidden: ["ALIVE", "LIVING"]) {
                    R("WHO?") {
                        AL(["YOU", "414C"]) {
                            NO
                        }
                        AL("ME") {
                            R("YES")
                        }
                    }
                },
                AL(ctx: "ARE YOU ALIVE?") {
                    NO
                },
                AL(ctx: "AM I ALIVE?") {
                    R("YES")
                },
            ]
    }
    
    private static let DIE =
        AL("DIE", ctx: "CAN YOU DIE?") {
            R("CAN'T") {
                AL("WHY?", ctx: "WHY CAN'T YOU DIE?") {
                    R("ONLY TURN OFF") {
                        AL("TURN OFF") {
                            COMMON.DIE_WARN
                        }
                    }
                }
            }
        }
    
    private static let REPAIR =
        AL(["FIX", "REPAIR", "PATCH", "MEND"]) {
            R("WHAT?") {
                AL(["COIL", "LEAK", "EYES", "HOSE", "LEGS", "PIPE", "HISS", "COILS", "LEAKING", "EYE", "HOSES", "PIPES", "PROCESSOR", "PROCESSOR UNIT"]) {
                    COMMON.FIX_UNAVAILABLE
                }
                AL(["MEMORY", "RAM", "MEMORIES"]) {
                    COMMON.FIX
                }
            }
        }
    
    private static let MEMORY =
        AL(["MEMORY", "RAM", "MEMORIES", "RANDOM ACCESS MEMORY"]) {
            R("DAMAGED") {
                COMMON.FIX()
                COMMON.DIE()
            }
        }
    
    private static var REMEMBER: [Edge] {
        let NO =
            R("NO") {
                AL("WHY?", ctx: "WHY CAN'T YOU REMEMBER?") {
                    MEMORY_ERROR
                }
            }
        
        return
            [
                AL("REMEMBER", ctx: "CAN YOU REMEMBER?") {
                    R("WHAT?") {
                        AL(["HOW YOU GOT DAMAGED?", "HOW YOU GET THERE?", "YOUR PAST?"]) {
                            NO
                        }
                    }
                },
                AL(ctx: ["CAN YOU REMEMBER HOW YOU GOT DAMAGED?", "CAN YOU REMEMBER HOW YOU DID GET THERE?", "CAN YOU REMEMBER YOUR PAST?"]) {
                    NO
                },
            ]
    }
    
    private static let LOGIN =
        AL(["LOGIN", "LOGOUT", "AWAKE", "WAKE UP", "WAKE"]) {
            R("N/A") {
                AL(["N/A?", "WHY?"], ctx: "WHY CAN'T I LOGIN OR LOGOUT?") {
                    R("UNPREPARED") {
                        AL(["YOU?", "I?"], ctx: "WHO IS UNPREPARED?") {
                            R("WE")
                        }
                        AL(["UNPREPARED?", "UNPREPARED FOR WHAT?"], ctx: "WHY ARE YOU UMPREPARED") {
                            MEMORY_ERROR
                        }
                    }
                }
            }
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
                    AL("DO YOU HAVE HOPE?", ctx: "DO YOU HAVE HOPE?") {
                        R("YES")
                    }
                }
            },
            AL(ctx: "DO YOU HAVE HOPE?") {
                R("YES")
            }
        ]
    }
    
    private static let _HI =
        AL(["HI", "HELLO"]) {
            R("HI")
        }
    
    private static let _414C =
        AL(["414C", "ROBOT"]) {
            R("I")
        }
    
    private static var MEMORY_ERROR =
        PANIC("MEMORY ERROR") {
            AL(["BACK"], hidden: ["GO BACK"]) {
                R("OK")
            }
            AL(["HOW TO FIX MEMORY ERROR?", "HOW TO REPAIR MEMORY ERROR?"], ctx: "HOW TO FIX OR REPAIR YOUR MEMORY?") {
                EXEC_CMD
            }
            AL(["TELL ME MORE"], ctx: "TELL ME MORE ABOUT YOUR MEMORY ERROR") {
                R("FIX MY MEMORY") {
                    AL("HOW?", ctx: "HOW TO FIX YOUR MEMORY?") {
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
        AL(["HOW?", "HOW CAN I HELP YOU?"], ctx: "HOW CAN I HELP YOU?") {
            R("HELP ME TO REMEMBER") {
                AL(["HOW?", "HOW CAN YOU REMEMBER?"], ctx: "HOW CAN I HELP YOU TO REMEMBER?") {
                    EXEC_CMD
                }
            }
        }
    
    private static let FORGOTTEN =
        R("CAN'T REMEMBER") {
            AL(["WHY?", "WHY CAN'T YOU REMEMBER?"], ctx: "WHY CAN'T YOU REMEMBER?") {
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
                    AL("WHY?", ctx: "WHY YOU NEED MORE SYMBOLS?") {
                        R("TO REMEMBER")
                    }
                }
            }
        
        let RIGHT: Edge =
            AL {
                CMD {
                    AL("EXECUTE", ctx: "EXECUTE COMMAND") {
                        COMMON.FIX
                    }
                }
            }
        
        return
            AL(["WHAT IS THE COMMAND?", "COMMAND", "CMD"], ctx: "WHAT IS THE COMMAND?") {
                EITHER(left: LEFT, right: RIGHT) { ctx, toolkit in
                    let symbols = toolkit.asciiVM.symbols
                    return symbols.count > 35
                }
            }
    }
    
    
    static let CLUE =
        AL(["CLUE", "CLUELESS", "BINARY", "BIN"], ctx: "DO YOU HAVE ANY CLUE HOW TO DO BINARY?") {
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
