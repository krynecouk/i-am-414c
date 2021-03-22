//
//  ASCIIArtView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

struct ASCIIArtView: View {
    typealias LineIdx = Int
    
    @State var printLine: LineIdx = 0
    @State var shakeLines: Set<LineIdx> = []
    
    var lines: [String]
    var fontName: FontName = .terminus
    var fontSize: CGFloat = 13
    var color: Color = Color("Primary")
    var printable: Bool = true
    var shakeable: Bool = true
    
    let printer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    let shaker = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ForEach(lines.indices) { idx in
                Text(lines[idx])
                    .foregroundColor(color)
                    .font(Font.custom(fontName.rawValue, size: fontSize))
                    .opacity(!printable || idx < printLine ? 1 : 0)
                    .offset(x: !shakeable || !shakeLines.contains(idx) ? 0 : CGFloat.random(in: -1...1))
            }
        }.onReceive(printer) { _ in
            if !printable || printLine == lines.count {
                self.printer.upstream.connect().cancel()
                return
            }
            printLine += 1
        }
        .onReceive(shaker) { _ in
            if !shakeable {
                self.shaker.upstream.connect().cancel()
                return
            }
            shakeLines = [
                Int.random(in: 0...lines.count),
                Int.random(in: 0...lines.count)
            ]
        }
    }
}

struct ASCIIArtView_Previews: PreviewProvider {
    static var previews: some View {
        ASCIIArtView(
            lines: [
                #" _._     _,-'""`-._"#,
                #"(,-.`._,'(       |\`-/|"#,
                #"    `-.-' \ )-`( , o o)"#,
                #"          `-    \`_`"'-"#
            ],
            fontSize: 23
        )
    }
}
