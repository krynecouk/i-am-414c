//
//  FigletView2.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.02.2021.
//

import SwiftUI

struct FigletView2: View {
    @State var printIdx: Int = 0
    @State var lineToUpdate: Int = 0
    @State var lineToUpdate2: Int = 0
    
    let figlet: Figlet
    let figletLines: [FigletLineItem]
    var fontName: FontName
    var fontSize: CGFloat
    
    let timer = Timer.publish(every: 0.8, on: .main, in: .common).autoconnect()
    
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
                FigletLine(line: line.line,offset: lineToUpdate == line.id || lineToUpdate2 == line.id ? CGFloat.random(in: -1...1) : 0, isVisible: printIdx > line.id ? true : false)
            }
        }.onReceive(timer) { _ in
            printIdx += 1
            lineToUpdate = Int.random(in: 0...figletLines.count)
            lineToUpdate2 = Int.random(in: 0...figletLines.count)
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
