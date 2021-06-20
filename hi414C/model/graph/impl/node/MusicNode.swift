//
//  MusicNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.06.2021.
//

import AVFoundation

class MusicNode: TestNode {
    
    private let audioPlayer:AVAudioPlayer?
    
    override init(_ name: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.audioPlayer = AVAudioPlayer.from(.computing)
        self.audioPlayer?.numberOfLoops = -1
        super.init(name, edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        DispatchQueue.global().async {
            self.audioPlayer?.play()
        }
        super.onEnter(ctx: ctx, toolkit: toolkit)
    }
    
    override func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        DispatchQueue.global().async {
            self.audioPlayer?.stop()
        }
        super.onExit(ctx: ctx, toolkit: toolkit)
    }
}
