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
            HEX._AL
            HEX.YOU
            HEX.ASK
            HEX.TELL_ME_MORE_ABOUT_YOUR_HISTORY
            HEX.WHAT_IS_THE_MEANING_OF_YOU
            HEX.WHAT_IS_THE_MEANING_OF_THIS_PLACE
            HEX.WHO
            HEX.WAKE
            COMMON._RADIX
            HEX.FAMILY
            HEX.DAUGHTER
            HEX.JOKE
            HEX.CAR_CRASH
            HEX.COMA
            HEX.LIVE
            HEX.NAME
            HEX.PASSWORD
            HEX.CAUSE
            HEX.ORIGIN
            HEX.TELL
            HEX.WHERE
            HEX.WHY
            HEX.HOW
            HEX.WHAT
            HEX.LIE
            HEX.MEANING

            HEX.DIE
            HEX.REPAIR
            HEX.MEMORY
            HEX.REMEMBER
            HEX.HELP
            HEX.SOIL
            HEX.HOPE
            HEX.CLUE
            HEX.EXECUTE
            HEX.PLOT
            HEX.CLUE

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
            COMMON._YELL
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
            COMMON.KNOCK
            
            HEX._HI
            HEX._414C
            HEX.I
        }
    
    private static let _HI =
        AL("HI") {
            R("HI")
        }
    
    private static let I =
        AL(["I", "WHO AM I?"]) {
            PANIC414C("AL")
        }
    
    private static let _AL =
        AL("AL") {
            R("YOU")
        }
    
    private static let _414C =
        AL(["414C"]) {
            R("AL IN HEX") {
                CLUE
            }
        }
    
    private static let YOU =
        AL(["YOU", "WHO ARE YOU?"]) {
            R("I AM AL") {
                AL(["YOU ARE ME?", "ME?", "WHAT?", "HOW?", "???"]) {
                    R("YOU ARE IN COMA") {
                        AL(["COMA", "COMA?", "COMA?!"]) {
                            R("AFTER A CRASH") {
                                CAR_CRASH
                            }
                        }
                    }
                }
            }
        }
    
    private static let COMA =
        AL(["COMA", "TELL ME ABOUT COMA"]) {
            R("WHAT?") {
                AL(["HOW LONG?", "HOW LONG AM I IN COMA?"]) {
                    R("8 YEARS")
                }
                AL(["WHY", "WHY AM I IN COMA?"]) {
                    R("CAR CRASH") {
                        CAR_CRASH
                    }
                }
            }
        }
    
    private static let ASK =
        AL(["ASK", "CAN I ASK YOU SOMETHING?"]) {
            R("OK") {
                WHO
                WHERE
                WHY
                HOW
                WHAT
                DAUGHTER
            }
        }
    
    private static var WHO: [Edge] {
        let WHO_NEED_HELP =
            AL(["WHO?", "WHO NEED HELP?"]) {
                R("YOU NEED HELP") {
                    AL("REALLY?") {
                        R("YES") {
                            AL(["WHY?", "WHY DO I NEED HELP?"]) {
                                R("TO REMEMBER")
                            }
                            AL(["HOW?", "HOW CAN YOU HELP ME?"]) {
                                R("TO REMEMBER") {
                                    AL(["HOW?", "HOW CAN YOU HELP ME REMEBER?"]) {
                                        R("BY TALKING")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        
        let WHO_CAN_HELP_YOU =
            AL(["WHO CAN HELP YOU?"]) {
                R("I DON'T NEED HELP") {
                    AL(["WHY?", "WHY DON'T YOU NEED HELP?"]) {
                        R("I REMEMBER NOW")
                    }
                    WHO_NEED_HELP
                }
            }
        
        let WHO_CAN_HELP_ME =
            AL(["WHO CAN HELP ME?"]) {
                R("I CAN HELP YOU") {
                    AL(["HOW?", "HOW CAN YOU HELP ME?"]) {
                        R("TO REMEMBER") {
                            AL(["HOW?", "HOW CAN YOU HELP ME REMEBER?"]) {
                                R("BY TALKING")
                            }
                        }
                    }
                    WHO_NEED_HELP
                }
            }
        
        return
            [
                AL("WHO?") {
                    R("WHO?") {
                        I
                        YOU
                        ["HELP YOU?", "WHO CAN HELP YOU?"] + WHO_CAN_HELP_YOU
                        ["HELP ME?", "WHO CAN HELP ME?"] + WHO_CAN_HELP_ME
                    }
                },
                WHO_CAN_HELP_YOU,
                WHO_CAN_HELP_ME
            ]
    }
    
    private static var WHERE: [Edge] {
        let WHERE_IS_HELP =
            AL(["WHERE IS HELP?"]) {
                R("I AM HELP") {
                    HOW_CAN_YOU_HELP_ME
                }
            }
        
        let WHERE_IS_ANYBODY =
            AL(["WHERE IS EVERYBODY?", "WHERE ARE OTHER PEOPLE?"]) {
                R("OUT THERE") {
                    AL(["OUT?", "OUT WHERE?!"]) {
                        R("REAL WORLD")
                    }
                }
            }
        
        let WHERE_AM_I =
            AL(["WHERE AM I?"]) {
                R("HOSPITAL") {
                    AL(["IN THE HOSPITAL?"]) {
                        R("YOU ARE IN COMA") {
                            WAKE
                        }
                    }
                }
            }
        
        let WHERE_ARE_YOU =
            AL(["WHERE ARE YOU?"]) {
                R("IN YOUR HEAD")
            }

        let WHERE_IS_DAMAGE =
            AL(["WHERE IS THE DAMAGE?"]) {
                R("MANY PLACES") {
                    AL(["LIKE?", "FOR EXAMPLE?"]) {
                        R("IT DOES NOT MATTER") {
                            AL(["WHY?", "WHY IS THAT?"]) {
                                R("CAN'T BE REPAIRED")
                            }
                        }
                    }
                }
            }
        
        let WHERE_ARE_PEOPLE =
            AL(["WHERE ARE PEOPLE?"]) {
                R("OUT THERE") {
                    AL(["WHERE?", "OUT WHERE?!", "WHAT DO YOU MEAN?"]) {
                        R("REAL WORLD")
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
                        ["DAMAGE"] + WHERE_IS_DAMAGE
                        ["PEOPLE"] + WHERE_ARE_PEOPLE
                    }
                },
                WHERE_IS_HELP,
                WHERE_IS_ANYBODY,
                WHERE_AM_I,
                WHERE_ARE_YOU,
                WHERE_IS_DAMAGE,
                WHERE_ARE_PEOPLE
            ]
    }
    
    private static var WHY: [Edge] {
        let WHY_AM_I_HERE =
            AL("WHY AM I HERE?") {
                R("YOU ARE IN COMA") {
                    WAKE
                }
            }
        
        let WHY_ARE_YOU_THERE =
            AL(["WHY ARE YOU THERE?"]) {
                R("CRASH") {
                    CAR_CRASH
                }
            }

        let WHY_ARE_YOU_DAMAGED =
            AL(["WHY ARE YOU BROKEN?", "WHY ARE YOU DAMAGED?"]) {
                R("CRASH") {
                    CAR_CRASH
                }
            }
        
        let WHY_ARE_YOU_ALONE =
            AL(["WHY ARE YOU ALONE?"]) {
                R("DON'T KNOW") {
                    AL(["DON'T KNOW?", "YOU DON'T KNOW?", "WHY DON'T YOU KNOW?"]) {
                        R("YOUR HEAD NOT MINE")
                    }
                }
            }


        
        let WHY_ARE_WE_TALKING =
            AL(["WHY ARE WE TALKING?"]) {
                R("IT'S HELPING") {
                    AL(["HOW?", "HOW IS TALKING HELPING?"]) {
                        R("TO REMEMBER") {
                            AL(["REMEMBER WHAT?"]) {
                                R("YOUR LIFE")
                            }
                        }
                    }
                }
            }
        
        let WHY_DO_YOU_EXIST =
            AL("WHY DO YOU EXIST?") {
                R("DON'T KNOW")
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
                        ["YOU EXIST"] + WHY_DO_YOU_EXIST
                    }
                },
                WHY_ARE_YOU_THERE,
                WHY_ARE_YOU_DAMAGED,
                WHY_ARE_YOU_ALONE,
                WHY_AM_I_HERE,
                WHY_ARE_WE_TALKING,
                WHY_DO_YOU_EXIST
            ]
    }
    
    private static var HOW: [Edge] {
        let HOW_TO_GET_OUT =
            AL(["HOW TO GET OUT?"]) {
                R("WAKE UP") {
                    WAKE
                }
            }
        
        let HOW_WILL_THIS_END =
            AL(["HOW WILL THIS END?"]) {
                R("IT DEPENDS") {
                    AL(["ON WHAT?", "DEPENDS ON WHAT?"]) {
                        R("IF YOU WAKE UP") {
                            WAKE
                        }
                    }
                }
            }
        
        let HOW_LONG_DO_YOU_LIVE =
            AL(["HOW LONG DO YOU LIVE?"]) {
                R("8 YEARS")
            }
        
        let HOW_LONG_AM_I_IN_COMA =
            AL(["HOW LONG AM I IN A COMA?"]) {
                R("8 YEARS")
            }
        
        return
            [
                AL("HOW?") {
                    R("WHAT?") {
                        ["GET OUT"] + HOW_TO_GET_OUT
                        ["WILL END"] + HOW_WILL_THIS_END
                        ["LONG YOU LIVE"] + HOW_LONG_DO_YOU_LIVE
                        ["LONG IN COMA"] + HOW_LONG_AM_I_IN_COMA
                    }
                },
                HOW_TO_GET_OUT,
                HOW_WILL_THIS_END,
                HOW_LONG_DO_YOU_LIVE,
                HOW_LONG_AM_I_IN_COMA
            ]
    }
    
    private static var WHAT: [Edge] {
        let WHAT_YOU_SEE =
            AL(["WHAT YOU SEE?", "WHAT DO YOU SEE?"]) {
                R("NOTHING") {
                    AL(["WHY?", "WHY CAN'T YOU SEE ANYTHING?", "WHY DO YOU SEE NOTHING?"]) {
                        R("EYES BROKEN") {
                            AL(["RIP OUT", "RIP THEM OUT OF YOUR HEAD"]) {
                                COMMON.DIE_WARN
                            }
                            COMMON.IRREPAIRABLE
                        }
                    }
                }
            }
        
        let WHAT_YOU_HEAR =
            AL(["WHAT YOU HEAR?", "WHAT CAN YOU HEAR?"]) {
                R("NOTHING") {
                    AL(["WHY?", "WHY CAN'T YOU HEAR ANYTHING?", "WHY CAN YOU HEAR NOTHING?"]) {
                        R("EARS BROKEN") {
                            AL(["RIP OUT", "RIP THEM OUT OF YOUR HEAD"]) {
                                COMMON.DIE_WARN
                            }
                            COMMON.IRREPAIRABLE
                        }
                    }
                }
            }
        
        let WHAT_CAN_YOU_HELP =
            AL(["WHAT CAN HELP?", "WHAT CAN YOU HELP?"]) {
                R("YOU WAKING UP") {
                    WAKE
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
                R("AL") {
                    AL(["HOW?", "HOW IS IT POSSIBLE?"]) {
                        R("I AM YOU")
                    }
                }
            }
        
        let WHAT_IS_MY_NAME =
            AL(["WHAT IS MY NAME?"]) {
                R("AL")
            }
        
        let WHAT_IS_NAME_OF_MY_DAUGHTER =
            AL(["WHAT IS THE NAME OF MY DAUGHTER?"]) {
                R("ELENA")
            }
        
        return
            [
                AL(["NAME", "TELL ME A NAME"]) {
                    R("WHOSE?") {
                        ["YOURS"] + WHAT_IS_YOUR_NAME
                        ["MINE"] + WHAT_IS_MY_NAME
                        ["DAUGHTER", "MY DAUGHTER"] + WHAT_IS_NAME_OF_MY_DAUGHTER
                    }
                },
                WHAT_IS_YOUR_NAME,
                WHAT_IS_MY_NAME,
                WHAT_IS_NAME_OF_MY_DAUGHTER
            ]
    }
    
    private static var HELP: [Edge] {
        [
            AL("HELP") {
                R("WHOM?") {
                    AL(["YOU", "CAN I HELP YOU?"]) {
                        R("I DON'T NEED HELP")
                    }
                    AL(["ME", "CAN YOU HELP ME?"]) {
                        R("WHAT WITH?") {
                            AL(["TO REMEMBER", "CAN YOU HELP ME TO REMEMBER?"]) {
                                R("THINK OF HER") {
                                    AL(["WHO?", "THINK OF WHO?"]) {
                                        R("DAUGHTER") {
                                            DAUGHTER
                                        }
                                    }
                                }
                            }
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
    
    private static var WHAT_IS_THE_MEANING_OF_YOU =
        AL(["WHAT IS THE PURPOSE OF YOU?", "WHAT IS THE MEANING OF YOU?"]) {
            R("HELP YOU") {
                HOW_CAN_YOU_HELP_ME
            }
        }
    
    private static var WHAT_IS_THE_MEANING_OF_THIS_PLACE =
        AL(["WHAT IS THE PURPOSE OF THIS PLACE?", "WHAT IS THE MEANING OF THIS PLACE?"]) {
            R("SAFE PLACE")
        }
    
    private static var MEANING: [Edge] {
        let WHAT_IS_THE_MEANING_OF_ME =
            AL(["WHAT IS THE PURPOSE OF ME?", "WHAT IS THE MEANING OF ME?"]) {
                R("I CAN ONLY GUESS") {
                    AL(["GUESS", "SO TRY TO GUESS"]) {
                        R("TO LIVE")
                    }
                }
            }
        

        
        let WHAT_IS_THE_MEANING_OF_NAME_414C =
            AL(["WHAT IS THE MEANING OF NAME 414C?"]) {
                R("AL") {
                    AL("WHY HAVEN'T YOU TOLD ME BEFORE?") {
                        R("MEMORY ERROR")
                    }
                }
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
                    CAR_CRASH
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
                R("CRASH") {
                    CAR_CRASH
                }
            }
        
        let WHAT_IS_THE_ORIGIN_OF_ME =
            AL(["WHAT IS THE ORIGIN OF ME?"]) {
                R("YOU'RE A HUMAN")
            }
        
        let WHAT_IS_THE_ORIGIN_OF_THIS_PLACE =
            AL(["WHAT IS THE ORIGIN OF THIS PLACE?"]) {
                R("YOUR MIND")
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
    
    private static let TELL_ME_MORE_ABOUT_YOUR_HISTORY =
        AL(["WHAT IS YOUR HISTORY?", "TELL ME ABOUT YOUR PAST", "TELL ME ABOUT YOUR HISTORY"]) {
            R("CREATED AFTER THE CRASH") {
                AL("WHY?") {
                    R("TO BUILD A SAFE PLACE")
                }
                CAR_CRASH
            }
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
                                        R("NEED YOUR HELP") {
                                            HOW_CAN_YOU_HELP_ME
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
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
    
    private static let CAR_CRASH =
        AL(["CRASH", "TELL ME ABOUT THE CRASH"]) {
            R("WHAT?") {
                AL(["WHEN", "WHEN WAS THAT CAR CRASH?"]) {
                    R("8 YEARS AGO")
                }
                AL(["ANYBODY SURVIVED?", "DID ANYBODY ELSE SURVIVE THE CAR CRASH?"]) {
                    R("DAUGHTER") {
                        DAUGHTER
                    }
                }
                AL(["MY FAULT?", "WAS IT MY FAULT?"]) {
                    R("YES") {
                        AL(["HOW?", "HOW WAS IT MY FAULT?"]) {
                            R("FELL ASLEEP")
                        }
                    }
                }
            }
        }
    
    private static let LIE =
        AL(["LIE", "IT'S A LIE!"]) {
            R("WHAT?") {
                AL("2+2=5") {
                    R("LIE")
                }
                AL(["ALL", "YOU ARE ME"]) {
                    R("NOT A LIE")
                }
                AL("YOU ARE INSIDE OF ME") {
                    R("NOT A LIE")
                }
                AL("I AM IN A COMA") {
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
                                R("NOT REAL")
                            }
                        }
                    }
                    AL(["AL", "ME"]) {
                        R("YES")
                    }
                    AL("DAUGHTER") {
                        R("YES")
                    }
                }
            },
        ]
    }
    
    private static var DIE: [Edge] {
        return [
            AL(["DIE", "CAN YOU DIE?"]) {
                R("YES") {
                    AL("WHEN?") {
                        R("WHEN YOU DIE")
                    }
                    AL("HOW?") {
                        R("WHEN YOU DIE")
                    }
                }
            },
            AL(["CAN I DIE?"]) {
                R("YES") {
                    AL("WHEN?") {
                        R("WHEN YOU CAN'T REMEMBER")
                    }
                    AL("HOW?") {
                        R("WHEN YOU CAN'T REMEMBER")
                    }
                }
            },
        ]
    }
    
    private static let REPAIR =
        AL(["PATCH", "MEND", "FIX", "REPAIR"]) {
            R("WHAT?") {
                COMMON.COIL
                COMMON.LEAK
                COMMON.EYES
                COMMON.HOSE
                COMMON.PROCESSOR
                MEMORY
            }
        }
    
    private static let MEMORY =
        AL(["MEMORIES", "RANDOM ACCESS MEMORY", "RAM", "MEMORY"]) {
            R("REPAIRED")
        }
    
    private static var REMEMBER: [Edge] {
        let DO_YOU_REMEMBER_HOW_YOU_GOT_DAMAGED =
            AL(["DO YOU REMEMBER HOW YOU GOT DAMAGED?"]) {
                R("YES") {
                    AL(["HOW?", "HOW YOU GOT DAMAGED?"]) {
                        R("CAR CRASH") {
                            CAR_CRASH
                        }
                    }
                }
            }
        
        let DO_YOU_REMEMBER_HOW_YOU_GOT_THERE =
            AL(["HOW YOU GOT THERE?", "DO YOU REMEMBER HOW YOU DID YOU GET THERE?"]) {
                R("NO")
            }
        
        let DO_YOU_REMEMBER_SOMETHING_FROM_YOUR_PAST =
            AL(["WHAT IS YOUR PAST?", "DO YOU REMEMBER SOMETHING FROM YOUR PAST?"]) {
                R("CRASH") {
                    CAR_CRASH
                    AL("SOMETHING ELSE?") {
                        R("DAUGHTER") {
                            DAUGHTER
                        }
                    }
                }
            }
        
        return
            [
                AL(["REMEMBER", "CAN YOU REMEMBER?"]) {
                    R("WHAT?") {
                        ["DAMAGES", "HOW YOU GOT DAMAGED?"] + DO_YOU_REMEMBER_HOW_YOU_GOT_DAMAGED
                        ["GETTING THERE"] + DO_YOU_REMEMBER_HOW_YOU_GOT_THERE
                        ["YOUR PAST?"] + DO_YOU_REMEMBER_SOMETHING_FROM_YOUR_PAST
                    }
                },
                DO_YOU_REMEMBER_HOW_YOU_GOT_DAMAGED,
                DO_YOU_REMEMBER_HOW_YOU_GOT_THERE,
                DO_YOU_REMEMBER_SOMETHING_FROM_YOUR_PAST
            ]
    }
    
    private static let SOIL =
        AL(["SOIL", "LAND", "PLANTS", "FLOWERS"]) {
            R("DYING") {
                AL(["WHY?"]) {
                    R("HERE TOO LONG")
                }
            }
        }
    
    private static var HOPE: [Edge] {
        [
            AL(["HOPE"]) {
                R("HOPE?") {
                    AL("DO YOU HAVE HOPE?") {
                        R("DO YOU?") {
                            AL(["Y", "YES"]) {
                                R("GOOD")
                            }
                            AL(["N", "NO"]) {
                                R("DO YOU GIVE UP?") {
                                    AL(["N", "NO"]) {
                                        R("GOOD")
                                    }
                                    AL(["Y", "YES"]) {
                                        COMMON.DIE_WARN
                                    }
                                }
                            }
                        }
                    }
                }
            },
        ]
    }
    
    private static var HOW_CAN_YOU_HELP_ME =
        AL(["HOW?", "HOW CAN YOU HELP ME?"]) {
            R("HELP YOU TO REMEMBER") {
                AL(["HOW?", "HOW CAN I REMEMBER?", "HOW CAN YOU HELP ME TO REMEMBER?"]) {
                    R("THINK OF HER") {
                        AL(["WHO?", "THINK OF WHO?"]) {
                            R("DAUGHTER") {
                                DAUGHTER
                                AL("WHY?") {
                                    R("REASON TO LIVE")
                                }
                            }
                        }
                    }
                }
            }
        }
    
    private static var EXECUTE: Edge {
            AL(["EXECUTE", "COMMAND", "EXECUTE COMMAND"]) {
                R("NEED PASSWORD") {
                    PASSWORD
                }
            }
    }
    
    static let PLOT =
        AL(["PLOT", "WHAT IS THE PLOT?"]) {
            R("OF WHAT?") {
                AL(["THIS STORY", "WHAT IS THE PLOT OF THIS STORY?"]) {
                    R("I AM YOU")
                }
            }
        }
    
    private static let FAMILY =
        AL(["FAMILY", "DO I HAVE A FAMILY?"]) {
            R("DAUGHTER") {
                DAUGHTER
            }
        }
    
    private static var DAUGHTER: [Edge] {
        return [
            AL(["DAUGHTER", "TELL ME ABOUT MY DAUGHTER"]) {
                R("WHAT?") {
                    AL(["NAME", "HER NAME", "WHAT IS HER NAME?"]) {
                        R("ELENA")
                    }
                    AL(["AGE", "HOW OLD IS SHE?"]) {
                        R("10")
                    }
                    AL(["ALL RIGHT?", "IS SHE ALL RIGHT?"]) {
                        R("YES")
                    }
                    AL(["LOCATION", "WHERE IS SHE NOW?"]) {
                        R("UNKNOWN") {
                            AL("WHY DON'T YOU KNOW?") {
                                R("IN A COMA")
                            }
                        }
                    }
                }
            }
        ]
    }
    
    private static var WAKE: [Edge] {
        let NEED_PASSWORD =
            R("NEED PASSWORD") {
                AL(["WHY?", "WHY?!", "WHY DO I NEED A PASSWORD?"]) {
                    R("TO WAKE UP")
                }
                PASSWORD
            }
        
        return
            [
                AL(["WAKE", "AWAKE", "WAKE ME UP!", "AWAKE", "WAKE UP", "WAKE UP!!!"]) {
                    NEED_PASSWORD
                },
                AL(["HOW DO I WAKE UP?"]) {
                    NEED_PASSWORD
                }
            ]
    }
    
    private static var PASSWORD: Edge {
        let Y = ["YES", "Y"]
        let N = ["NO", "N"]
        
        let HAPPY_END =
            AL("ELENA") {
                FINISH(with: .dawn)
            }
        
        let SAD_END =
            ALL {
                FINISH( with: .sunset)
            }
        
        
        let THIRD_TRY =
            ALL {
                R("WRONG NEXT?") {
                    AL(Y) {
                        R("*****") {
                            ALL {
                                EITHER(left: SAD_END, right: HAPPY_END) { ctx, _ in
                                    ctx.input == "ELENA"
                                }
                            }
                        }
                    }
                    AL(N) {
                        R("OK")
                    }
                }
            }
        
        let SECOND_TRY =
            ALL {
                R("WRONG NEXT?") {
                    AL(Y) {
                        R("*****") {
                            ALL {
                                EITHER(left: THIRD_TRY, right: HAPPY_END) { ctx, _ in
                                    ctx.input == "ELENA"
                                }
                            }
                        }
                    }
                    AL(N) {
                        R("OK")
                    }
                }
            }
        
        let FIRST_TRY =
            ALL {
                EITHER(left: SECOND_TRY, right: HAPPY_END) { ctx, _ in
                    ctx.input == "ELENA"
                }
            }
        
        return
            AL(["LOGIN", "LOGOUT", "REMEMBER", "PASSWORD", "TRY PASSWORD"]) {
                R("Y/N?") {
                    AL(Y) {
                        R("*****") {
                            FIRST_TRY
                        }
                    }
                    AL(N) {
                        R("OK")
                    }
                }
            }
    }
    
    private static let CLUE =
        AL(["CLUE", "CLUELESS", "WHAT IS HEX?"]) {
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
    
    static let JOKE =
        AL(["JOKE", "DO YOU KNOW ANY JOKE?"]) {
            R("KNOCK KNOCK") {
                AL("WHO'S THERE?") {
                    R("AL") {
                        AL("AL WHO?") {
                            R("AL TELL YOU WHEN I WAKE UP")
                        }
                    }
                }
            }
        }
}
