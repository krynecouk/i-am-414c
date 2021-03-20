//
//  FigletView2.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.02.2021.
//

import SwiftUI

struct FigletView2: View {
    @State var printIdx: Int = 0
    
    let figlet: Figlet
    let figletLines: [FigletLineItem]
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
        self.figletLines = figlet.lines.enumerated().map { FigletLineItem(id: $0, line: $1) }
    }
    
    var body: some View {
        VStack {
            ForEach(figletLines) { line in
                Text(line.line)
                    .foregroundColor(Color("Primary"))
                    .fixedSize()
                    .multilineTextAlignment(.leading)
                    .font(Font.custom(fontName.rawValue, size: fontSize))
                    .opacity(printIdx >= line.id ? 1 : 0)
                    .bloom()

            }
        }.onReceive(timer) { _ in
            if printIdx == figlet.lines.count {
                self.timer.upstream.connect().cancel()
                return
            }
            printIdx += 1
        }
    }
    
    func size(_ size: CGFloat) -> FigletView2 {
        FigletView2(self.figlet, self.fontName, size)
    }
    
    struct FigletLineItem: Identifiable {
        var id: Int
        var line: String
    }
}

struct FigletView2_Previews: PreviewProvider {
    static var previews: some View {
        FigletView2(ANSIRegular[.A])
    }
}