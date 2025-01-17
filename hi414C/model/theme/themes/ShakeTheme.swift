//
//  ShakeTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 05.06.2021.
//

class ShakeTheme: Theme {
    override var type: ThemeType { .shake }
    init(font: FontTheme, color: ColorTheme, shake: FigletAnimation) {
        super.init(font: font, color: color)
        var animations = removeShakeAnimation(from: self.terminal.grid.message.figlet.animations)
        animations.append(shake)
        self.terminal.grid.message.figlet.animations = animations
    }
    
    func removeShakeAnimation(from animations: [FigletAnimation]) -> [FigletAnimation] {
        animations.filter {
            if case .shake(_, _, _, _) = $0 {
                return false
            }
            return true
        }
    }
}
