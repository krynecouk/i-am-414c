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
                    KeyboardKeyView("BS", width: keySize.width, height: keySize.height, background: Color.gray) { _ in
                        keyboardVM.delete()
                    }
                }
                HStack(spacing: self.spacing.horizontal) {
                    KeyboardKeyView(side == .alphabetic ? "123" : "ABC", width: specialKeySize.width, height: specialKeySize.height, background: Color.gray) { value in
                        self.side = side == .alphabetic ? .numeric : .alphabetic
                    }
                    KeyboardKeyView(keyboard[side]![.space][0].label, value: keyboard[side]![.space][0].value, width: self.spaceKeySize.width, height: keySize.height) { value in
                        keyboardVM.append(value)
                    }
                    KeyboardKeyView("CR", width: specialKeySize.width, height: specialKeySize.height, background: Color.blue) { _ in
                        self.onEnter(keyboardVM.input)
                        keyboardVM.delete()
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
            }
        }
        .frame(maxWidth: self.size.width, maxHeight: self.size.height)
        .background(Color("GoldBck").edgesIgnoringSafeArea(.all))
    }
    
    func KeyboardRow(_ row: [KeyboardKey]) -> some View {
        HStack(spacing: self.spacing.horizontal) {
            ForEach(row, id: \.label){ key in
                KeyboardKeyView(key.label, value: key.value, width: self.keySize.width, height: self.keySize.height, background: key.special ? Color.blue : Color("Primary")) { value in
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
