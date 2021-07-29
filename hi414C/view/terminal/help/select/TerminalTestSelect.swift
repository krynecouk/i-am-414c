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
                }
                .onChange(of: metrics.size) { size in
                    self.frame = metrics.frame(in: .global)
                    self.landscape = self.frame.maxY < 400
                    self.tablet = self.frame.maxX > 700 && self.frame.maxY > 700
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
        ButtonContainer {
            HStack {
                Zero()
                    .padding(.trailing, 10)
                Radix()
            }
        }
        .padding(.trailing, 10)
    }
    
    func MobileButtons() -> some View {
        ButtonContainer {
            HStack {
                Minus()
                Spacer()
                Plus()
                Spacer()
                Zero()
                Spacer()
                Radix()
            }
        }
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
        ButtonContainer(padding: landscape ? 5 : 20, visible: !landscape) {
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
        }
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

struct ButtonContainer<Content: View>: View {
    let padding: CGFloat
    let visible: Bool
    let content: Content
    
    init(padding: CGFloat = 20, visible: Bool = true, @ViewBuilder content: () -> Content) {
        self.padding = padding
        self.visible = visible
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(self.padding)
            .background(self.visible
                            ? RoundedRectangle(cornerRadius: 15.0).fill(Color("TertiaryOrange"))
                            : RoundedRectangle(cornerRadius: 15.0).fill(Color.clear)
            )
    }
}

extension View {
    func withDisabledSound(if condition: Bool) -> some View {
        self.modifier(DisabledSound(condition))
    }
}
