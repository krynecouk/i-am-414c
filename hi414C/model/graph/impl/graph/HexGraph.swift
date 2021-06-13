//
//  HexGraph.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.06.2021.
//

class HexGraph {
    private init() {}
    
    static let HI =
        ROOT("HI") {
            
            HEX._HI
            HEX.I
            HEX._AL
            HEX.YOU
            HEX.WHERE
            HEX.LIE
            HEX.PURPOSE
            HEX.PLACE
            HEX.CRASH
            HEX.FAMILY
            HEX.DAUGHTER
            HEX.WAKE
            HEX.PASSWORD
            HEX.CLUE
        }
    
    private static let _HI =
        AL("HI") {
            R("HI")
        }
    
    private static let I =
        AL(["I", "I?", "ME", "ME?", "NAME"]) {
            PANIC414C("AL") {
                AL("AL?") {
                    R("YES")
                }
            }
        }
    
    private static let _AL =
        AL("AL") {
            R("YOU")
        }
    
    private static let YOU =
        AL("YOU") {
            R("I AM AL") {
                AL(["YOU ARE ME?", "ME?", "WHAT?", "HOW?", "???"]) {
                    R("YOU ARE IN COMA") {
                        AL(["COMA", "COMA?", "COMA?!"]) {
                            R("AFTER A CRASH")
                        }
                    }
                }
            }
        }
    
    private static let WHERE =
        AL(["WHERE AM I?"]) {
            R("IN HOSPITAL")
        }
    
    private static let LIE =
        AL(["LIE", "IT'S A LIE"]) {
            R("WHAT?") {
                AL(["YOU", "ABOUT YOU"]) {
                    R("IT IS TRUE")
                }
            }
        }
    
    private static let PURPOSE =
        AL(["WHAT IS YOUR PURPOSE?", "WHY ARE YOU HERE?", "WHAT DO YOU WANT?"]) {
            R("TO HELP YOU") {
                AL(["WITH WHAT?"]) {
                    R("TO WAKE UP")
                }
            }
        }
    
    private static let PLACE =
        AL(["THIS PLACE", "WHAT IS THIS PLACE?"]) {
            R("JUST YOUR MIND")
        }
    
    private static let CRASH =
        AL(["CRASH", "CRASH?"]) {
            R("CAR CRASH")
        }
    
    private static let FAMILY =
        AL(["FAMILY", "FAMILY?"]) {
            R("DAUGHTER") {
                AL("WHAT IS HER NAME?") {
                    R("ELENA")
                }
            }
        }
    
    private static let DAUGHTER =
        AL("DAUGHTER") {
            R("ELENA")
        }
    
    private static let WAKE =
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
    
    private static let PASSWORD =
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
    
    private static let CLUE =
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
