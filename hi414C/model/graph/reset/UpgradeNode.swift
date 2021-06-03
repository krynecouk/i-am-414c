//
//  UpgradeNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.05.2021.
//

import SwiftUI

class UpgradeNode: Node {
    let id: String
    let edges: [Edge]
    
    init(_ id: String = "upgrade_node", @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.id = id
        self.edges = edges()
    }
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.testVM.level(reset: true)
        toolkit.testVM.radix(of: .hex)
        toolkit.testVM.storeProgress(.hex)
        toolkit.helpVM.radix(of: .hex)
        toolkit.asciiVM.reset()
        toolkit.graphVM?.setGraph(.HEX)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            toolkit.uiVM.isHelp = false
            toolkit.uiVM.video = .none // TODO intro
            toolkit.uiVM.isIntro = true
        }
    }
}
