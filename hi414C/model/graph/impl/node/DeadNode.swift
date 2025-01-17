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
    let index: EdgeIndex = [:]
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        CmdDao.remove()
        toolkit.testVM.reset()
        toolkit.chatVM.reset()
        toolkit.helpVM.reset()
        toolkit.themeVM.reset()
        toolkit.graphVM?.reset()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            toolkit.uiVM.reset()
            toolkit.uiVM.video = .sunset
        }
    }
}
