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
    @State var shakeLines: [Line:LineOffset] = [:]
    @State var isPrintDelayFinished = true
    
    var print: ASCIIPrintable
    var printAnimation: Animation?
    var printDelay: Double?
    var lines: [String]
    var theme: ArtTheme
    var printTimer: ViewTimer?
    var shakeTimer: ViewTimer?
    var shaker: Shaker?
    var shakeAnimation: Animation?
    var printable = false
    var shakeable = false
    var bloomable = false
    var bloom: (speed: Double, color: Color) = (0.0, .primary)
    
    init(_ print: ASCIIPrintable, theme: ArtTheme = ArtTheme()) {
        self.print = print
        self.lines = print.lines
        self.theme = theme
        
        for animation in theme.animations {
            if case let .print(speed, delay, animation) = animation {
                self.printTimer = Timer.publish(every: speed, on: .main, in: .common).autoconnect()
                self.printable = true
                self.printAnimation = animation
                self.printDelay = delay
            }
            if case let .shake(speed, force, type, animation) = animation {
                self.shakeTimer = Timer.publish(every: speed, on: .main, in: .common).autoconnect()
                self.shaker = ASCIIArtShaker.of(lines: lines.count, force: force, type: type)
                self.shakeable = true
                self.shakeAnimation = animation
            }
            if case let .bloom(speed, color) = animation {
                self.bloomable = true
                self.bloom = (speed, color)
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
        VStack(spacing: 0) {
            ForEach(lines.indices) { idx in
                ASCIIArtLineView(
                    lines.count > idx ? lines[idx] : lines[0],
                    theme: theme.view,
                    visible: !printable || idx < printLine,
                    bloom: bloom,
                    offset: (
                        x: !shakeable || shakeLines[idx] == nil ? 0 : shakeLines[idx]!.x,
                        y: !shakeable || shakeLines[idx] == nil ? 0 : shakeLines[idx]!.y
                    ))
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
        ASCIIArtView(ASCIIArt.of(.cat), theme: ArtTheme(
            view: ViewTheme(font: (.terminus, 25)),
                        animations: [.print(),.bloom(speed: 0.5)])
        )
    }
}
