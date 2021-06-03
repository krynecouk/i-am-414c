//
//  DeadNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.05.2021.
//

import SwiftUI

class DeadNode: Node {
    let id: String = "dead_node"
    let edges: [Edge] = []
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.testVM.reset()
        toolkit.asciiVM.reset()
        toolkit.chatVM.reset()
        toolkit.helpVM.reset()
        toolkit.themeVM.reset()
        toolkit.graphVM?.reset()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            toolkit.uiVM.reset()
            //toolkit.uiVM.video = .intro TODO
        }
    }
}

class FinishNode: Node {
    let id: String = "finish_node"
    let edges: [Edge] = []
    let end: VideoType
    
    init(with end: VideoType) {
        self.end = end
    }
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.testVM.reset()
        toolkit.asciiVM.reset()
        toolkit.chatVM.reset()
        toolkit.helpVM.reset()
        toolkit.themeVM.reset()
        toolkit.graphVM?.reset()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            toolkit.uiVM.reset()
            toolkit.uiVM.isFinishedGame = true
            //toolkit.uiVM.video = self.end TODO
        }
    }
}
