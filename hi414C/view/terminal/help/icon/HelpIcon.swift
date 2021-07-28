//
//  HelpIcon.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.07.2021.
//

import SwiftUI

struct HelpIcon: View {
    var type: HelpIconType
    var size: Size
    var active: Bool
    
    init(_ type: HelpIconType, size: Size = (24, 24), active: Bool) {
        self.type = type
        self.size = size
        self.active = active
    }
    
    var body: some View {
        let icon = type.getIcon()
        ZStack {
            Image(icon.passive)
                .resizable()
                .opacity(active ? 0 : 1)
                .frame(width: size.width, height: size.height)
                //.transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
            Image(icon.active)
                .resizable()
                .opacity(active ? 1 : 0)
                .frame(width: size.width, height: size.height)
        }
    }
}

typealias HelpIconName = (passive: String, active: String)

enum HelpIconType {
    case message
    
    func getIcon() -> HelpIconName {
        switch self {
        case .message:
            return ("message1", "message2")
        }
    }
}

struct HelpIcon_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HelpIcon(.message, active: false)
            HelpIcon(.message, active: true)
        }
    }
}
