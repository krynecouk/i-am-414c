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
    
    @State var gridType: GridType = .adaptive
    
    var body: some View {
        GeometryReader { metrics in
            Grid(columns: gridType.rawValue(), spacing: 10, padding: 15) {
                if segueVM.opened == .help && uiVM.current == .message {
                    MessagesSelect()
                    .onAppear {
                        if self.gridType != .messages {
                            self.gridType = .messages
                        }
                    }
                }
                if segueVM.opened == .help && uiVM.current == .test {
                    TestSelect()
                    .onAppear {
                        if self.gridType != .adaptive {
                            self.gridType = .adaptive
                        }
                    }
                }
                
                if segueVM.opened == .settings {
                    SettingsSelect()
                        .onAppear {
                            if self.gridType != .adaptive {
                                self.gridType = .adaptive
                            }
                        }
                }
                
                if segueVM.opened == .themes {
                    ThemesSelect()
                        .onAppear {
                            if self.gridType != .adaptive {
                                self.gridType = .adaptive
                            }
                        }
                }
            }
            .id(metrics.frame(in: .global).size.width)
            .onAppear {
                let frame = metrics.frame(in: .global)
                let frameW = frame.size.width
                if frameW > 500 {
                    segueVM.setHelpSize((.infinity, 150))
                    segueVM.setThemesSize((.infinity, 150))
                    segueVM.setSettingsSize((.infinity, 150))
                } else {
                    segueVM.setHelpSize((.infinity, 210))
                    segueVM.setThemesSize((.infinity, 300))
                    segueVM.setSettingsSize((.infinity, 210))
                }
            }
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
