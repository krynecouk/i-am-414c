//
//  FinishNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.06.2021.
//

import SwiftUI

class FinishNode: Node {
    let id = UUID().uuidString
    let name = "finish"
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