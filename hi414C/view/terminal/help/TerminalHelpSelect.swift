//
//  TerminalHelpSelect.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//
import SwiftUI

struct TerminalHelpSelect: View {
    @EnvironmentObject var segueVM: SegueViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    var body: some View {
        GeometryReader { metrics in
            Group {
                if segueVM.opened == .learn {
                    TerminalTestSelect()
                }
                
                if segueVM.opened == .chat {
                    LazyVStack {
                        TerminalMessagesSelect()
                    }

                }
                
                if segueVM.opened == .settings {
                    TerminalSettingsSelect()
                }
            }
            .id(metrics.frame(in: .global).size.width)
            /*
            .onAppear {
                let frame = metrics.frame(in: .global)
                let frameW = frame.size.width
                
                // ipad
                if frame.maxY > 800 {
                    segueVM.setLearnSize((.infinity, 270))
                    segueVM.setChatSize((.infinity, 270))
                    segueVM.setSettingsSize((.infinity, 270))
                } else if frameW > 500 {
                    segueVM.setLearnSize((.infinity, 95))
                    segueVM.setChatSize((.infinity, 140))
                    segueVM.setSettingsSize((.infinity, 95))
                } else {
                    segueVM.setLearnSize((.infinity, 270))
                    segueVM.setChatSize((.infinity, 270))
                    segueVM.setSettingsSize((.infinity, 200))
                }
            }
            */
            .background(segueVM.isOpen && segueVM.opened != .keyboard
                            ? themeVM.terminal.hli.select.background.active.edgesIgnoringSafeArea(.all)
                            : themeVM.terminal.hli.select.background.passive.edgesIgnoringSafeArea(.all))
        }
    }
    
    enum GridType {
        case adaptive, messages
        
        private static let ADAPTIVE = [GridItem(.adaptive(minimum: 110, maximum: .infinity))]
        private static let MESSAGES = [GridItem(.adaptive(minimum: 150, maximum: .infinity))]
        
        func rawValue() -> [GridItem] {
            switch self {
            case .adaptive:
                return GridType.ADAPTIVE
            case .messages:
                return GridType.MESSAGES
            }
        }
    }
}
