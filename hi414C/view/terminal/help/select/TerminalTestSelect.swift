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
    @EnvironmentObject var themeVM: ThemeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                HelpButton("-") {
                    helpVM.decrement()
                }
                Spacer()
                HelpButton("+") {
                    helpVM.increment()
                }
                Spacer()
                HelpRadioButton("0", active: helpVM.equation.result != 0, sound: (.delete, .delete)) {
                    helpVM.resetToZero()
                }
                .withDisabledSound(if: helpVM.equation.result == 0)
                Spacer()
                HelpButton(helpVM.radix == .bin ? "hex" : "bin") {
                    helpVM.radix(of: helpVM.radix == .bin ? .hex : .bin)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15.0)
                            .fill(Color("TertiaryOrange")))
            
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
                .accentColor(Color("PrimaryOrange")) // TODO!!!

            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15.0)
                            .fill(Color("TertiaryOrange")))
            .padding(.top, 5)
        }
        .padding()
        .padding(.bottom, 69)
        .background(themeVM.terminal.hli.select.background.active.edgesIgnoringSafeArea(.all))
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
