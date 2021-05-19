//
//  IntroVideo.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.05.2021.
//

import SwiftUI
import AVKit

struct IntroVideo: View {
    
    let player = AVPlayer(url: Bundle.main.url(forResource: "video", withExtension: "mp4")!)
    
    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width + 1500, height: UIScreen.main.bounds.height + 500)
            .statusBar(hidden: true)
            .onAppear {
                player.play()
            }
    }
}

struct IntroVideo_Previews: PreviewProvider {
    static var previews: some View {
        IntroVideo()
    }
}
