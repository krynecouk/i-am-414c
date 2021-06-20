//
//  HelpEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.06.2021.
//

import Foundation

class HelpEdge: TestEdge {
    let type: HelpType
    let settings: HelpSettingsType
    
    convenience init(_ name: String, _ type: HelpType = .learn, _ settings: HelpSettingsType = .font, _ content: () -> Node) {
        self.init([name], type, settings, content)
    }
    
    init(_ names: [String], _ type: HelpType = .learn, _ settings: HelpSettingsType = .font, _ content: () -> Node) {
        self.type = type
        self.settings = settings
        super.init(names, content)
    }
    
    override func traverse(ctx: GraphContext, toolkit: GraphToolkit) -> Node {
        DispatchQueue.main.async {
            toolkit.helpVM.current = self.type
            toolkit.helpVM.settings = self.settings
            toolkit.uiVM.isHelp = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            toolkit.segueVM.open(type: self.type.toSegueType())
        }
        return super.traverse(ctx: ctx, toolkit: toolkit)
    }
}
