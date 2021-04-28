//
//  TerminalHelpLine.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

struct TerminalHelpLine: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("Help")
                .font(Font.custom(FontName.proggyTiny.rawValue, size: 33))
                .padding(.trailing, 17)
            Spacer()
        }
        .padding(.all, 15)
        .frame(height: 64)
        .background(Color("BlackBck").edgesIgnoringSafeArea(.all))
    }
}
