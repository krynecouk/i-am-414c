//
//  TerminalTest.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.04.2021.
//

import SwiftUI

typealias Span = (small: Int, big: Int)

struct TerminalTest: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    let items: [TerminalTestItem]
    let active: Bool
    let animated: Bool
    
    init(_ items: [TerminalTestItem], _ active: Bool = false, animated: Bool = true) {
        print("TerminalTest")
        self.items = items
        self.active = active
        self.animated = animated
    }
    
    var body: some View {
        ForEach(Array(items.enumerated()), id: \.offset) { i, item in
            if case let .bin(char) = item.type {
                LiteFigletView(String(char), theme: active
                            ? (animated ? themeVM.ascii.test.test.active.figlet : themeVM.ascii.test.test.active.figlet.withAnimation([]))
                            : (animated ? themeVM.ascii.test.test.passive.figlet : themeVM.ascii.test.test.passive.figlet.withAnimation([])))
            }
            if case let .op(char, span) = item.type {
                LiteFigletView(String(char), theme: active
                            ? (animated ? themeVM.ascii.test.test.active.special : themeVM.ascii.test.test.active.special.withAnimation([]))
                            : (animated ? themeVM.ascii.test.test.passive.special : themeVM.ascii.test.test.passive.special.withAnimation([])))
                if uiVM.isDetail {
                    if uiVM.isWideScreen() {
                        ForEach(0 ..< span.big) { _ in
                            Color.clear
                        }
                    } else {
                        ForEach(0 ..< span.small) { _ in
                            Color.clear
                        }
                    }
                }
            }
        }
    }
}

struct TerminalTestItem: Identifiable {
    var id: UUID
    var type: TerminalTestType
    
    init(id: UUID = UUID(), of type: TerminalTestType) {
        self.id = id
        self.type = type
    }
}

enum TerminalTestType {
    case bin(Character)
    case op(Character, Span)
}
