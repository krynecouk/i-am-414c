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
    @State var landscape: Bool = true
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
                    withAnimation(tablet ? nil : .default) {
                        self.frame = metrics.frame(in: .global)
                        self.landscape = self.frame.maxY < 400
                        self.tablet = self.frame.maxX > 600 && self.frame.maxY > 600
                    }
                }
                .onChange(of: metrics.size) { size in
                    withAnimation(tablet ? nil : .default) {
                        self.frame = metrics.frame(in: .global)
                        self.landscape = self.frame.maxY < 400
                        self.tablet = self.frame.maxX > 600 && self.frame.maxY > 600
                    }
                }
        })
        .padding(landscape ? 10 : 20)
        .padding(.bottom, landscape ? 62 : 69)
        .background(themeVM.terminal.hli.select.background.active.edgesIgnoringSafeArea(.all))
        .transition(!tablet
                        ? AnyTransition.move(edge: .bottom).combined(with: .offset(y: -SegueViewModel.header.height))
                        : .identity
        )
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
                    .transition(AnyTransition.asymmetric(
                                    insertion: .move(edge: .bottom).combined(with: .offset(y: SegueViewModel.header.height)),
                                    removal: .identity))
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
    
    @State var opacity: Double = 0
    
    func Slider() -> some View {
        ButtonContainer(padding: landscape ? 5 : 20, visible: !landscape) {
            HStack {
                if tablet {
                    Minus()
                        .padding(.trailing, 10)
                } else {
                    HelpButton("-", size: (10, 10), padding: landscape ? 10 : 3, color: themeVM.terminal.hli.button.passive.color, withBackground: false) { // TODO
                        helpVM.decrement()
                    }
                    .offset(y: 3.5)
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
                .accentColor(themeVM.terminal.hli.button.active.color)
                
                if tablet {
                    Plus()
                        .padding(.leading, 10)
                } else {
                    HelpButton("+", size: (10, 10), padding: landscape ? 10 : 3, color: themeVM.terminal.hli.button.passive.color, withBackground: false) { // TODO
                        helpVM.increment()
                    }
                    .offset(y: 3.5)
                    //.padding([.leading, .trailing], 5)
                }
            }
        }
        .opacity(self.opacity)
        .transition(AnyTransition.asymmetric(
                        insertion: .move(edge: .bottom).combined(with: .offset(y: SegueViewModel.header.height)),
                        removal: .identity))
        .onAppear {
            withAnimation {
                self.opacity = 1
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
