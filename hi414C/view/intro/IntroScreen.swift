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
                TerminalCommandCursor(theme: themeVM.intro.cursor, size: (30, 50))
                    .padding(30)
                    .bloom(color: themeVM.intro.cursor.view.color)
                    .frame(width: metrics.size.width, height: metrics.size.height, alignment: .topLeading)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                            self.isCursor = false
                        }
                    }
            } else {
                VStack {
                    HStack {
                        FigletView("414C", theme: themeVM.intro.banner)
                            .bloom(color: themeVM.intro.banner.view.color)
                    }
                    Spacer()
                    Text(asciiVM.symbols.contains(.H) ? "tap to continue" : "tap to start")
                        .opacity(textOpacity)
                        .bloom(color: themeVM.intro.text.color)
                        .onAppear {
                            withAnimation(Animation.easeIn(duration: 2).delay(3.3)) {
                                self.textOpacity = 0.8
                            }
                        }
                        .withTheme(themeVM.intro.text)
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
            .withEnvironment()
    }
}

