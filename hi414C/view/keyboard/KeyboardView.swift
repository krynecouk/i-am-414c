//
//  KeyboardView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct KeyboardView: View {
    typealias Size = (width: CGFloat, height: CGFloat)
    typealias Space = (horizontal: CGFloat, vertical: CGFloat)
    
    @State var side: KeyboardSide = .alphabetic
    @State var size: Size = (.infinity, 250)
    @State var spacing: Space = (4, 4)
    @State var keySize: Size = (50, 70)
    @State var spaceKeySize: Size = (200, 70)

    var keyboard: Keyboard
   
    init(_ keyboard: Keyboard) {
        self.keyboard = keyboard
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack(alignment: .center, spacing: spacing.vertical) {
                KeyboardRow(keyboard[side]![.row1])
                KeyboardRow(keyboard[side]![.row2])
                ZStack(alignment: .trailing) {
                    KeyboardRow(keyboard[side]![.row3])
                        .frame(maxWidth: .infinity)
                    KeyboardKeyView("DEL", width: keySize.width, height: keySize.height)
                }
                HStack(spacing: self.spacing.horizontal) {
                    KeyboardKeyView(side == .alphabetic ? "123" : "ABC", width: keySize.width, height: keySize.height) { value in
                        self.side = side == .alphabetic ? .numeric : .alphabetic
                    }
                    KeyboardKeyView("SPC", width: self.spaceKeySize.width, height: keySize.height)
                    KeyboardKeyView("ENT", width: keySize.width, height: keySize.height) { value in
                        print("clicked on \(value)")
                    }
                }
            }
            .id(metrics.frame(in: .global).size.width)
            .onAppear {
                let frame = metrics.frame(in: .global)
                let frameWidth = frame.size.width
                self.size = (.infinity, (4 * self.keySize.height) + self.spacing.vertical * 3)
                self.keySize = (((frameWidth - (self.spacing.horizontal * 9)) / 10), 70)
                self.spaceKeySize = ((frameWidth - (self.spacing.horizontal * 2) - (2 * keySize.width)), keySize.height)
            }
        }
        .frame(maxWidth: self.size.width, maxHeight: self.size.height)
        .border(Color.blue)
    }
    
    func KeyboardRow(_ row: [KeyboardKey]) -> some View {
        HStack(spacing: self.spacing.horizontal) {
            ForEach(row, id: \.label){ key in
                KeyboardKeyView(key.label, value: key.value, width: self.keySize.width, height: self.keySize.height) { value in
                    print("Clicked on \(key.label) with value \(key.value)")
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
        .previewDisplayName("Portrait")
        
        Landscape {
            VStack {
                Spacer()
                KeyboardView(Keyboards.qwerty)
            }
        }
        .previewDisplayName("Landscape")
    }
}
