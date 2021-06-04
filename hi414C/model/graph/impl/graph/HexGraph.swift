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
                    AL(["YOU?", "YOU ARE ME", "YOU ARE ME?"]) {
                        R("YES") {
                            AL(["HOW", "HOW?"]) {
                                R("YOU'RE IN COMA")
                            }
                        }
                    }
                }
            }
            AL(["COMA", "COMA?"]) {
                R("FROM ACCIDENT")
            }
            AL("ACCIDENT") {
                R("CAR ACCIDENT")
            }
            AL(["WHO ARE YOU", "WHO ARE YOU?"]) {
                R("I AM DREAM")
            }
            AL(["WAKE", "WAKE UP", "WAKE UP!"]) {
                R("CAN'T, NEED PASSWORD")
            }
            PASSWORD
        }
    
    
    static let PASSWORD =
        AL("PASSWORD") {
            R("TRY?") {
                AL("Y") {
                    R("*****") {
                        AL("ELENA") {
                            FINISH(with: .dawn)
                        }
                        ALL {
                            R("BAD. NEXT?") {
                                AL("Y") {
                                    R("*****") {
                                        AL("ELENA") {
                                            FINISH(with: .dawn)
                                        }
                                        ALL {
                                            R("BAD. NEXT?") {
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
}
