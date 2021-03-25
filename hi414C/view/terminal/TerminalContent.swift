//
//  TerminalContent.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalContent: View {
    @EnvironmentObject var settingsVM: SettingsViewModel
    @State var activeTestId: String = ""
    @State var idx = 0
    
    var items: [TerminalContentItem]
    var testVM: TestViewModel
    
    init(_ types: [TerminalContentType], testVM: TestViewModel) {
        self.init(types.map { TerminalContentItem(type: $0) }, testVM: testVM)
    }
    
    init(_ items: [TerminalContentItem], testVM: TestViewModel) {
        self.items = items
        self.testVM = testVM
        self.idx = 0
        testVM.setTest(test: nil)
    }
    
    var body: some View {
        
        Grid {
            ForEach(Array(items.enumerated()), id: \.element.id) { i, item in
                if case let .art(arts) = item.type {
                    ForEach(arts.indices) { i in
                        ASCIIArtView(arts[i], settings: settingsVM.asciiArt)
                            .onAppear {
                                self.idx += 1
                            }
                    }
                }
                if case let .message(symbols) = item.type {
                    FigletView(symbols, settings: settingsVM.asciiMessage.figlet)
                        .onAppear {
                            self.idx += 1
                        }
                }
                if case let .symbol(symbol) = item.type {
                    GeometryReader { metrics in
                        FigletView(symbol.rawValue, settings: FigletSettings(animations: [.print(dt: 0.05, delay: 0.25 * Double(getRow(minY: metrics.frame(in: .global).minY, frameHeight: metrics.frame(in: .global).size.height)))]))
                            .onAppear {
                                self.idx += 1
                                let frame = metrics.frame(in: .global)
                                let foo = metrics.self
                                let bar = metrics.size
                                
                                // row = frame.size.height / frame.minY - ROUNDED! 1based!
                                print("=====================================")
                                print("SYMBOL \(symbol) IDX: \(idx)")
                                print("SYMBOL \(symbol)  frame.origin.x    : \(frame.origin.x)")
                                print("SYMBOL \(symbol)  frame.minX        : \(frame.minX)")
                                print("SYMBOL \(symbol)  frame.size.width  : \(frame.size.width)")
                                print("SYMBOL \(symbol)  frame.minX/frame.size.width : \(frame.minX/frame.size.width)")
                                print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                print("SYMBOL \(symbol)  frame.origin.y               : \(frame.origin.y)")
                                print("SYMBOL \(symbol)  frame.minY                   : \(frame.minY)")
                                print("SYMBOL \(symbol)  frame.size.height            : \(frame.size.height)")
                                print("SYMBOL \(symbol)  frame.minY/frame.size.height : \(frame.minY/frame.size.height)")
                                print("SYMBOL \(symbol)  ROUNDED : \(getRow(minY: frame.minY, frameHeight: frame.size.height).rounded())")
                                print("=====================================")
                                
                                // printRow(elementIdx: (i + 1), elementWidth: frame.size.width, globalWidth:
                            }
                            .border(Color.blue)
                    }
                    
                }
                if case let .test(test, isCurrent) = item.type {
                    ForEach(Array(test.test).map { StringItem(string: String($0) )}) { item in
                        GeometryReader { metrics in
                            FigletView(item.string, settings: FigletSettings(animations: [.print(dt: 0.05, delay: 0.25 * Double(getRow(minY: metrics.frame(in: .global).minY, frameHeight: metrics.frame(in: .global).size.height)))]))
                                .onAppear {
                                    self.idx += 1
                                    if isCurrent && testVM.test == nil {
                                        testVM.setTest(test: test)
                                        activeTestId = item.id.uuidString
                                    }
                                }
                                .onTapGesture {
                                    testVM.setTest(test: test)
                                    activeTestId = item.id.uuidString
                                }
                        }.frame(width: 50, height: 70)
                    }
                }
            }
            .coordinateSpace(name: "Grid")
        }
    }
}

struct StringItem: Identifiable {
    var id = UUID()
    var string: String
}

func getRow(minY: CGFloat, frameHeight: CGFloat) -> CGFloat {
    let raw = minY/frameHeight
    if raw < 1 {
        return raw.rounded(.up)
    }
    return raw.rounded()
}

struct TerminalContentItem: Identifiable {
    var id = UUID()
    var type: TerminalContentType
}

enum TerminalContentType {
    case symbol(ASCIISymbol)
    case test(Testable, Bool)
    case message([ASCIISymbol])
    case art([ASCIIPrintable])
}

struct TerminalContent_Previews: PreviewProvider {
    static var previews: some View {
        TerminalContent([
            .symbol(.H),
            .test(Tests[.I][0], true)
        ], testVM: TestViewModel())
        .withEnvironment()
    }
}
