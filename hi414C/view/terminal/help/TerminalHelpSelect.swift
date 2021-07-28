//
//  TerminalHelpSelect.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//
import SwiftUI

struct TerminalHelpSelect: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    var body: some View {
        GeometryReader { metrics in
            /*
                if segueVM.opened == .learn {
                    TerminalTestSelect()
                }
                
                if segueVM.opened == .settings {
                    TerminalSettingsSelect()
                }
            */
            /*
            .background(segueVM.isOpen && segueVM.opened != .keyboard
                            ? themeVM.terminal.hli.select.background.active.edgesIgnoringSafeArea(.all)
                            : themeVM.terminal.hli.select.background.passive.edgesIgnoringSafeArea(.all))
 
            */
             
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
