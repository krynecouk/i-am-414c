//
//  IntroScreen.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.05.2021.
//

import SwiftUI

struct IntroScreen: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @State var isCursor = true
    
    var body: some View {
        GeometryReader { metrics in
            if isCursor {
                TerminalCommandCursor(theme: TerminalTheme.CommandLine.Cursor(
                    view: ViewTheme(
                        color: Color("PrimaryOrange"),
                        background: Color("PrimaryOrange")
                    ),
                    blink: (1, .linear)
                ), size: (30, 50))
                .padding(30)
                .bloom(color: Color("PrimaryOrange"))
                .frame(width: metrics.size.width, height: metrics.size.height, alignment: .topLeading)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                        self.isCursor = false
                    }
                }
            } else {
                HStack {
                    FigletView("414C", theme: FigletTheme(
                        typeface: .ansi(.shadow),
                        view: ViewTheme(
                            font: FontProps(.terminus, 23),
                            color: Color("PrimaryOrange")
                        ),
                        animations: [.print(speed: 0.5, delay: 0), .bloom(speed: 1, color: Color("PrimaryOrange"))]
                    ))
                    .bloom(color: Color("PrimaryOrange"))
                }
                .padding(30)
                .frame(width: metrics.size.width, height: metrics.size.height, alignment: .top)
            }
        }
    }
}

struct IntroScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreen()
    }
}

