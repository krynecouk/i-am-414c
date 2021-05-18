//
//  HelpEdgeDrag.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 06.05.2021.
//

import SwiftUI

struct HelpEdgeDrag: ViewModifier {
    @EnvironmentObject var uiVM: UIViewModel
    
    func body(content: Content) -> some View {
        content
            .onEdgeDrag(
                left: {
                    if !uiVM.isHelp {
                        withAnimation {
                            uiVM.isHelp = true
                        }
                    }
                },
                right: {
                    // todo theme animation
                    if uiVM.isHelp {
                        uiVM.detail = (false, false)
                        withAnimation {
                            uiVM.isHelp = false
                        }
                    }
                }
            )
    }
}

extension View {
    func helpEdgeDrag() -> some View {
        self.modifier(HelpEdgeDrag())
    }
}
