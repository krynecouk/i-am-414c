//
//  FigletPrinter.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI
import Combine

typealias TimerPublisher = Publishers.Autoconnect<Timer.TimerPublisher>

struct FigletPrinter: View {
    @State var printLine: Line = 0
    @State var shakeLines: [Line:LineOffset] = [:]
    @State var isPrintDelayFinished = true
    
    var figlet: Figlet
    var printAnimation: Animation?
    var printDelay: Double?
    var lines: [String]
    var theme: FigletTheme
    var printTimer: TimerPublisher?
    var shakeTimer: TimerPublisher?
    var shaker: Shaker?
    var shakeAnimation: Animation?
    var shakeable: Bool
    var printable: Bool
    var bloomable: Bool
    var bloom: (speed: Double, color: Color) = (0.0, .primary)
    var shadow: Bool
    
    init(_ figlet: Figlet, theme: FigletTheme = FigletTheme(), shadow: Bool) {
        self.figlet = figlet
        self.lines = figlet.lines
        self.theme = theme
        self.shadow = shadow
        self.shakeable = false
        self.printable = false
        self.bloomable = false
        for animation in theme.animations {
            if case let .print(speed, delay, animation) = animation {
                self.printTimer = Timer.publish(every: speed, on: .main, in: .common).autoconnect()
                self.printable = true
                self.printAnimation = animation
                self.printDelay = delay
            }
            if case let .shake(speed, force, type, animation) = animation {
                self.shakeTimer = Timer.publish(every: speed, on: .main, in: .common).autoconnect()
                self.shaker = FigletShaker.of(lines: lines.count, force: force, type: type)
                self.shakeable = true
                self.shakeAnimation = animation
            }
            if case let .bloom(speed, color) = animation {
                self.bloomable = true
                self.bloom = (speed, color)
            }
        }
    }
    
    var body: some View {
        if printable && shakeable {
            makePrintable(
                makeShakeable(
                    FigletPrint()
                )
            )
        } else if printable {
            makePrintable(FigletPrint())
        } else if shakeable {
            makeShakeable(FigletPrint())
        } else {
            FigletPrint()
        }
    }
    
    func makePrintable<T: View>(_ content: T) -> some View {
        content
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
    }
    
    func makeShakeable<T: View>(_ content: T) -> some View {
        content
            .onReceive(shakeTimer!) { _ in
                if !shakeable {
                    self.shakeTimer!.upstream.connect().cancel()
                    return
                }
                self.shakeLines = shaker!()
            }
    }
    
    func FigletPrint() -> some View {
        VStack(spacing: 0) {
            ForEach(lines.indices) { idx in
                FigletPrintLine(
                    lines.count > idx ? lines[idx] : lines[0],
                    theme: theme.view,
                    visible: !printable || idx < printLine,
                    bloom: bloom,
                    offset: (
                        x: !shakeable || shakeLines[idx] == nil ? 0 : shakeLines[idx]!.x,
                        y: !shakeable || shakeLines[idx] == nil ? 0 : shakeLines[idx]!.y
                    ),
                    shadow: self.shadow
                )
            }
        }
    }
}
