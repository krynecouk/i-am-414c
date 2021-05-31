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
        Grid(columns: [GridItem(.adaptive(minimum: 110, maximum: .infinity))], spacing: 10, padding: 15) {
            Group {
                HelpButton("-1") {
                    helpVM.decrement()
                }
                HelpButton("+1") {
                    helpVM.increment()
                }
                HelpButton("0") {
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
                HelpSignButton<ADD>("+", .ADD)
                HelpSignButton<SUB>("-", .SUB)
                HelpSignButton<DIV>("/", .DIV)
                HelpSignButton<MUL>("*", .MUL)
            }
            Group{
                HelpSignButton<AND>("&", .AND)
                HelpSignButton<OR>("|", .OR)
                HelpSignButton<XOR>("^", .XOR)
                HelpSignButton<NOT>("~", .NOT)
                HelpSignButton<SHL>("<<", .SHL)
                HelpSignButton<SHR>(">>", .SHR)
            }
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
