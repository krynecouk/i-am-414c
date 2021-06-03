//
//  Video.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.05.2021.
//

import SwiftUI
import AVKit

struct Video: View {
    let type: VideoType
    let player: AVPlayer
    
    init(_ type: VideoType = .intro) {
        self.type = type
        self.player = type.player()
    }
    
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

enum VideoType {
    case intro, dawn, sunset
    
    func player() -> AVPlayer {
        switch self {
        case .intro:
            return AVPlayer(url: Bundle.main.url(forResource: "intro", withExtension: "mp4")!)
        case .dawn:
            return AVPlayer(url: Bundle.main.url(forResource: "dawn", withExtension: "mp4")!)
        case .sunset:
            return AVPlayer(url: Bundle.main.url(forResource: "sunset", withExtension: "mp4")!)
        }
    }
}

struct IntroVideo_Previews: PreviewProvider {
    static var previews: some View {
        Video()
    }
}
