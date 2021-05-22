//
//  DeadNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.05.2021.
//

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
        toolkit.graphVM?.setGraph(root: Graphs.HI)
        toolkit.uiVM.isIntroVideo = false // TODO
        toolkit.uiVM.isIntro = true
        toolkit.themeVM.reset()
        toolkit.historyVM.replace(with: [])
    }
}
