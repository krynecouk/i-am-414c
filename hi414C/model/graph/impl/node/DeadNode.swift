//
//  DeadNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.05.2021.
//

import SwiftUI

class DeadNode: Node {
    let id = UUID().uuidString
    let name = "dead"
    let edges: [Edge] = []
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        let gameFinished = GameOverDao.find() ?? false
        toolkit.testVM.reset()
        if !gameFinished {
            toolkit.asciiVM.reset()
        }
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
