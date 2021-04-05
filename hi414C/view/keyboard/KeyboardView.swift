//
//  KeyboardView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    typealias Size = (width: CGFloat, height: CGFloat)
    typealias Space = (horizontal: CGFloat, vertical: CGFloat)
    
    @State var side: KeyboardSide = .alphabetic
    @State var size: Size = (.infinity, 250)
    @State var spacing: Space = (4, 4)
    @State var keySize: Size = (50, 70)
    @State var spaceKeySize: Size = (200, 70)
    @State var specialKeySize: Size = (50, 70)

    var keyboard: Keyboard
    var onEnter: (String) -> Void
   
    init(_ keyboard: Keyboard, onEnter: @escaping (String) -> Void = { _ in }) {
        self.keyboard = keyboard
        self.onEnter = onEnter
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack(alignment: .center, spacing: spacing.vertical) {
                KeyboardRow(keyboard[side]![.row1])
                KeyboardRow(keyboard[side]![.row2])
                ZStack(alignment: .trailing) {
                    KeyboardRow(keyboard[side]![.row3])
                        .frame(maxWidth: .infinity)
                    KeyboardKeyView("BS", width: keySize.width, height: keySize.height, theme: themeVM.keyboard.key.BS) { _ in
                        keyboardVM.backspace()
                    }
                }
                HStack(spacing: self.spacing.horizontal) {
                    KeyboardKeyView(side == .alphabetic ? "123" : "ABC", width: specialKeySize.width, height: specialKeySize.height, theme: themeVM.keyboard.key.ABC) { value in
                        self.side = side == .alphabetic ? .numeric : .alphabetic
                    }
                    let space = keyboard[side]![.space][0]
                    KeyboardKeyView(space.label, value: space.value, width: self.spaceKeySize.width, height: keySize.height, theme: space.special ? themeVM.keyboard.key.special : themeVM.keyboard.key.default) { value in
                        keyboardVM.append(value)
                    }
                    KeyboardKeyView("CR", width: specialKeySize.width, height: specialKeySize.height, theme: themeVM.keyboard.key.CR) { _ in
                        self.onEnter(keyboardVM.input)
                        keyboardVM.delete()
                        keyboardVM.close()
                    }
                }
            }
            .id(metrics.frame(in: .global).size.width)
            .onAppear {
                let frame = metrics.frame(in: .global)
                let frameW = frame.size.width
                let keyW: CGFloat = ((frameW - (self.spacing.horizontal * 9)) / 10)
                let keyH: CGFloat = frameW > 500 ? 40 : 70
                let specialW: CGFloat = (frameW - (7 * keyW + 8 * self.spacing.horizontal)) / 2
                let spaceW = (frameW - (self.spacing.horizontal * 2) - (2 * specialW))
                let keyboardH = (4 * keyH) + self.spacing.vertical * 3
                
                self.keySize = (keyW, keyH)
                self.size = (.infinity, keyboardH)
                self.spaceKeySize = (spaceW, keyH)
                self.specialKeySize = (specialW, keyH)
                keyboardVM.setKeyboardSize(self.size)
            }
        }
        .frame(maxWidth: self.size.width, maxHeight: self.size.height)
        .background(Color("GoldBck").edgesIgnoringSafeArea(.all))
    }
    
    func KeyboardRow(_ row: [KeyboardKey]) -> some View {
        HStack(spacing: self.spacing.horizontal) {
            ForEach(row, id: \.label){ key in
                KeyboardKeyView(key.label, value: key.value, width: self.keySize.width, height: self.keySize.height, theme: key.special ? themeVM.keyboard.key.special : themeVM.keyboard.key.default) { value in
                    print("Clicked on \(key.label) with value \(key.value)")
                    keyboardVM.append(value)
                }
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            KeyboardView(Keyboards.qwerty)
        }
        .withEnvironment()
        .previewDisplayName("Portrait")
        
        Landscape {
            VStack {
                Spacer()
                KeyboardView(Keyboards.qwerty)
            }
        }
        .withEnvironment()
        .previewDisplayName("Landscape")
    }
}
