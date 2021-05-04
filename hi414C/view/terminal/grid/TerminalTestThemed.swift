//
//  TerminalTestThemed.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.05.2021.
//

import SwiftUI

struct TerminalTestThemed: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @State var bloom = false
    
    let items: [TerminalTestItem]
    let wide: Bool
    let active: Bool
    
    init(_ items: [TerminalTestItem], wide: Bool = false, active: Bool = false) {
        print("TerminalTestThemed")
        self.items = items
        self.wide = wide
        self.active = active
    }
    
    var body: some View {

        
        return TerminalTest(items, theme: (themeVM.terminal.grid.test.active.figlet, themeVM.terminal.grid.test.active.sign), wide: wide)
            //.bloom(active: bloom)
            .opacity(bloom ? 1 : 0.2)
            .onAppear {
                if active {
                    self.bloom = true
                }
            }
            .onChange(of: active) { isActive in
                if isActive {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.20) {
                        withAnimation {
                            self.bloom = true
                        }
                    }
                } else {
                    bloom = false
                }
            }
    }
}
