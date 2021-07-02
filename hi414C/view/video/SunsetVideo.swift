//
//  SunsetVideo.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.07.2021.
//

import SwiftUI

import SwiftUI
import AVFoundation

struct SunsetVideo: View {
    @EnvironmentObject var playerVM: PlayerViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    var body: some View {
        PlayerContainerView(player: playerVM.player, gravity: .aspectFill)
            .onAppear {
                self.playerVM.onFinish {
                    skip()
                }
                self.playerVM.isPlaying = true
            }
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
    }
    
    func skip() {
        self.playerVM.isPlaying = false
        uiVM.video = nil
        uiVM.isIntro = true
    }
}
