//
//  LeavesOfGrass.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.05.2021.
//

struct LeavesOfGrass {
    private init() {}
    
    private static let poems = [
        O_ME_O_LIFE
    ]
    
    static let O_ME_O_LIFE =
        R("O ME! O LIFE!") {
            AL("") {
                R("OF THE ENDLESS TRAINS OF THE FAITHLESS,") {
                    AL("") {
                        R("OF CITIES FILL’D WITH THE") {
                            AL("FOOLISH") {
                                R("DONE")
                            }
                        }
                    }
                }
            }
        }
    
    subscript(index: Int) -> R? {
        LeavesOfGrass.poems[safe: index]
    }
}
