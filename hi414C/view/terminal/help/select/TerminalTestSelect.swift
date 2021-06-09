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
            HelpRadioButton("0", active: helpVM.equation.result != 0, sound: (.delete, .delete)) {
                helpVM.resetToZero()
            }
            .withDisabledSound(if: helpVM.equation.result == 0)
        }
        Group {
            HelpButton(helpVM.radix == .bin ? "hex" : "bin") {
                helpVM.radix(of: helpVM.radix == .bin ? .hex : .bin)
            }
        }
        Group {
            HelpSignButton<ADD>("+", .ADD)
            HelpSignButton<SUB>("-", .SUB)
            
            HelpSignButton<DIV>("/", .DIV, sound: (.click, .delete))
                .withDisabledSound(if: helpVM.equation.result == 0)
            
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

struct DisabledSound: ViewModifier {
    let disabled: Bool
    
    init(_ disabled: Bool = false) {
        self.disabled = disabled
    }
    
    func body(content: Content) -> some View {
        content
            .disabled(disabled)
            .onTapGesture {
                if disabled {
                    Sound.play(.tiny)
                }
            }
    }
}

extension View {
    func withDisabledSound(if condition: Bool) -> some View {
        self.modifier(DisabledSound(condition))
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
