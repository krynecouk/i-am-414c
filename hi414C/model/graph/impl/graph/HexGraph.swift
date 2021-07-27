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
            HEX._414C
            
            HEX.ASK
            HEX.WHO
            HEX.WHERE
            HEX.WHY
            HEX.HOW
            HEX.WHAT
            
            HEX.NAME
            HEX.HELP
            HEX.MEANING
            HEX.ORIGIN
            HEX.TELL
            HEX.CRASH
            HEX.LIE
            HEX.LIVE
            HEX.DIE
            HEX.REPAIR
            HEX.MEMORY
            HEX.REMEMBER
            // LOGIN
            // LOGOUT
            HEX.WAKE
            HEX.SOIL
            HEX.HOPE
            HEX.EXECUTE
            // COMMAND
            //HEX.CLUE
            HEX.PLOT
            HEX.JOKE
            HEX.HELL
            
            HEX.FAMILY
            HEX.DAUGHTER
            HEX.PASSWORD
            HEX.COMA
            HEX.CAUSE
            
            DAMAGES.ALL
            GENERIC.ALL
            SETTINGS.ALL
            FATALITY.ALL
            EMOTION.ALL
            DATETIME.ALL
            CALCULATE.ALL
            INTERACTIVE.ALL
        }
    
    private static let _HI =
        AL("HI") {
            R("HI") >> I
        }
    
    private static let I =
        AL(["ME", "I", "I?", "WHO AM I?"]) {
            PANIC414C("AL") >> _AL
        }
    
    private static let _AL =
        AL(["AL", "AL?"]) {
            R("YOU") >> YOU
        }
    
    private static let YOU =
        AL(["YOU", "YOU?", "WHO ARE YOU?"]) {
            R("I AM AL") {
                AL(["YOU ARE ME?", "ME?", "WHAT?", "HOW?", "YOU???"]) {
                    R("YOU ARE IN COMA") {
                        AL(["COMA", "COMA?", "COMA?!"]) {
                            R("AFTER A CRASH") {
                                CRASH
                            }
                        }
                    }
                }
            }
        }
    
    private static let _414C =
        AL(["414C", "414C?"]) {
            R("AL IN HEX") {
                CLUE
            }
        }
    
    
    private static let ASK =
        AL(["ASK", "CAN I ASK YOU SOMETHING?"]) {
            R("WHAT?") {
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
            AL(["WHO NEED HELP?"]) {
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
                    R("?") {
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
                    R("?") {
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
                    CRASH
                }
            }
        
        let WHY_ARE_YOU_DAMAGED =
            AL(["WHY ARE YOU BROKEN?", "WHY ARE YOU DAMAGED?"]) {
                R("CRASH") {
                    CRASH
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
                    R("?") {
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
                    R("?") {
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
                R("?") {
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
                            SETTINGS.LEARN
                            SETTINGS.SETTINGS
                            SETTINGS.DIFFICULTY
                            SETTINGS.THEME
                            SETTINGS.CHANGE
                        }
                    }
                }
            },
        ]
    }
    
    private static var MEANING: [Edge] {
        let WHAT_IS_THE_MEANING_OF_YOU =
            AL(["WHAT IS THE PURPOSE OF YOU?", "WHAT IS THE MEANING OF YOU?"]) {
                R("HELP YOU") {
                    HOW_CAN_YOU_HELP_ME
                }
            }
        
        let WHAT_IS_THE_MEANING_OF_THIS_PLACE =
            AL(["WHAT IS THE PURPOSE OF THIS PLACE?", "WHAT IS THE MEANING OF THIS PLACE?"]) {
                R("SAFE PLACE")
            }
        
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
    
    private static var ORIGIN: [Edge] {
        let WHAT_IS_THE_ORIGIN_OF_YOU =
            AL(["WHAT IS THE ORIGIN OF YOU?"]) {
                R("CRASH") {
                    CRASH
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
    
    private static var TELL: [Edge] {
        let TELL_ME_MORE_ABOUT_YOUR_HISTORY =
            AL(["WHAT IS YOUR HISTORY?", "TELL ME ABOUT YOUR PAST", "TELL ME ABOUT YOUR HISTORY"]) {
                R("CREATED AFTER THE CRASH") {
                    AL("WHY?") {
                        R("TO BUILD A SAFE PLACE")
                    }
                    CRASH
                }
            }
        
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
    
    private static let CRASH =
        AL(["CRASH", "CRASH?", "CRASH???", "TELL ME ABOUT THE CRASH"]) {
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
            R("?") {
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
                DAMAGES.COIL
                DAMAGES.LEAK
                DAMAGES.EYES
                DAMAGES.HOSE
                DAMAGES.PROCESSOR
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
                            CRASH
                        }
                    }
                }
            }
        
        let DO_YOU_REMEMBER_HOW_YOU_GOT_THERE =
            AL(["DO YOU REMEMBER HOW YOU DID YOU GET THERE?"]) {
                R("NO")
            }
        
        let HOW_YOU_GOT_THERE =
            AL(["DAMAGES", "HOW YOU GOT DAMAGED?", "HOW YOU GOT THERE?"]) {
                R("CRASH") {
                    CRASH
                }
            }
        
        let DO_YOU_REMEMBER_SOMETHING_FROM_YOUR_PAST =
            AL(["WHAT IS YOUR PAST?", "DO YOU REMEMBER SOMETHING FROM YOUR PAST?"]) {
                R("CRASH") {
                    CRASH
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
                        DO_YOU_REMEMBER_HOW_YOU_GOT_DAMAGED
                        ["GETTING THERE"] + DO_YOU_REMEMBER_HOW_YOU_GOT_THERE
                        ["YOUR PAST?"] + DO_YOU_REMEMBER_SOMETHING_FROM_YOUR_PAST
                        HOW_YOU_GOT_THERE
                    }
                },
                DO_YOU_REMEMBER_HOW_YOU_GOT_DAMAGED,
                DO_YOU_REMEMBER_HOW_YOU_GOT_THERE,
                DO_YOU_REMEMBER_SOMETHING_FROM_YOUR_PAST,
                HOW_YOU_GOT_THERE
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
    
    private static var EXECUTE: Edge {
        AL(["EXECUTE", "COMMAND", "EXECUTE COMMAND"]) {
            R("NEED PASSWORD") {
                PASSWORD
            }
        }
    }
    
    private static let CLUE =
        AL(["CLUE", "CLUELESS", "WHAT IS HEX?"]) {
            R("0A=10*(16^0)") {
                AL(["16", "0"]) {
                    R("WRONG")
                }
                TRAVERSE_IF({ Int($0.input) != nil && $0.input != "10" }) {
                    R("WRONG")
                }
                AL("10") {
                    R("A0=10*(16^1)") {
                        AL(["16", "1"]) {
                            R("WRONG")
                        }
                        TRAVERSE_IF({ Int($0.input) != nil && $0.input != "160" }) {
                            R("WRONG")
                        }
                        AL("160") {
                            R("FF=15*(16^1)+15*(16^0)") {
                                AL(["156", "240", "ZILLION"]) {
                                    R("WRONG")
                                }
                                TRAVERSE_IF({ Int($0.input) != nil && $0.input != "255"}) {
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
    
    private static let PLOT =
        AL(["PLOT", "WHAT IS THE PLOT?"]) {
            R("OF WHAT?") {
                AL(["THIS STORY", "WHAT IS THE PLOT OF THIS STORY?"]) {
                    R("I AM YOU")
                }
            }
        }
    
    private static let JOKE =
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
    
    private static let HELL =
        AL(["IS IT?", "IS THIS HEAVEN?", "IS THIS HELL?"]) {
            R("NO") {
                AL(["WHAT IS IT", "THEN WHAT IS IT?", "WHERE ARE WE?"]) {
                    R("YOUR MIND")
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
    
    private static var PASSWORD: Edge {
        let Y = ["YES", "Y"]
        let N = ["NO", "N"]
        
        let HAPPY_END =
            AL("ELENA") {
                FINISH(with: .dawn)
            }
        
        let SAD_END =
            TRAVERSE_ALL {
                FINISH( with: .sunset)
            }
        
        
        let THIRD_TRY =
            TRAVERSE_ALL {
                R("WRONG NEXT?") {
                    AL(Y) {
                        R("*****") {
                            TRAVERSE_ALL {
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
            TRAVERSE_ALL {
                R("WRONG NEXT?") {
                    AL(Y) {
                        R("*****") {
                            TRAVERSE_ALL {
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
            TRAVERSE_ALL {
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
    
    private static let COMA =
        AL(["COMA", "TELL ME ABOUT COMA"]) {
            R("WHAT?") {
                AL(["HOW LONG?", "HOW LONG AM I IN COMA?"]) {
                    R("8 YEARS")
                }
                AL(["WHY", "WHY AM I IN COMA?"]) {
                    R("CAR CRASH") {
                        CRASH
                    }
                }
            }
        }
    
    
    private static var CAUSE: [Edge] {
        let WHAT_IS_THE_CAUSE_OF_YOUR_DAMAGES =
            AL(["CAUSE OF YOUR DAMAGES?", "WHAT IS THE CAUSE OF YOUR DAMAGES?"]) {
                R("CRASH") {
                    CRASH
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
}
