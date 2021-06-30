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
    
    let text = "*** Welcome! ***\nYou have entered help center.\n\nHere you can learn about binary, browse messaging history or change app settings.\n\nTIP#1: For a quicker access to this screen, swipe left. \n\nTIP#2: Use single tap in binary section to display its formatted view."
    
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