//
//  DawnVideo.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.07.2021.
//

import SwiftUI
import AVFoundation

struct DawnVideo: View {
    @EnvironmentObject var playerVM: PlayerViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    @State var textOpacity: Double = 0
    
    var body: some View {
        ZStack {
            PlayerContainerView(player: playerVM.player, gravity: .aspectFill)
                .onAppear {
                    self.playerVM.onFinish {
                        skip()
                    }
                    self.playerVM.isPlaying = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        if playerVM.isPlaying {
                            self.textOpacity = 1
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 17) {
                        if playerVM.isPlaying {
                            withAnimation(.default.speed(0.2)) {
                                self.textOpacity = 0
                            }
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: true)
            
            I_AM_414C_OVERLAY<Text>(opacity: self.textOpacity)
        }
    }
    
    func skip() {
        self.playerVM.isPlaying = false
        uiVM.video = nil
        uiVM.isIntro = true
    }
}
