//
//  Video.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.05.2021.
//

import SwiftUI
import AVKit

struct Video: View {
    @EnvironmentObject var uiVM: UIViewModel
    @State var size: Size = (width: UIScreen.main.bounds.width + 300, height: UIScreen.main.bounds.height + 100)
    
    let type: VideoType
    let player: AVPlayer
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    init(_ type: VideoType = .intro) {
        self.type = type
        self.player = type.player()
    }
    
    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .frame(width: size.width, height: size.height)
            .statusBar(hidden: true)
            .onAppear {
                player.play()
                let duration = player.currentItem!.asset.duration
                let durationSeconds = CMTimeGetSeconds(duration)
                DispatchQueue.main.asyncAfter(deadline: .now() + durationSeconds) {
                    if uiVM.video != nil || !uiVM.isIntro {
                        uiVM.video = .none
                        uiVM.isIntro = true
                    }
                }
                
                let ratio = UIScreen.main.bounds.width / UIScreen.main.bounds.height
                print("ratio: ", ratio)
                if ratio >= 1 {
                    self.size = (width: UIScreen.main.bounds.width + 800, height: UIScreen.main.bounds.height + 800)
                } else {
                    self.size = (width: UIScreen.main.bounds.width + 300, height: UIScreen.main.bounds.height + 100)
                }
            }
            .onTapGesture {
                uiVM.video = .none
                uiVM.isIntro = true
            }
            .onReceive(orientationChanged) { _ in
                print("orientation changed")
                print("width: ", UIScreen.main.bounds.width)
                print("height: ", UIScreen.main.bounds.height)
                let ratio = UIScreen.main.bounds.width / UIScreen.main.bounds.height
                print("ratio: ", ratio)
                if ratio >= 1 {
                    self.size = (width: UIScreen.main.bounds.width + 800, height: UIScreen.main.bounds.height + 800)
                } else {
                    self.size = (width: UIScreen.main.bounds.width + 300, height: UIScreen.main.bounds.height + 100)
                }
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
