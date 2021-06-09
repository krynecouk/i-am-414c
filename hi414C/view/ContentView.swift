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
        if let video = uiVM.video {
            Video(video)

        } else {
            CathodeView {
                if uiVM.isIntro {
                    IntroScreen()
                } else {
                    if uiVM.isFinishedGame {
                        FinishedGameScreen()
                    } else {
                        TerminalView()
                    }
                }
            }
            .onTapGesture {
                if uiVM.isIntro {
                    CustomSound.play(.click)
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

