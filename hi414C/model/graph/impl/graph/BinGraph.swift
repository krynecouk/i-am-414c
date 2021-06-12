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
            BIN.HI
            BIN._414C
            BIN.I
            BIN._AL
            BIN.YOU
            
            BIN.WHO
            BIN.WHERE
            BIN.WHY
            BIN.HOW
            BIN.WHAT
            
            /*
             - NAME done
             - HELP done
             - RESCUE done
             - MEANING done
             - CAUSE done
             - ORIGIN done
             - TELL done
             - CRASH done
             - LIE
             */
            
            BIN.NAME
            BIN.HELP
            // BIN.RESCUE
            BIN.MEANING
            BIN.CAUSE
            BIN.ORIGIN
            BIN.TELL
            BIN.CRASH
            BIN.LIE
            
            /*
             - REPAIR
             - DIE
             - MEMORY
             - LOGIN
             */
            BIN.REPAIR
            BIN.DIE
            BIN.MEMORY
            BIN.LOGIN
            
            BIN.LIVE
            
            BIN.LIE
            
            BIN.SOIL
            BIN.HOPE
            
            BIN.CLUE
            
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
        var NOBODY: Node {
            R("NOBODY") {
                AL("WHY?", ctx: "WHY CAN NOBODY HELP?") {
                    R("ALONE")
                }
            }
        }
        
        return [
            AL("WHO") {
                R("WHO?") {
                    YOU
                    I
                    AL("CAN HELP?", ctx: "WHO CAN HELP?") {
                        NOBODY
                    }
                }
            },
            AL(ctx: "WHO CAN HELP?") {
                NOBODY
            },
        ]
    }
    
    private static var WHERE: [Edge] {
        let NO_HELP =
            R("NO HELP") {
                AL("WHY") {
                    R("ALONE")
                }
            }
        
        return
            [
                AL("WHERE", ctx: "WHERE IS IT?") {
                    R("WHAT?") {
                        AL("HELP", ctx: "WHERE IS HELP?") {
                            NO_HELP
                        }
                        AL("ANYBODY", ctx: "WHERE IS ANYBODY?") {
                            R("ALONE")
                        }
                        AL("WE", ctx: "WHERE ARE WE?") {
                            FORGOT
                        }
                    }
                },
                AL(ctx: "WHERE IS HELP?") {
                    NO_HELP
                },
                AL(ctx: "WHERE IS ANYBODY?") {
                    R("GONE")
                },
                AL(ctx: "WHERE ARE WE?") {
                    FORGOT
                },
            ]
    }
    
    private static var WHY: [Edge] {
        let CRASH =
            R("CRASH") {
                AL(["CRASH?", "WHAT CRASH?"], ctx: "WHAT CRASH?") {
                    FORGOT
                }
            }
        
        let WHY_ARE_YOU_HERE =
            R("WHY ARE YOU HERE?") {
                AL(["I FORGOT", "NOT SURE", "CAN'T REMEMBER", "FORGOT"], ctx: "I HAVE FORGOT") {
                    R("OK")
                }
            }
        
        let DONT_KNOW =
            R("DON'T KNOW") {
                AL("YOU DON'T KNOW?", ctx: "YOU DON'T KNOW?") {
                    FORGOT
                }
            }
        
        return
            [
                AL("WHY") {
                    R("WHAT?") {
                        AL("WHY ARE YOU THERE?", ctx: "WHY ARE YOU THERE?") {
                            CRASH
                        }
                        AL(["BROKEN", "DAMAGED", "WHY ARE YOU BROKEN?"], ctx: "WHY ARE YOU BROKEN?") {
                            FORGOT
                        }
                        AL("WHY AM I HERE?", ctx: "WHY AM I HERE?") {
                            WHY_ARE_YOU_HERE
                        }
                        AL(["ALONE", "WHY ARE YOU ALONE?"], ctx: "WHY ARE YOU ALONE?") {
                            DONT_KNOW
                        }
                        AL(["TALKING", "WHY ARE WE TALKING?"], ctx: "WHY ARE WE TALKING?") {
                            R("WHY NOT?")
                        }
                    }
                },
                AL(ctx: "WHY ARE YOU THERE?") {
                    CRASH
                },
                AL(ctx: "WHY ARE YOU BROKEN?") {
                    FORGOT
                },
                AL(ctx: "WHY AM I HERE?") {
                    WHY_ARE_YOU_HERE
                },
                AL(ctx: "WHY ARE YOU ALONE?") {
                    DONT_KNOW
                },
                AL(ctx: "WHY ARE WE TALKING?") {
                    R("WHY NOT?")
                },
            ]
    }
    
    private static var HOW: [Edge] {
        let FIX =
            R("FIX") {
                AL("WHAT?", ctx: "HOW TO REPAIR?") {
                    R("MEMORY")
                }
            }
        
        return
            [
                AL("HOW") {
                    R("WHAT?") {
                        AL("HOW TO GET OUT?", ctx: "HOW TO GET OUT?") {
                            FORGOT
                        }
                        AL("HOW TO HELP?", ctx: "HOW TO HELP?") {
                            FIX
                        }
                        AL("HOW WILL THIS END?", ctx: "HOW WILL THIS END?") {
                            R("DON'T KNOW")
                        }
                        AL("HOW LONG YOU LIVE?", ctx: "HOW LONG YOU LIVE?") {
                            FORGOT
                        }
                    }
                },
                AL(ctx: "HOW TO GET OUT?") {
                    FORGOT
                },
                AL(ctx: "HOW TO HELP?") {
                    FIX
                },
                AL(ctx: "HOW WILL THIS END?") {
                    R("DON'T KNOW")
                },
                AL(ctx: "HOW LONG YOU LIVE?") {
                    FORGOT
                },
            ]
    }
    
    private static var WHAT: [Edge] {
        let NOTHING_EYES =
            R("NOTHING") {
                AL("WHY?", ctx: "WHY YOU DON'T SEE NOTHING?") {
                    R("EYES BROKEN") {
                        COMMON.FIX(repairable: false, variants: ["REPLACE"])
                    }
                }
            }
        
        let NOTHING_EARS =
            R("NOTHING") {
                AL("WHY?", ctx: "WHY") {
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
            AL(ctx: "WHAT CAN YOU HELP?") {
                FIX
            },
            AL(ctx: "WHAT IS DAMAGED?") {
                FIX_MEMORY
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
        let YES_YOU_CAN_HELP_ME =
            R("YES") {
                AL("HOW?", ctx: "HOW CAN I HELP YOU?") {
                    R("HELP ME REMEMBER") {
                        AL("HOW?", ctx: "HOW CAN I HELP YOU REMEMBER?") {
                            R("FIX MEMORY") {
                                COMMON.FIX(repairable: true, variants: ["REFRESH"])
                            }
                        }
                    }
                }
            }
        
        return
            [
                AL("HELP", ctx: "CAN YOU HELP?") {
                    R("WHO?") {
                        AL("YOU", ctx: "CAN I HELP YOU?") {
                            YES_YOU_CAN_HELP_ME
                        }
                        AL("ME", ctx: "CAN YOU HELP ME?") {
                            R("WITH WHAT?") {
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
                    YES_YOU_CAN_HELP_ME
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
                        "WHAT IS THE MEANING OF YOU?",
                        "WHAT IS THE MEANING OF ME?",
                    ]) {
                        FORGOT
                    }
                }
            },
            AL(ctx: [
                "WHAT IS THE MEANING OF YOU?",
                "WHAT IS THE MEANING OF ME?",
            ]) {
                FORGOT
            },
        ]
    }
    
    // TODO dodelat z rootu
    private static let CAUSE =
        AL(["CAUSE", "REASON"], ctx: "WHAT IS THE CAUSE OR REASON?") {
            R("OF WHAT?") {
                AL("CAUSE OF YOUR DAMAGES?", ctx: "WHAT IS THE CAUSE OF YOUR DAMAGES?") {
                    R("CRASH") {
                        AL(["WHAT CRASH?", "CRASH?"]) {
                            FORGOT
                        }
                    }
                }
            }
        }
    
    private static let ORIGIN =
        AL("ORIGIN", ctx: ["WHAT IS THE ORIGIN?"]) {
            R("OF?") {
                AL(["YOU", "ME"], ctx: "WHAT IS THE ORIGIN OF YOU OR ME?") {
                    FORGOT
                }
            }
        }
    
    private static let TELL =
        AL("TELL ME", ctx: "COULD YOU TELL ME SOMETHING?") {
            R("ABOUT?") {
                AL("YOU") {
                    R("414C") {
                        AL("NEXT") {
                            R("ROBOT") {
                                AL("NEXT") {
                                    R("DAMAGED") {
                                        AL("NEXT") {
                                            FORGOT
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                AL(["YOUR HISTORY", "YOUR PAST", "HISTORY", "PAST"]) {
                    FORGOT
                }
            }
        }
    
    private static let LIE =
        AL("LIE") {
            R("WHAT?") {
                AL(["THIS PLACE", "YOU", "I", "EVERYTHING"]) {
                    PANIC("MEMORY")
                }
            }
        }
    
    private static let CRASH =
        AL("CRASH", hidden: ["CAR CRASH"], ctx: "TELL ME ABOUT YOUR CAR CRASH") {
            PANIC("MEMORY")
        }
    
    private static let MEMORY =
        AL(["MEMORY", "RAM", "MEMORIES"]) {
            R("DAMAGED") {
                COMMON.FIX()
                COMMON.DIE()
            }
        }
    
    private static let DIE =
        AL("DIE") {
            R("WHO?") {
                AL(["I", "AL"]) {
                    R("CAN'T") {
                        AL(COMMON.WHY) {
                            PANIC("ERROR")
                        }
                    }
                }
                AL(["YOU", "414C"]) {
                    R("CAN'T") {
                        AL(COMMON.WHY) {
                            R("NONLIVING")
                        }
                    }
                }
            }
        }
    
    
    private static let LIVE =
        AL(["LIVE"]) {
            R("WHO?") {
                AL(["YOU", "414C"]) {
                    R("CAN'T") {
                        AL(COMMON.WHY) {
                            R("NONLIVING")
                        }
                    }
                }
            }
        }
    
    private static let LOGIN =
        AL(["LOGIN", "LOGOUT", "AWAKE", "WAKE UP", "WAKE"]) {
            R("N/A") {
                AL(["N/A?", "WHY?"]) {
                    R("UNPREPARED") {
                        AL(["YOU?", "I?"]) {
                            R("WE")
                        }
                        AL(["UNPREPARED?", "UNPREPARED FOR WHAT?", "UNPREPARED"]) {
                            PANIC("MEMORY")
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
    
    private static let SOIL =
        AL(["SOIL", "LAND"]) {
            R("DRY")
        }
    
    private static let HOPE =
        AL(["HOPE"]) {
            R("PROCESSING")
        }
    
    private static let HI =
        AL(["HI", "HELLO"]) {
            R("HI")
        }
    
    private static let _414C =
        AL(["414C", "ROBOT"]) {
            R("I")
        }
    

    
    private static let FORGOT =
        R("CAN'T REMEMBER") {
            AL(["WHY?", "WHY DID YOU FORGET?", "HOW DID YOU FORGET?", "HOW COULD YOU FORGET?", "FORGOTTEN?", "FORGOTTEN?!", "HOW?", "HOW", "WHY"]) {
                PANIC("MEMORY ERROR") {
                    COMMON.FIX()
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
