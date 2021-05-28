//
//  IntroVideo.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.05.2021.
//

import SwiftUI
import AVKit

struct IntroVideo: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    let player = AVPlayer(url: Bundle.main.url(forResource: "video", withExtension: "mp4")!)
    
    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width + 250, height: UIScreen.main.bounds.height + 80)
            .statusBar(hidden: true)
            .onAppear {
                player.play()
                let duration = player.currentItem!.asset.duration
                let durationSeconds = CMTimeGetSeconds(duration)
                DispatchQueue.main.asyncAfter(deadline: .now() + durationSeconds) {
                    if uiVM.isIntroVideo || !uiVM.isIntro {
                        uiVM.isIntroVideo = false
                        uiVM.isIntro = true
                    }
                }
            }
            .onTapGesture {
                uiVM.isIntroVideo = false
                uiVM.isIntro = true
            }
    }
}

struct IntroVideo_Previews: PreviewProvider {
    static var previews: some View {
        IntroVideo()
    }
}
