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
                            if uiVM.detail.0 == false {
                                uiVM.detail = (true, false)
                            }
                            uiVM.isHelp = true
                        }
                    }
                },
                right: {
                    if uiVM.isHelp {
                        withAnimation {
                            if uiVM.detail.0 == true {
                                uiVM.detail = (false, false)
                            }
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
