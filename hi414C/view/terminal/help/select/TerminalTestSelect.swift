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
            HelpButton("0", sound: .delete) {
                helpVM.resetToZero()
            }
        }
        Group {
            //if testVM.radix == .hex {
                HelpButton(helpVM.radix == .bin ? "hex" : "bin") {
                    helpVM.radix(of: helpVM.radix == .bin ? .hex : .bin)
                }
            //}
        }
        Group {
            //if testVM.level >= 3 || testVM.difficulty == .medium || testVM.difficulty == .hard {
                HelpSignButton<ADD>("+", .ADD)
                HelpSignButton<SUB>("-", .SUB)
            //}
            //if testVM.level >= 4 || testVM.difficulty == .medium || testVM.difficulty == .hard {
            HelpSignButton<DIV>("/", .DIV, sound: helpVM.equation.result == 0 ? (.dulled, .dulled) : (.click, .delete))
                HelpSignButton<MUL>("*", .MUL)
            //}
        }
        Group{
            //if testVM.level >= 5 || testVM.difficulty == .medium || testVM.difficulty == .hard {
                HelpSignButton<AND>("&", .AND)
            //}
            //if testVM.level >= 6 || testVM.difficulty == .medium || testVM.difficulty == .hard {
                HelpSignButton<OR>("|", .OR)
            //}
            //if testVM.level >= 7 || testVM.difficulty == .medium || testVM.difficulty == .hard {
                HelpSignButton<XOR>("^", .XOR)
            //}
            //if testVM.level >= 8 || testVM.difficulty == .medium || testVM.difficulty == .hard {
                HelpSignButton<NOT>("~", .NOT)
            //}
            //if testVM.level >= 9 || testVM.difficulty == .medium || testVM.difficulty == .hard {
                HelpSignButton<SHL>("<<", .SHL)
                HelpSignButton<SHR>(">>", .SHR)
            //}
        }
    }
}

struct TestSelect_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TerminalTestSelect()
                .withEnvironment()
        }
    }
}
