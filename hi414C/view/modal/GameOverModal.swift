//
//  GameOverModal.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.06.2021.
//

import SwiftUI

struct GameOverModal: View {
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let text = "*** Congratulations ***\nYou have finished the main story!\n\nContinue finding missing letters or start again at a different difficulty.\n\nThank you for playing!"
    
    var body: some View {
        Modal(
            action: {
                withAnimation {
                    uiVM.isFinishedGame = false
                }
            },
            theme: themeVM.intro.finish) {
            Text(text)
                .lineSpacing(10)
                .font(Font.of(props: themeVM.intro.finish.body.font))
                .multilineTextAlignment(.center)
                .foregroundColor(themeVM.intro.finish.body.color)
        }
        .frame(maxWidth: 450, maxHeight: 350)
    }
    
}

struct GameOverModal_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            GameOverModal()
        }
        .withEnvironment()
    }
}
