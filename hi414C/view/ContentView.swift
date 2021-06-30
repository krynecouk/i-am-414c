//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    let intro: Sound = Sound.of(.intro)
    
    var body: some View {
        if let video = uiVM.video {
            Video(video)

        } else {
            CathodeView {
                if uiVM.isIntro {
                    IntroScreen {
                        intro.play()
                    }
                    .onAppear {
                        uiVM.isRefreshWave = true
                    }
                } else {
                    if uiVM.isFinishedGame {
                        GameOverModal()
                    } else {
                        TerminalView()
                    }
                }
            }
            .onTapGesture {
                if uiVM.isIntro {
                    uiVM.isIntro = false
                    uiVM.isRefreshWave = false
                    intro.stop()
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

