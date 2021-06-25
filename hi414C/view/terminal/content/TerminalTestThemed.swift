//
//  TerminalTestThemed.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.05.2021.
//

import SwiftUI

struct TerminalTestThemed: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var testVM: TestViewModel
    @State var bloom = false
    
    let delay: Double = 2.2
    
    let test: Test
    let items: [TerminalTestItem]
    let wide: Bool
    let active: Bool
    let withDelay: Bool
    
    init(_ test: Test, items: [TerminalTestItem], wide: Bool = false, active: Bool = false, withDelay: Bool = false) {
        print("TerminalTestThemed")
        self.test = test
        self.items = items
        self.wide = wide
        self.active = active
        self.withDelay = withDelay
    }
    
    var body: some View {
        TerminalTest(items, theme: (themeVM.terminal.grid.test.active.figlet, themeVM.terminal.grid.test.active.sign), wide: wide)
            //.bloom(color: themeVM.terminal.grid.test.active.figlet.view.color, active: bloom, radius: 5)
            .opacity(bloom ? 1 : 0.15)
            .onAppear {
                if active {
                    if withDelay {
                        DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                            withAnimation {
                                self.bloom = true
                            }
                        }
                    } else {
                        self.bloom = true
                    }
                }
            }
            .onChange(of: active) { isActive in
                if isActive && test.id == testVM.test?.id {
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                        withAnimation {
                            self.bloom = true
                        }
                    }
                }
            }
    }
}
