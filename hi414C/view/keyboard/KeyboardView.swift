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
    @EnvironmentObject var segueVM: SegueViewModel
    
    @State var side: KeyboardSide = .alphabetic
    @State var size: Size = (.infinity, 250)
    @State var spacing: Space = (4, 4)
    @State var keySize: Size = (50, 70)
    @State var keyOffset: Offset = (0, 100)
    @State var spaceKeySize: Size = (200, 70)
    @State var specialKeySize: Size = (50, 70)

    let keyboard: Keyboard
    let onEnter: (String) -> Void
    let predictive: Bool
   
    init(_ keyboard: Keyboard, predictive: Bool = false, onEnter: @escaping (String) -> Void = { _ in }) {
        self.keyboard = keyboard
        self.predictive = predictive
        self.onEnter = onEnter
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack(alignment: .center, spacing: spacing.vertical) {
                if self.predictive {
                    KeyboardPrediction()
                        .offset(x: keyOffset.x, y: keyOffset.y)
                }
                KeyboardRow(keyboard[side]![.row1])
                KeyboardRow(keyboard[side]![.row2])
                ZStack(alignment: .trailing) {
                    KeyboardRow(keyboard[side]![.row3])
                        .frame(maxWidth: .infinity)
                    KeyboardKeyView("<-", width: keySize.width + 10, height: keySize.height, theme: themeVM.keyboard.key.BS, collapsable: false, sound: .delete) { _ in
                        keyboardVM.backspace()
                    }
                }
                HStack(spacing: self.spacing.horizontal) {
                    KeyboardKeyView(side == .alphabetic ? "123" : "ABC", width: specialKeySize.width, height: specialKeySize.height, theme: themeVM.keyboard.key.ABC, sound: .modifier) { value in
                        self.side = side == .alphabetic ? .numeric : .alphabetic
                    }
                    let space = keyboard[side]![.space][0]
                    KeyboardKeyView(space.decrypted ? "SPC" : space.label, value: space.value, width: self.spaceKeySize.width, height: keySize.height, theme: space.decrypted ? themeVM.keyboard.key.decrypted : themeVM.keyboard.key.default) { value in
                        keyboardVM.append(value)
                    }
                    KeyboardKeyView("ENT", width: specialKeySize.width, height: specialKeySize.height, theme: themeVM.keyboard.key.CR, sound: .none) { _ in
                        self.onEnter(keyboardVM.input)
                        keyboardVM.delete()
                        segueVM.close()
                    }
                }
            }
            .id(metrics.frame(in: .global).size.width)
            .onAppear {
                let frame = metrics.frame(in: .global)
                let frameW = frame.size.width
                let keyW: CGFloat = ((frameW - (self.spacing.horizontal * 9)) / 10)
                var keyH: CGFloat = frameW > 500 ? 40 : 70
                // ipad
                if frame.maxY > 600 && frame.maxX > 600 {
                    keyH = 70
                }
                
                let specialW: CGFloat = (frameW - (7 * keyW + 8 * self.spacing.horizontal)) / 2
                let spaceW = (frameW - (self.spacing.horizontal * 2) - (2 * specialW))
                let keyboardH = (4 * keyH) + self.spacing.vertical * 3 + KeyboardViewModel.prediction.height
                
                self.keySize = (keyW, keyH)
                self.size = (.infinity, keyboardH)
                self.spaceKeySize = (spaceW, keyH)
                self.specialKeySize = (specialW, keyH)
                
                if segueVM.keyboard.height != self.size.height {
                    segueVM.setKeyboardSize(self.size)
                }
            }
            .onReceive(segueVM.$isOpen) { isOpen in
                withAnimation {
                    self.keyOffset = isOpen ? (0,0) : (0, 100)
                }
            }
        }
        .frame(maxWidth: self.size.width, maxHeight: self.predictive ? self.size.height : self.size.height - KeyboardViewModel.prediction.height)
        .background(themeVM.keyboard.view.background.edgesIgnoringSafeArea(.all))
    }
    
    func KeyboardRow(_ row: [KeyboardKey]) -> some View {
        HStack(spacing: self.spacing.horizontal) {
            ForEach(row, id: \.label){ key in
                KeyboardKeyView(key.label, value: key.value, width: self.keySize.width, height: self.keySize.height, theme: key.decrypted ? themeVM.keyboard.key.decrypted : themeVM.keyboard.key.default) { value in
                    keyboardVM.append(value)
                }
                .offset(x: keyOffset.x, y: keyOffset.y)
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
    }
}
