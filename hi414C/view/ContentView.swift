//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    init() {
        print("WARN: CONTENT VIEW")
    }
    
    var body: some View {
        if uiVM.isIntroVideo {
            IntroVideo()

        } else {
            CathodeView {
                if uiVM.isIntro {
                    IntroScreen()
                } else {
                    TerminalView()
                }
            }
            .onTapGesture {
                if uiVM.isIntro {
                    uiVM.isIntro = false
                }
            }
            .statusBar(hidden: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .withEnvironment()
    }
}

