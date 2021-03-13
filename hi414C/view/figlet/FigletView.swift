//
//  FigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.02.2021.
//

import SwiftUI

struct FigletView: View {
    @State var print: String = ""
    @State var printIdx: Int = 0
    
    let figlet: Figlet
    var fontName: FontName
    var fontSize: CGFloat
    
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    init(
        _ figlet: Figlet,
        _ fontName: FontName = .terminus,
        _ fontSize: CGFloat = 13) {
        
        self.figlet = figlet
        self.fontName = fontName
        self.fontSize = fontSize
        self.print = figlet.lines[0]
    }
    
    var body: some View {
        Text(print)
            .foregroundColor(Color("Primary"))
            //.border(Color.blue)
            .fixedSize()
            .multilineTextAlignment(.leading)
            .font(Font.custom(fontName.rawValue, size: fontSize))
            .bloom()
            .onReceive(timer) { _ in
                if printIdx == figlet.lines.count {
                    self.timer.upstream.connect().cancel()
                    return
                }
                print += figlet.lines[printIdx] + "\n"
                printIdx += 1
            }
    }
    
    func size(_ size: CGFloat) -> FigletView {
        FigletView(self.figlet, self.fontName, size)
    }
}

struct FigletView_Previews: PreviewProvider {
    static var previews: some View {
        FigletView(ANSIShadow[.A]!)
    }
}
