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
        VStack {
            Grid {
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
                
                HelpButton(helpVM.radix == .bin ? "hex" : "bin") {
                    helpVM.radix(of: helpVM.radix == .bin ? .hex : .bin)
                }
            }
            
            HStack {
                Slider(
                    value: Binding(get: {
                        Double(helpVM.equation.result)
                    }, set: { newVal in
                        helpVM.equation = ID() => UInt8(newVal)
                    }),
                    in: 0...255,
                    step: 1
                )
                .accentColor(.orange)
                .padding()
            }
            

        }
    }
}

struct DisabledSound: ViewModifier {
    let disabled: Bool
    let tinyClick: Sound
    
    init(_ disabled: Bool = false) {
        self.disabled = disabled
        self.tinyClick = Sound.of(.tiny_click)
    }
    
    func body(content: Content) -> some View {
        content
            .disabled(disabled)
            .onTapGesture {
                if disabled {
                    tinyClick.play()
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
