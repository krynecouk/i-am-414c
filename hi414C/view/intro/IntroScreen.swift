//
//  IntroScreen.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.05.2021.
//

import SwiftUI

struct IntroScreen: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    @State var isCursor = true
    @State var textOpacity: Double = 0
    
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
                VStack {
                    HStack {
                        FigletView("414C", theme: FigletTheme(
                            typeface: .ansi(.shadow),
                            view: ViewTheme(
                                font: FontProps(.terminus, 23),
                                color: Color("PrimaryOrange")
                            ),
                            animations: [.print(speed: 0.4, delay: 0.3), .bloom(speed: 0.3, color: Color("PrimaryOrange"))]
                        ))
                        .bloom(color: Color("PrimaryOrange"))
                    }
                    Spacer()
                    Text(asciiVM.symbols.contains(.H) ? "tap to continue" : "tap to start")
                        .font(Font.of(props: FontProps(.proggyTiny, 32)))
                        .foregroundColor(Color("PrimaryOrange"))
                        .opacity(textOpacity)
                        .bloom(color: Color("PrimaryOrange"))
                        .onAppear {
                            withAnimation(Animation.easeIn(duration: 2).delay(3.3)) {
                                self.textOpacity = 0.8
                            }
                        }
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

