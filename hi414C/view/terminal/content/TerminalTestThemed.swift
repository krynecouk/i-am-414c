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
    @State var shadow = false
    
    let delay: Double = 2.2
    
    let test: Test
    let items: TestItems
    let wide: Bool
    let active: Bool
    let withDelay: Bool
    let withResult: Bool
    
    init(_ test: Test, items: TestItems, wide: Bool = false, active: Bool = false, withDelay: Bool = false, withResult: Bool = false) {
        self.test = test
        self.items = items
        self.wide = wide
        self.active = active
        self.withDelay = withDelay
        self.withResult = withResult
    }
    
    var body: some View {
        TerminalTest(withResult ? items.solved : items.unsolved, theme: (themeVM.terminal.grid.test.figlet, themeVM.terminal.grid.test.sign), wide: wide, shadow: self.shadow)
            .opacity(bloom ? 1 : 0.15)
            .onAppear {
                if active {
                    if withDelay {
                        DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                            withAnimation {
                                self.bloom = true
                                self.shadow = true
                            }
                        }
                    } else {
                        self.bloom = true
                        self.shadow = true
                    }
                }
            }
            .onChange(of: active) { isActive in
                if isActive && test.id == testVM.test?.id {
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                        withAnimation {
                            self.bloom = true
                            self.shadow = true
                        }
                    }
                }
            }
    }
}
