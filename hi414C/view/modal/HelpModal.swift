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
    
    let text = """
        *** Welcome! ***
        You meet a damaged robot named 414C. Unfortunately, the robot has forgotten all letters.
        
        Decode its binary messages to uncover the letters and use them to communicate with the robot. Find out more about its past and purpose.
        
        Important: type "?" or swipe left to enter the help center.
        """
    
    var body: some View {
        Modal(
            action: {
                uiVM.closeHelp()
            },
            theme: themeVM.terminal.help.modal) {
            Text(text)
                .lineSpacing(10)
                .font(Font.of(props: themeVM.terminal.help.modal.body.font))
                .multilineTextAlignment(.center)
                .foregroundColor(themeVM.terminal.help.modal.body.color)
        }
        .frame(maxWidth: 400, maxHeight: 550)
        .padding(.top, 20)
        .padding(.bottom, SegueViewModel.header.height)
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
