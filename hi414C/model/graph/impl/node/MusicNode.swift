//
//  MusicNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.06.2021.
//

class MusicNode: TestNode {
    private let music: Sound = Sound.of(.computing)
    
    override init(_ name: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(name, edges)
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
