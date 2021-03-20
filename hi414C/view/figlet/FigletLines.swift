//
//  FigletItem.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.02.2021.
//

import SwiftUI

struct FigletLines: View {
    typealias LineIdx = Int
    
    @State var toPrint: LineIdx = 0
    @State var toUpdate: Set<LineIdx> = Set()
    
    var lines: [String]
    var animations: [FigletAnimation] = []
    var offset: CGFloat = 0
    var isVisible: Bool = false
    var color: Color = Color("Primary")
    var fontName: FontName = .terminus
    var fontSize: CGFloat = 13
    
    let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ForEach(lines.indices) { i in
                FigletLine(
                    line: lines[i],
                    offset: animations.contains(.shake) && toUpdate.contains(i) ? CGFloat.random(in: -1...1) : 0,
                    isVisible: !animations.contains(.print) || toPrint > i ? true : false,
                    color: color,
                    fontName: fontName,
                    fontSize: fontSize
                )
            }
        }.onReceive(timer) { _ in
            if animations.isEmpty {
                self.timer.upstream.connect().cancel()
                return
            }
            
            if animations.contains(.print) && animations.count == 1 && toPrint == lines.count {
                self.timer.upstream.connect().cancel()
                return
            }
            
            toPrint += 1
    
            if animations.contains(.shake) {
                toUpdate.insert(Int.random(in: 0...lines.count))
                toUpdate.insert(Int.random(in: 0...lines.count))
            }
        }
    }
}

enum FigletAnimation {
    case print
    case shake
}

struct FigletLines_Previews: PreviewProvider {
    static var previews: some View {
        FigletLines(lines: FigletFonts[.ansi()][.A]!.lines)
    }
}
