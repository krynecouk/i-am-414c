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
            AL(["I", "WHO AM I?", "ME?", "NAME", "ME"]) {
                R("AL")
            }
            AL("AL") {
                R("YOU")
            }
            AL("YOU") {
                R("414C") {
                    AL("414C?") {
                        R("YES")
                    }
                }
            }
            AL(["CAUSE?", "ORIGIN?", "REASON?", "CAUSE"]) {
                R("OF?") {
                    AL(["DAMAGE", "DAMAGES", "YOUR DAMAGES", "OF YOUR DAMAGES"]) {
                        FORGOT
                    }
                    AL(["LIE"]) {
                        R("DENIAL")
                    }
                    AL("LIFE") {
                        R("BELIEF")
                    }
                    AL("DEAD") {
                        R("OBLIVION")
                    }
                    AL("YOU") {
                        FORGOT
                    }
                }
            }
            AL(["WHERE AM I?", "WHAT IS THIS PLACE?", "WHERE ARE WE?", "WHERE AM I?", "WHERE?", "WHERE ARE WE?", "WHERE"]) {
                FORGOT
            }
            AL(["MEMORY", "RAM", "MEMORIES"]) {
                R("CORRUPTED") {
                    COMMON.FIX()
                    COMMON.DIE()
                }
            }
            AL(["DIE"]) {
                R("WHO?") {
                    AL("I") {
                        R("CAN'T") {
                            AL(COMMON.WHY) {
                                PANIC("ERROR")
                            }
                        }
                    }
                    AL("YOU") {
                        R("CAN'T") {
                            AL(COMMON.WHY) {
                                R("DEAD")
                            }
                        }
                    }
                }
            }
            AL(["LIVE"]) {
                R("WHO?") {
                    AL("I") {
                        R("SOON")
                    }
                    AL("YOU") {
                        R("CAN'T") {
                            AL(COMMON.WHY) {
                                R("DEAD")
                            }
                        }
                    }
                }
            }
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
            AL("LIE") {
                R("WHAT?") {
                    AL("YOU") {
                        PANIC("ERROR")
                    }
                }
            }
            AL(["CRASH", "CAR CRASH"]) {
                PANIC("MEMORY")
            }
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
            AL(["SOIL", "LAND"]) {
                R("DRY")
            }
            AL(["MEANING"]) {
                R("WHAT?") {
                    AL("414C") {
                        FORGOT
                    }
                    AL("ME") {
                        FORGOT
                    }
                    AL("THIS") {
                        FORGOT
                    }
                }
            }
            AL(["HI", "HELLO"]) {
                R("HI")
            }
            AL("414C") {
                R("I")
            }
            
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
            COMMON.COIN_TOSS
            COMMON.GUESS
            COMMON.DANCE
            COMMON.SMILE
            COMMON.SAD
            COMMON.WINK
            COMMON.CRY
            COMMON.EMOTION

            COMMON.CLONE
            COMMON.HELL
            
            CLUE
        }
    

    
    private static let FORGOT =
        R("FORGOT") {
            AL(["FORGOT?", "FORGOT?!", "HOW?", "HOW COULD YOU FORGOT?", "HOW"]) {
                PANIC("MEMORY")
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
                                            R("GREAT!")
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

