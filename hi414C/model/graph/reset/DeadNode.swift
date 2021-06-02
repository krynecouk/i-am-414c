//
//  DeadNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.05.2021.
//

import SwiftUI

class DeadNode: Node {
    let id: String
    let edges: [Edge]
    
    init(_ id: String = "dead_node", @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.id = id
        self.edges = edges()
    }
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        toolkit.testVM.radix(of: .bin)
        toolkit.helpVM.radix(of: .bin)
        toolkit.asciiVM.reset()
        toolkit.graphVM?.setGraph(.BIN)
        toolkit.themeVM.reset()
        toolkit.chatVM.clear()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            toolkit.uiVM.isHelp = false
            toolkit.uiVM.isIntroVideo = false
            toolkit.uiVM.isIntro = true
        }
    }
}
