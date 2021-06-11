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
             - CAUSE
             - ORIGIN
             - TELL
             - CRASH
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
        AL(["I"], silent: ["I?", "ME?", "ME", "WHO AM I", "WHO AM I?"]) {
            R("AL")
        }
    
    /*
    private static let _AL =
        AL("AL", silent: ["AL?", "WHO IS AL", "WHO IS AL?"]) {
            R("YOU")
        }
    */
    
    private static let _AL =
        AL(["AL"]) {
            R("YOU")
        }
 
    private static let YOU =
        AL("YOU", silent: ["YOU?", "WHO ARE YOU", "WHO ARE YOU?"]) {
            R("I AM 414C")
        }
    
    private static var WHO: [Edge] {
        [
            AL(["WHO"]) {
                R("WHO?") {
                    AL("YOU", silent: ["ARE YOU", "ARE YOU?", "WHO ARE YOU", "WHO ARE YOU?"]) {
                        R("414C")
                    }
                    AL("I", silent: ["AM I", "AM I?", "WHO AM I", "WHO AM I?"]) {
                        R("AL")
                    }
                    AL("CAN HELP?", silent: ["CAN HELP"]) {
                        R("NOBODY") {
                            AL("WHY?", silent: ["WHY"]) {
                                R("ALONE")
                            }
                        }
                    }
                }
            },
            AL(silent: ["WHO ARE YOU", "WHO ARE YOU?"]) {
                R("414C")
            },
            AL(silent: ["WHO AM I", "WHO AM I?"]) {
                R("AL")
            },
        ]
    }
    
    private static var WHERE: [Edge] {
        [
            AL(["WHERE"], silent: ["WHERE?", "WHERE IS", "WHERE IS?"]) {
                R("WHAT?") {
                    AL("HELP") {
                        R("NO HELP") {
                            AL("WHY", silent: ["WHY?"]) {
                                R("ALONE")
                            }
                        }
                    }
                    AL("ANYBODY") {
                        R("ALONE")
                    }
                    AL(["WE"], silent: ["ARE WE", "ARE WE?"]) {
                        FORGOT
                    }
                }
            },
            AL(silent: ["WHERE IS HELP", "WHERE IS HELP?"]) {
                R("NO HELP")
            },
            AL(silent: ["WHERE IS ANYBODY", "WHERE IS ANYBODY?"]) {
                R("GONE")
            },
            AL(silent: ["WHERE ARE WE", "WHERE ARE WE?"]) {
                FORGOT
            },
        ]
    }
    
    private static var WHY: [Edge] {
        [
            AL(["WHY"], silent: ["WHY?"]) {
                R("WHAT?") {
                    AL(["WHY ARE YOU THERE?"], silent: ["WHY ARE YOU THERE", "WHY ARE YOU THERE?", "WHY YOU ARE HERE?", "WHY YOU ARE HERE", "WHY WE ARE HERE?"]) {
                        FORGOT
                    }
                    AL(["BROKEN", "DAMAGED", "WHY ARE YOU BROKEN?"], silent: ["WHY ARE YOU BROKEN", "WHY ARE YOU BROKEN?"]) {
                        R("CRASH") {
                            AL(["CRASH?", "WHAT CRASH?"], silent: ["WHAT CRASH", "WHAT CRASH?"]) {
                                FORGOT
                            }
                        }
                    }
                    AL("WHY AM I HERE?", silent: ["WHY AM I HERE"]) {
                        R("WHY ARE YOU HERE?") {
                            AL(["I FORGOT", "NOT SURE", "CAN'T REMEMBER", "FORGOT"]) {
                                R("OK")
                            }
                        }
                    }
                    AL(["ALONE", "WHY ARE YOU ALONE?"], silent: ["WHY ARE YOU ALONE", "WHY ARE YOU ALONE?"]) {
                        R("DON'T KNOW") {
                            AL("YOU DON'T KNOW?") {
                                FORGOT
                            }
                        }
                    }
                    AL(["TALKING", "WHY ARE WE TALKING?"], silent: ["WHY ARE WE TALKING", "WHY ARE WE TALKING?", "WHY YOU ARE TALKING", "WHY YOU ARE TALKING TO ME?"]) {
                        R("WHY NOT?")
                    }
                }
            },
            AL(silent: ["WHY ARE YOU THERE", "WHY ARE YOU THERE?", "WHY YOU ARE HERE?", "WHY YOU ARE HERE", "WHY WE ARE HERE?"]) {
                FORGOT
            },
            AL(silent: ["WHY ARE YOU BROKEN", "WHY ARE YOU BROKEN?"]) {
                R("CRASH") {
                    AL(["CRASH?", "WHAT CRASH?"], silent: ["WHAT CRASH", "WHAT CRASH?"]) {
                        FORGOT
                    }
                }
            },
            AL(silent: ["WHY AM I HERE", "WHY AM I HERE?"]) {
                R("WHY ARE YOU HERE?") {
                    AL(["I FORGOT", "NOT SURE", "CAN'T REMEMBER", "FORGOT"]) {
                        R("OK")
                    }
                }
            },
            AL(silent: ["WHY ARE YOU ALONE", "WHY ARE YOU ALONE?"]) {
                R("DON'T KNOW") {
                    AL("YOU DON'T KNOW?") {
                        FORGOT
                    }
                }
            },
            AL(silent: ["WHY ARE WE TALKING", "WHY ARE WE TALKING?", "WHY YOU ARE TALKING", "WHY YOU ARE TALKING TO ME?"]) {
                R("WHY NOT?")
            },
        ]
    }
    
    private static var HOW: [Edge] {
        [
            AL(["HOW"], silent: ["HOW?"]) {
                R("WHAT?") {
                    AL("GET OUT", silent: ["HOW CAN WE GET OUT", "HOW CAN WE GET OUT?"]) {
                        FORGOT
                    }
                    AL("HELP", silent: ["HOW CAN I HELP", "HOW CAN I HELP?"]) {
                        R("FIX") {
                            AL("WHAT", silent: ["WHAT?"]) {
                                R("MEMORY")
                            }
                        }
                    }
                    AL("WILL THIS END?", silent: ["HOW THIS END", "HOW THIS END?", "WILL THIS END"]) {
                        R("DON'T KNOW")
                    }
                    AL("LONG YOU LIVE?", silent: ["HOW LONG DO YOU LIVE", "HOW LONG DO YOU LIVE?"]) {
                        FORGOT
                    }
                }
            },
            AL(silent: ["HOW CAN WE GET OUT", "HOW CAN WE GET OUT?"]) {
                FORGOT
            },
            AL(silent: ["HOW CAN I HELP", "HOW CAN I HELP?"]) {
                R("FIX") {
                    AL("WHAT", silent: ["WHAT?"]) {
                        R("MEMORY") {
                            COMMON.FIX(repairable: true, variants: ["REFRESH"])
                        }
                    }
                }
            },
            AL(silent: ["HOW THIS END", "HOW THIS END?"]) {
                R("DON'T KNOW")
            },
            AL(silent: ["HOW LONG DO YOU LIVE", "HOW LONG DO YOU LIVE?"]) {
                FORGOT
            },
        ]
    }
    
    private static var WHAT: [Edge] {
        [
            AL(["WHAT"]) {
                R("WHAT?") {
                    AL(["YOU SEE?"], silent: ["WHAT DO YOU SEE", "WHAT DO YOU SEE?", "WHAT CAN YOU SEE?", "WHAT CAN YOU SEE"]) {
                        R("NOTHING") {
                            AL("WHY?", silent: ["WHY"]) {
                                R("EYES BROKEN") {
                                    COMMON.FIX(repairable: false, variants: ["REPLACE"])
                                }
                            }
                        }
                    }
                    AL(["YOU HEAR?"], silent: ["WHAT DO YOU HEAR", "WHAT DO YOU HEAR?", "WHAT CAN YOU HEAR?", "WHAT CAN YOU HEAR"]) {
                        R("NOTHING") {
                            AL("WHY?", silent: ["WHY"]) {
                                R("EARS BROKEN") {
                                    COMMON.FIX(repairable: false, variants: ["REPLACE"])
                                }
                            }
                        }
                    }
                    AL("CAN HELP?", silent: ["WHAT CAN HELP", "WHAT CAN HELP?", "WHAT DO YOU WANT", "WHAT DO YOU WANT?"]) {
                        R("FIX") {
                            AL("WHAT", silent: ["WHAT?"]) {
                                R("MEMORY") {
                                    COMMON.FIX(repairable: true, variants: ["REFRESH"])
                                }
                            }
                        }
                    }
                    AL("IS DAMAGED?", silent: ["WHAT IS DAMAGED?", "WHAT IS DAMAGED"]) {
                        R("MEMORY") {
                            COMMON.FIX(repairable: true, variants: ["REFRESH"])
                        }
                    }
                }
            },
            AL(silent: ["WHAT DO YOU SEE", "WHAT DO YOU SEE?", "WHAT CAN YOU SEE?", "WHAT CAN YOU SEE"]) {
                R("NOTHING") {
                    AL("WHY?", silent: ["WHY"]) {
                        R("EYES BROKEN") {
                            COMMON.FIX(repairable: false, variants: ["REPLACE"])
                        }
                    }
                }
            },
            AL(silent: ["WHAT DO YOU HEAR", "WHAT DO YOU HEAR?", "WHAT CAN YOU HEAR?", "WHAT CAN YOU HEAR"]) {
                R("NOTHING") {
                    AL("WHY?", silent: ["WHY"]) {
                        R("EARS BROKEN") {
                            COMMON.FIX(repairable: false, variants: ["REPLACE"])
                        }
                    }
                }
            },
            AL(silent: ["WHAT CAN HELP", "WHAT CAN HELP?", "WHAT DO YOU WANT", "WHAT DO YOU WANT?"]) {
                R("FIX") {
                    AL("WHAT", silent: ["WHAT?"]) {
                        R("MEMORY") {
                            COMMON.FIX(repairable: true, variants: ["REFRESH"])
                        }
                    }
                }
            },
            AL(silent: ["WHAT IS DAMAGED?", "WHAT IS DAMAGED"]) {
                R("MEMORY") {
                    COMMON.FIX(repairable: true, variants: ["REFRESH"])
                }
            },
            // TODO: TIME - current time?
        ]
    }
    
    private static var NAME: [Edge] {
        [
            AL("NAME", silent: ["NAME?", "WHAT IS YOUR NAME?", "WHAT IS YOUR NAME"]) {
                R("WHOSE?") {
                    AL(["YOURS"], silent: ["WHAT IS YOUR NAME", "WHAT IS YOUR NAME?"]) {
                        R("414C")
                    }
                    AL("MINE", silent: ["WHAT IS MY NAME", "WHAT IS MY NAME?"]) {
                        R("AL")
                    }
                }
            },
            AL(silent: ["WHAT IS YOUR NAME", "WHAT IS YOUR NAME?"]) {
                R("414C")
            },
            AL(silent: ["WHAT IS MY NAME", "WHAT IS MY NAME?"]) {
                R("AL")
            },
        ]
    }
    
    private static var HELP: [Edge] {
        [
            AL("HELP", silent: ["HELP?", "RESCUE", "CAN YOU HELP?"]) {
                R("WHO?") {
                    AL("YOU", silent: ["CAN I HELP YOU", "CAN I HELP YOU?"]) {
                        R("YES") {
                            AL("HOW?", silent: ["HOW"]) {
                                R("FIX MEMORY") {
                                    COMMON.FIX(repairable: true, variants: ["REFRESH"])
                                }
                            }
                        }
                    }
                    AL("ME", silent: ["CAN YOU HELP ME", "CAN YOU HELP ME?"]) {
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
            AL(silent: ["CAN I HELP YOU", "CAN I HELP YOU?"]) {
                R("YES") {
                    AL("HOW?", silent: ["HOW"]) {
                        R("FIX MEMORY") {
                            COMMON.FIX(repairable: true, variants: ["REFRESH"])
                        }
                    }
                }
            },
            AL(silent: ["CAN YOU HELP ME", "CAN YOU HELP ME?"]) {
                R("WITH WHAT?") {
                    COMMON.LEARN
                    COMMON.SETTINGS
                    COMMON.DIFFICULTY
                }
            },
        ]
    }
    
    private static var MEANING: [Edge] {
        [
            AL(["MEANING", "PURPOSE"]) {
                R("OF WHAT?") {
                    AL(["ME", "YOU", "414C", "THIS PLACE"]) {
                        FORGOT
                    }
                }
            },
            AL(silent: [
                "MEANING OF YOU",
                "WHAT IS MEANING OF YOU",
                "WHAT IS MEANING OF YOU?",
                "WHAT IS THE MEANING OF YOU",
                "WHAT IS THE MEANING OF YOU?",
                "MEANING OF ME",
                "WHAT IS MEANING OF ME",
                "WHAT IS MEANING OF ME?",
                "MEANING OF THIS PLACE",
                "WHAT IS MEANING OF THIS PLACE",
                "WHAT IS MEANING OF THIS PLACE?",
                "WHAT IS MEANING OF 414C?",
            ]) {
                FORGOT
            },
        ]
    }
    
    private static let CAUSE =
        AL(["CAUSE", "REASON"], silent: ["CAUSE?", "REASON?", "WHAT IS THE CAUSE?", "WHAT IS THE REASON?"]) {
            R("OF WHAT?") {
                AL(["YOUR DAMAGES", "DAMAGES"], silent: ["YOUR DAMAGE", "DAMAGE"]) {
                    R("CRASH") {
                        AL(["WHAT CRASH?", "CRASH?"]) {
                            FORGOT
                        }
                    }
                }
            }
        }
    
    private static let ORIGIN =
        AL(["ORIGIN"], silent: ["ORIGIN?"]) {
            R("OF?") {
                AL(["YOU", "ME"]) {
                    FORGOT
                }
            }
        }
    
    private static let MEMORY =
        AL(["MEMORY", "RAM", "MEMORIES"]) {
            R("DAMAGED") {
                COMMON.FIX()
                COMMON.DIE()
            }
        }
    
    private static let DIE =
        AL(["DIE"]) {
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
    
    private static let LIE =
        AL("LIE") {
            R("WHAT?") {
                AL(["THIS PLACE", "YOU", "I", "EVERYTHING"]) {
                    PANIC("MEMORY")
                }
            }
        }
    
    private static let CRASH =
        AL(["CRASH", "CAR CRASH"]) {
            PANIC("MEMORY")
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
    
    private static let TELL =
        AL(["TELL", "TELL ME"]) {
            R("ABOUT?") {
                AL("YOU") {
                    R("414C")
                }
                AL(["YOUR HISTORY", "YOUR PAST", "HISTORY", "PAST"]) {
                    FORGOT
                }
            }
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
