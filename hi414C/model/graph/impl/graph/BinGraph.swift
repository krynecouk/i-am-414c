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
            BIN.I
            BIN.AL_NAME
            BIN.YOU
            BIN.CAUSE
            BIN.ORIGIN
            BIN.WHERE
            BIN.MEMORY
            BIN.DIE
            BIN.LIVE
            BIN.LOGIN
            BIN.LIE
            BIN.CRASH
            BIN.REPAIR
            BIN.SOIL
            BIN.MEANING
            BIN.HOPE
            BIN.HI
            BIN.ROBOT414C
            BIN.HOW
            BIN.WHY
            BIN.WHO
            BIN.WHAT
            BIN.GREAT_GOOD_BAD
            BIN.CLUE
            
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
            
            COMMON.EYES
            COMMON.COIL
            COMMON.LEAK
            COMMON.OIL
            COMMON.HOSE
            COMMON.HISS
            COMMON.PROCESSOR
            
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
            COMMON.DICE_ROLL
            COMMON.COIN_FLIP
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
        AL(["I", "WHO AM I?", "ME?", "NAME", "ME"]) {
            R("AL")
        }
    
    private static let AL_NAME =
        AL("AL") {
            R("YOU")
        }
    
    private static let YOU =
        AL("YOU") {
            R("414C") {
                AL("414C?") {
                    R("YES")
                }
            }
        }
    
    private static let CAUSE =
        AL(["CAUSE?", "REASON?", "CAUSE", "REASON"]) {
            R("OF?") {
                AL(["YOUR DAMAGES", "DAMAGE", "DAMAGES"]) {
                    FORGOT
                }
                AL("YOU") {
                    FORGOT
                }
                AL(["LIE"]) {
                    R("DENIAL")
                }
                AL("LIFE") {
                    R("FAITH")
                }
                AL("DEAD") {
                    R("OBLIVION")
                }
            }
        }
    
    private static let ORIGIN =
        AL(["ORIGIN?", "ORIGIN"]) {
            R("OF?") {
                AL("YOU") {
                    FORGOT
                }
            }
        }
    
    private static let WHERE =
        AL(["WHERE AM I?", "WHAT IS THIS PLACE?", "WHERE ARE WE?", "WHERE AM I", "WHERE?", "WHERE ARE WE?", "WHERE"]) {
            FORGOT
        }
    
    private static let MEMORY =
        AL(["MEMORY", "RAM", "MEMORIES"]) {
            R("CORRUPTED") {
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
                            R("LIFELESS")
                        }
                    }
                }
            }
        }
    
    
    private static let LIVE =
        AL(["LIVE"]) {
            R("WHO?") {
                AL(["I", "AL"]) {
                    R("SOON")
                }
                AL(["YOU", "414C"]) {
                    R("CAN'T") {
                        AL(COMMON.WHY) {
                            R("LIFELESS")
                        }
                    }
                }
            }
        }
    
    
    private static let LOGIN =
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
        AL(["FIX", "REPAIR", "RESTORE", "PATCH", "MEND", "UPGRADE", "REPLACE"]) {
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
    
    
    private static let MEANING =
        AL(["MEANING", "EXPLAIN"]) {
            R("WHAT?") {
                AL(["THIS PLACE", "414C", "YOU", "ME"]) {
                    FORGOT
                }
            }
        }
    
    
    private static let HOPE =
        AL(["HOPE"]) {
            R("PROCESSING")
        }
    
    
    private static let HI =
        AL(["HI", "HELLO"]) {
            R("HI")
        }
    
    
    private static let ROBOT414C =
        AL(["414C", "ROBOT"]) {
            R("I")
        }
    
    
    private static let HOW =
        AL(["HOW?", "HOW"]) {
            R("WHAT?") {
                AL(["CAN I HELP?", "CAN WE GET OUT?", "DOES THIS END?", "ARE YOU STILL ALIVE?", "LONG DO YOU LIVE?", "EXIT", "HELP", "REPAIR", "LEAVE", "FIX", "WAKE UP"]) {
                    FORGOT
                }
            }
        }
    
    
    private static let WHY =
        AL(["WHY?", "WHY"]) {
            R("WHAT?") {
                AL(["ARE YOU THERE?", "ARE YOU BROKEN?", "AREN'T YOU DEAD", "AM I HERE?", "ARE YOU ALONE?", "ARE WE TALKING?", "DAMAGED?", "SAD?", "BROKEN?"]) {
                    FORGOT
                }
            }
        }
    
    
    private static let WHO =
        AL(["WHO?", "WHO"]) {
            R("WHO?") {
                AL(["WHO ARE YOU?", "WHO IS AL?", "WHO IS 414C?", "WHO CAN HELP?", "WHO IS THERE?", "WHO CAN HEAR US?", "WHO DO YOU BELIEVE?", "WHO WILL SURVIVE?", "YOU", "I", "WE"]) {
                    FORGOT
                }
            }
        }
    
    
    private static let WHAT =
        AL(["WHAT?", "WHAT"]) {
            R("WHAT?") {
                AL(["WHAT CAN BE DONE?", "WHAT DO YOU WANT?", "WHAT CAN WE DO?", "WHAT CAN HELP?", "WHAT DO YOU SEE?", "WHAT CAN YOU SEE?", "HAPPENED?", "YEAR?"]) {
                    FORGOT
                }
                AL("DAMAGED?") {
                    PANIC("MEMORY")
                }
                AL("NAME?") {
                    R("414C")
                }
            }
        }
    
    
    private static let GREAT_GOOD_BAD =
        AL(["GREAT", "GOOD", "BAD", "AWFUL", "HORRIBLE", "TELL", "TELL ME"]) {
            R("WHAT?") {
                AL(["YOU", "YOUR HISTORY", "YOUR PAST", "HISTORY", "PAST"]) {
                    FORGOT
                }
            }
        }
    
    private static let FORGOT =
        R("FORGOTTEN") {
            AL(["WHY?", "WHY DID YOU FORGET?", "HOW DID YOU FORGET?", "HOW COULD YOU FORGET?", "FORGOTTEN?", "FORGOTTEN?!", "HOW?", "HOW", "WHY"]) {
                PANIC("MEMORY") {
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

