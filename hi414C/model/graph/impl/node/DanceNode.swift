//
//  DanceNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.06.2021.
//

import AVFoundation

class DanceNode: ShakeNode {
    private let music: Sound = Sound.of(.computing)
    
    override init(_ name: String, shake: FigletAnimation, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(name, shake: shake, edges)
    }
    
    override func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        self.music.play()
        super.onEnter(ctx: ctx, toolkit: toolkit)
    }
    
    override func onExit(ctx: GraphContext, toolkit: GraphToolkit) {
        self.music.stop()
        super.onExit(ctx: ctx, toolkit: toolkit)
    }
}
