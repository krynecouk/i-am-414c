//
//  ASCIIArtView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI
import Combine

struct ASCIIArtView: View {
    @State var printLine: Line = 0
    @State var shakeLines: [Line:Offset] = [:]
    @State var isPrintDelayFinished = true
    
    var print: ASCIIPrintable
    var printAnimation: Animation?
    var printDelay: Double?
    var lines: [String]
    var settings: ASCIIArtSettings
    var printTimer: ViewTimer?
    var shakeTimer: ViewTimer?
    var shaker: Shaker?
    var shakeAnimation: Animation?
    var printable = false
    var shakeable = false
    
    init(_ print: ASCIIPrintable, settings: ASCIIArtSettings = ASCIIArtSettings()) {
        self.print = print
        self.lines = print.lines
        self.settings = settings
        
        for animation in settings.animations {
            if case let .print(dt, delay, animation) = animation {
                self.printTimer = Timer.publish(every: dt, on: .main, in: .common).autoconnect()
                self.printable = true
                self.printAnimation = animation
                self.printDelay = delay
            }
            if case let .shake(dt, force, type, animation) = animation {
                self.shakeTimer = Timer.publish(every: dt, on: .main, in: .common).autoconnect()
                self.shaker = ASCIIArtShaker.of(lines: lines.count, force: force, type: type)
                self.shakeable = true
                self.shakeAnimation = animation
            }
        }
        if self.printTimer == nil {
            self.printTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        }
        if self.shakeTimer == nil {
            self.shakeTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        }
    }
    
    var body: some View {
        VStack {
            ForEach(lines.indices) { idx in
                Text(lines[idx])
                    .fixedSize()
                    .offset(x: !shakeable || shakeLines[idx] == nil ? 0 : CGFloat(shakeLines[idx]!.x))
                    .animation(shakeAnimation)
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
                self.isPrintDelayFinished = false
                DispatchQueue.main.asyncAfter(deadline: .now() + printDelay) {
                    self.isPrintDelayFinished = true
                }
            }
        }
        .onReceive(printTimer!) { _ in
            if !printable || printLine == lines.count {
                self.printTimer!.upstream.connect().cancel()
                return
            }
            
            if isPrintDelayFinished {
                printLine += 1
            }
        }
        .onReceive(shakeTimer!) { _ in
            if !shakeable {
                self.shakeTimer!.upstream.connect().cancel()
                return
            }
            self.shakeLines = shaker!()
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
