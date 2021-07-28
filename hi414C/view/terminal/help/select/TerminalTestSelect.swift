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
    
    @State var frame: CGRect = CGRect()
    @State var extended: Bool = true
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                if extended {
                    Buttons()
                }
                Slider()
            }
        }
        .background(GeometryReader { metrics in
            Color.clear
                .onAppear {
                    self.frame = metrics.frame(in: .global)
                    self.extended = self.frame.maxY > 400
                }
                .onChange(of: metrics.size) { size in
                    self.frame = metrics.frame(in: .global)
                    self.extended = self.frame.maxY > 400
                }
        })
        .padding(extended ? 20 : 10)
        .padding(.bottom, extended ? 69 : 62)
        .background(themeVM.terminal.hli.select.background.active.edgesIgnoringSafeArea(.all))
    }
    
    func Buttons() -> some View {
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
    }
    
    func Slider() -> some View {
        HStack {
            if !extended {
                HelpButton("-", size: (10, 10), padding: 10, color: Color("WhiteOrange"), withBackground: false) { // TODO
                    helpVM.decrement()
                }
                .offset(y: 3.5)
                .padding([.leading, .trailing], 5)
            }

            SwiftUI.Slider(
                value: Binding(get: {
                    Double(helpVM.equation.result)
                }, set: { newVal in
                    helpVM.equation = ID() => UInt8(newVal)
                }),
                in: 0...255,
                step: 1
            )
            .accentColor(Color("PrimaryOrange")) // TODO!!!
            if !extended {
                HelpButton("+", size: (10, 10), padding: 10, color: Color("WhiteOrange"), withBackground: false) { // TODO
                    helpVM.increment()
                }
                .offset(y: 3.5)
                .padding([.leading, .trailing], 5)
            }
        }
        .padding(extended ? 20 : 5)
        .background(extended ? RoundedRectangle(cornerRadius: 15.0)
                        .fill(Color("TertiaryOrange")) : RoundedRectangle(cornerRadius: 15.0)
                        .fill(Color.clear))
        .padding(.top, extended ? 5 : 0)
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
