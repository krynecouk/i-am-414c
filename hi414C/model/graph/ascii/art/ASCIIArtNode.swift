//
//  ASCIIArtNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 25.03.2021.
//

struct ASCIIArtNode: Node {
    let id: String
    let edges: [Edge]
    
    init(_ id: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.id = id
        self.edges = edges()
    }
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        let cat = ASCIIArt.of(.cat)
        toolkit.terminalVM.setContent([.art([cat])])
        toolkit.themeVM.terminal.grid.art.view.font = (.terminus, 18)
    }
}
