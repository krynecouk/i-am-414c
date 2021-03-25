//
//  ASCIIArtView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI
import Combine

struct ASCIIArtView: View {
    @State var printLine: LineIdx = 0
    @State var shakeMoveIdx: Int = 0
    @State var isDelayFinished = true
    
    var print: ASCIIPrintable
    var printAnimation: Animation?
    var printDelay: Double?
    var lines: [String]
    var settings: ASCIIArtSettings
    var printer: ViewTimer?
    var shaker: ViewTimer?
    var shakeMoves: [ShakeMove] = []
    var printable = false
    var shakeable = false
    
    init(_ print: ASCIIPrintable, settings: ASCIIArtSettings = ASCIIArtSettings()) {
        self.print = print
        self.lines = print.lines
        self.settings = settings
        
        for animation in settings.animations {
            if case let .print(dt, delay, animation) = animation {
                self.printer = Timer.publish(every: dt, on: .main, in: .common).autoconnect()
                self.printable = true
                self.printAnimation = animation
                self.printDelay = delay
            }
            if case let .shake(dt, force, type) = animation {
                self.shaker = Timer.publish(every: dt, on: .main, in: .common).autoconnect()
                self.shakeMoves = ASCIIArtShaker.shake(lines: lines.count, force: force, type: type)
                self.shakeable = true
            }
        }
        if self.printer == nil {
            self.printer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        }
        if self.shaker == nil {
            self.shaker = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        }
    }
    
    var body: some View {
        VStack {
            ForEach(lines.indices) { idx in
                Text(lines[idx])
                    .fixedSize()
                    .offset(x: !shakeable ? 0 : CGFloat(shakeMoves[shakeMoveIdx][idx]!))
                    .animation(nil)
                    .opacity(!printable || idx < printLine ? 1 : 0)
                    .animation(printAnimation)
                    .withSettings(settings.view)
            }
        }
        .onAppear {
            guard let printDelay = printDelay else {
                return
            }
            
            if printable && printDelay > 0 {
                self.isDelayFinished = false
                DispatchQueue.main.asyncAfter(deadline: .now() + printDelay) {
                    self.isDelayFinished = true
                }
            }
        }
        .onReceive(printer!) { _ in
            if !printable || printLine == lines.count {
                self.printer!.upstream.connect().cancel()
                return
            }
            
            if isDelayFinished {
                printLine += 1
            }
        }
        .onReceive(shaker!) { _ in
            if !shakeable {
                self.shaker!.upstream.connect().cancel()
                return
            }
            
            if (shakeMoveIdx == shakeMoves.count - 1) {
                shakeMoveIdx = 0
            } else {
                shakeMoveIdx += 1
            }
        }
    }
}

typealias ViewTimer = Publishers.Autoconnect<Timer.TimerPublisher>

struct ASCIIArtView_Previews: PreviewProvider {
    static var previews: some View {
        ASCIIArtView(ASCIIArt.of(.cat), settings: ASCIIArtSettings(
                view: ViewSettings(font: (.terminus, 25))
            )
        )
    }
}
