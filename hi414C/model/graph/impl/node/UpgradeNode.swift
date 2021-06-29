//
//  UpgradeNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.05.2021.
//

import Foundation

class UpgradeNode: Node {
    let id = UUID().uuidString
    let name = "upgrade"
    let edges: [Edge] = []
    let index: EdgeIndex = [:]
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        let gameFinished = GameOverDao.find() ?? false
        CmdDao.remove()
        toolkit.testVM.level(reset: true)
        toolkit.testVM.radix(of: .hex)
        toolkit.helpVM.radix(of: .hex)
        if !gameFinished {
            toolkit.asciiVM.reset()
        }
        toolkit.graphVM?.setGraph(.HEX)
        toolkit.graphVM?.visited = []
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            toolkit.uiVM.reset()
            toolkit.uiVM.closeHelp()
        }
    }
}
