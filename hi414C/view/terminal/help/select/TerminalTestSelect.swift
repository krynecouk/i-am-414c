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
    @State var landscape: Bool = false
    @State var tablet: Bool = false
    
    var body: some View {
        Group {
            if tablet {
                TabletLayout()
            } else {
                MobileLayout()
            }
        }
        .background(GeometryReader { metrics in
            Color.clear
                .onAppear {
                    self.frame = metrics.frame(in: .global)
                    self.landscape = self.frame.maxY < 400
                    self.tablet = self.frame.maxX > 700 && self.frame.maxY > 700
                    print(frame.maxX, frame.maxY)
                }
                .onChange(of: metrics.size) { size in
                    self.frame = metrics.frame(in: .global)
                    self.landscape = self.frame.maxY < 400
                    self.tablet = self.frame.maxX > 700 && self.frame.maxY > 700
                    print(frame.maxX, frame.maxY)
                }
        })
        .padding(landscape ? 10 : 20)
        .padding(.bottom, landscape ? 62 : 69)
        .background(themeVM.terminal.hli.select.background.active.edgesIgnoringSafeArea(.all))
        //.transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: SegueViewModel.header.height)))
    }
    
    func TabletLayout() -> some View {
        HStack {
            TabletButtons()
            Slider()
        }
    }
    
    func MobileLayout() -> some View {
        VStack(alignment: .leading) {
            if !landscape {
                MobileButtons()
            }
            Slider()
        }
    }
    
    func TabletButtons() -> some View {
        HStack {
            Zero()
                .padding(.trailing, 10)
            Radix()
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 15.0)
                        .fill(Color("TertiaryOrange")))
        .padding(.trailing, 10)
    }
    
    func MobileButtons() -> some View {
        HStack {
            Minus()
            Spacer()
            Plus()
            Spacer()
            Zero()
            Spacer()
            Radix()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15.0)
                        .fill(Color("TertiaryOrange")))
    }
    
    func Minus() -> some View {
        HelpButton("-") {
            helpVM.decrement()
        }
    }
    
    func Plus() -> some View {
        HelpButton("+") {
            helpVM.increment()
        }
    }
    
    func Zero() -> some View {
        HelpRadioButton("0", active: helpVM.equation.result != 0, sound: (.delete, .delete)) {
            helpVM.resetToZero()
        }
        .withDisabledSound(if: helpVM.equation.result == 0)
    }
    
    func Radix() -> some View {
        HelpButton(helpVM.radix == .bin ? "hex" : "bin") {
            helpVM.radix(of: helpVM.radix == .bin ? .hex : .bin)
        }
    }
    
    func Slider() -> some View {
        HStack {
            if landscape {
                HelpButton("-", size: (10, 10), padding: 10, color: Color("WhiteOrange"), withBackground: false) { // TODO
                    helpVM.decrement()
                }
                .offset(y: 3.5)
                .padding([.leading, .trailing], 5)
            }

            if tablet {
                Minus()
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
            if landscape {
                HelpButton("+", size: (10, 10), padding: 10, color: Color("WhiteOrange"), withBackground: false) { // TODO
                    helpVM.increment()
                }
                .offset(y: 3.5)
                .padding([.leading, .trailing], 5)
            }
            if tablet {
                Plus()
            }
        }
        .padding(landscape ? 5 : 20)
        .background(landscape ? RoundedRectangle(cornerRadius: 15.0)
                        .fill(Color.clear) : RoundedRectangle(cornerRadius: 15.0)
                        .fill(Color("TertiaryOrange")))
        .padding(.top, landscape || tablet ? 0 : 10)
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
