//
//  PlayerViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.07.2021.
//

import SwiftUI
import AVFoundation

class PlayerViewModel: ObservableObject {

    let player: AVPlayer
    var onFinish: () -> Void = {}
    
    init(fileName: String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: "mp4")
        let item = AVPlayerItem(url: url!)
        self.player = AVPlayer(playerItem: item)
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func playerDidFinishPlaying() {
        if self.isPlaying {
            self.isPlaying = false
            self.onFinish()
        }
    }
    
    func onFinish(perform action: @escaping () -> Void = {}) {
        self.onFinish = action
    }
    
    @Published var isPlaying: Bool = false {
        didSet {
            if isPlaying {
                play()
            } else {
                stop()
            }
        }
    }
    
    private func play() {
        let currentItem = player.currentItem
        if currentItem?.currentTime() == currentItem?.duration {
            currentItem?.seek(to: .zero, completionHandler: nil)
        }
        
        player.play()
    }
    
    private func stop() {
        player.seek(to: .zero)
        player.pause()
    }
}
