//
//  HexGraph.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.06.2021.
//

class HexGraph {
    private init() {}
    
    static let ROOT =
        R("HI") {
            AL("HI") {
                R("HI")
            }
            AL(["I", "I?", "ME", "ME?", "NAME"]) {
                PANIC414C("AL") {
                    AL("AL?") {
                        R("YES")
                    }
                }
            }
            AL("AL") {
                R("YOU")
            }
            AL("YOU") {
                R("I AM YOU") {
                    AL(["YOU ARE ME?", "ME?", "WHAT?", "HOW?", "???"]) {
                        R("YOU ARE IN COMA") {
                            AL(["COMA", "COMA?", "COMA?!"]) {
                                R("AFTER A CRASH")
                            }
                        }
                    }
                }
            }
            AL(["WHERE AM I?"]) {
                R("IN HOSPITAL")
            }
            AL(["LIE", "IT'S A LIE"]) {
                R("WHAT?") {
                    AL(["YOU", "ABOUT YOU"]) {
                        R("IT IS TRUE")
                    }
                }
            }
            AL(["WHAT IS YOUR PURPOSE?", "WHY ARE YOU HERE?", "WHAT DO YOU WANT?"]) {
                R("TO HELP YOU") {
                    AL(["WITH WHAT?"]) {
                        R("TO WAKE UP")
                    }
                }
            }
            AL(["THIS PLACE", "WHAT IS THIS PLACE?"]) {
                R("JUST YOUR MIND")
            }
            AL(["CRASH", "CRASH?"]) {
                R("CAR CRASH")
            }
            AL(["FAMILY", "FAMILY?"]) {
                R("DAUGHTER") {
                    AL("WHAT IS HER NAME?") {
                        R("ELENA")
                    }
                }
            }
            AL("DAUGHTER") {
                R("ELENA")
            }
            AL(["WAKE", "AWAKE", "HOW DO I WAKE UP?", "WAKE ME UP!", "AWAKE", "WAKE UP", "WAKE UP!"]) {
                R("NEED PASSWORD") {
                    AL(["WHY?", "WHY?!"]) {
                        R("TO REMEMBER") {
                            AL(["WHAT?", "WHAT TO REMEMBER?"]) {
                                R("YOUR LIFE")
                            }
                        }
                    }
                    PASSWORD
                }
            }
            PASSWORD
            
            /*
             
             AL(["MEANING"]) {
             R("WHAT?") {
             AL("414C") {
             FORGOT
             }
             AL("THIS") {
             FORGOT
             }
             }
             }
             
             */
            
            COMMON.COME
            COMMON.STAY
            COMMON.LIKE
            COMMON.HURRY
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
            
            CLUE
        }
    
    
    static let PASSWORD =
        AL(["PASSWORD", "LOGIN", "LOGOUT", "TRY PASSWORD", "REMEMBER", "TRY REMEMBER"]) {
            R("TRY?") {
                AL("Y") {
                    R("*****") {
                        AL("ELENA") {
                            FINISH(with: .dawn)
                        }
                        ALL {
                            R("WRONG NEXT?") {
                                AL("Y") {
                                    R("*****") {
                                        AL("ELENA") {
                                            FINISH(with: .dawn)
                                        }
                                        ALL {
                                            R("WRONG NEXT?") {
                                                AL("Y") {
                                                    R("*****") {
                                                        AL("ELENA") {
                                                            FINISH(with: .dawn)
                                                        }
                                                        ALL {
                                                            FINISH(with: .sunset)
                                                        }
                                                    }
                                                }
                                                AL("N") {
                                                    R("OK")
                                                }
                                            }
                                        }
                                    }
                                }
                                AL("N") {
                                    R("OK")
                                }
                            }
                        }
                    }
                }
                AL("N") {
                    R("OK")
                }
            }
        }
    
    static let CLUE =
        AL(["CLUE", "CLUELESS"]) {
            R("0A=10*(16^0)") {
                AL(["16", "0"]) {
                    R("WRONG")
                }
                IF({ Int($0.input) != nil && $0.input != "10" }) {
                    R("WRONG")
                }
                AL("10") {
                    R("A0=10*(16^1)") {
                        AL(["16", "1"]) {
                            R("WRONG")
                        }
                        IF({ Int($0.input) != nil && $0.input != "160" }) {
                            R("WRONG")
                        }
                        AL("160") {
                            R("FF=15*(16^1)+15*(16^0)") {
                                AL(["156", "240", "ZILLION"]) {
                                    R("WRONG")
                                }
                                IF({ Int($0.input) != nil && $0.input != "255"}) {
                                    R("WRONG")
                                }
                                AL("255") {
                                    R("EXCELLENT!")
                                }
                            }
                        }
                    }
                }
            }
        }
}
