//
//  FigletLine.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.03.2021.
//

import SwiftUI

struct FigletLine: View {
    @State var offset: CGFloat = 0
    var line: String
    var isVisible: Bool = false
    
    init(line: String, isVisible: Bool, offset: CGFloat = 0) {
        self.line = line
        self.isVisible = isVisible
        self.offset = offset
    }
    
    let timer = Timer.publish(every: TimeInterval.random(in: 0.8...2), on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(line)
            .foregroundColor(Color("Primary"))
            .fixedSize()
            .multilineTextAlignment(.leading)
            .font(Font.custom(FontName.terminus.rawValue, size: 13)) // TODO param
            .opacity(isVisible ? 1 : 0)
            .offset(x: self.offset)
            .bloom()
            .onAppear {
                self.offset = CGFloat.random(in: -0.5...0.5)
            }
            .onReceive(timer) { _ in
                self.offset = CGFloat.random(in: -0.5...0.5)
            }
    }
}

struct FigletLine_Previews: PreviewProvider {
    static var previews: some View {
        FigletLine(line: "██████", isVisible: true)
    }
}
