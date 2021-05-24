//
//  TerminalTestSelect.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

struct TerminalTestSelect: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var testVM: TestViewModel

    var body: some View {
        Group {
            HelpButton("-1") {
                helpVM.decrement()
            }
            HelpButton("+1") {
                helpVM.increment()
            }
            HelpButton("rnd") {
                helpVM.rand()
            }
            HelpButton("000") {
                helpVM.resetToZero()
            }
        }
        Group {
            if testVM.radix == .hex {
                HelpButton(helpVM.radix == .bin ? "hex" : "bin") {
                    helpVM.radix(of: helpVM.radix == .bin ? .hex : .bin)
                }
            }
        }
        Group {
            if testVM.level > 1 {
                HelpSignButton<ID>("=", .ID)
                HelpSignButton<ADD>("+", .ADD)
                HelpSignButton<SUB>("-", .SUB)
            }
            if testVM.level > 2 {
                HelpSignButton<DIV>("/", .DIV)
                HelpSignButton<MUL>("*", .MUL)
            }
        }
        Group{
            if testVM.level > 3 {
                HelpSignButton<AND>("&", .AND)
            }
            if testVM.level > 4 {
                HelpSignButton<OR>("|", .OR)
            }
            if testVM.level > 5 {
                HelpSignButton<XOR>("^", .XOR)
            }
            if testVM.level > 6 {
                HelpSignButton<NOT>("~", .NOT)
            }
            if testVM.level > 7 {
                HelpSignButton<SHL>("<<", .SHL)
                HelpSignButton<SHR>(">>", .SHR)
            }
        }
    }
}

struct TestSelect_Previews: PreviewProvider {
    static var previews: some View {
        TerminalTestSelect()
    }
}