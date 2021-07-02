//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    @ObservedObject var intro: PlayerViewModel
    @ObservedObject var sunset: PlayerViewModel
    @ObservedObject var dawn: PlayerViewModel
    
    init() {
        self.intro = PlayerViewModel(fileName: "intro")
        self.sunset = PlayerViewModel(fileName: "sunset")
        self.dawn = PlayerViewModel(fileName: "dawn")
    }
    
    var body: some View {
        if let video = uiVM.video {
            if video == .intro {
                IntroVideo().environmentObject(self.intro)
            } else if video == .dawn {
                DawnVideo().environmentObject(self.dawn)
            } else {
                SunsetVideo().environmentObject(self.sunset)
            }
        } else {
            CathodeView {
                if uiVM.isIntro {
                    IntroScreen()
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

