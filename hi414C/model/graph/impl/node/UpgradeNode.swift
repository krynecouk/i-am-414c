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
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.testVM.level(reset: true)
        toolkit.testVM.radix(of: .hex)
        toolkit.helpVM.radix(of: .hex)
        toolkit.asciiVM.reset()
        toolkit.graphVM?.setGraph(.HEX)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            toolkit.uiVM.reset()
        }
    }
}