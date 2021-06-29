//
//  HelpModal.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 29.06.2021.
//

import SwiftUI

struct HelpModal: View {
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let text = "*** Welcome! ***\nYou have entered help center.\n\nHere you can learn about binary, browse messaging history or change app settings.\n\nTIP: Next time swipe left for quick access to this screen. Single tap on binary to have it's formatted view."
    
    var body: some View {
        Modal(
            action: {
                withAnimation {
                    // TODO
                }
            },
            theme: themeVM.intro.finish) {
            Text(text)
                .lineSpacing(10)
                .font(Font.of(props: themeVM.intro.finish.body.font))
                .multilineTextAlignment(.center)
                .foregroundColor(themeVM.intro.finish.body.color)
        }
        .frame(maxWidth: 600)
    }
    
}

struct HelpModal_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            HelpModal()
        }
        .withEnvironment()
    }
}
