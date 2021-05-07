//
//  TerminalHint.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 05.05.2021.
//

import SwiftUI

struct TerminalHint: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(Color("BlackBck"))
                .frame(height: 114)
                .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .identity))
            HStack(spacing: 0) {
                TerminalHintText("Hint: ") // TODO generate next hint
                    .padding(.leading, 15)
                TerminalHintScroll()
            }
        }
        .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .identity))
    }
}

struct TerminalHintText: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(Font.custom(FontName.proggyTiny.rawValue, size: 32))
            .foregroundColor(.white)
            .padding([.top, .bottom])
            .frame(height: 50)
    }
}

struct TerminalHintScroll: View {
    /*
    @State var index: Int = 0
    @State var offset: Int = getOffset()
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    */
    //let timer = Timer.publish(every: 0.8, on: .main, in: .common).autoconnect()
    
    private let hint = "This is help and settings screen. Turn it on with left edge drag. Turn it off with right edge drag."
    
    var body: some View {
        let chars = Array(hint)
        return
            //ScrollViewReader { scrollView in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(chars.indices) { i in
                            TerminalHintText(String(chars[i]))
                                //.id(i)
                        }
                    }
              //  }
                /*
                .onReceive(timer) { _ in
                    self.index += 1
                    
                    if (index + offset) >= chars.count {
                        self.index = 0
                        withAnimation {
                            scrollView.scrollTo(0, anchor: .leading)
                        }
                    } else {
                        scrollView.scrollTo(offset + index)
                    }
                }
                
                .onReceive(orientationChanged) { _ in
                    self.index = 0
                    self.offset = TerminalHintScroll.getOffset()
                    withAnimation {
                        scrollView.scrollTo(0)
                    }
                    if offset > chars.count {
                        cancel()
                    }
                }
                 */
            }
            /*
            .gesture(
                DragGesture()
                    .onChanged { _ in
                        cancel()
                    }
            )
            */
    }
    
    /*
    private func cancel() {
        self.timer.upstream.connect().cancel()
    }
    
    
    private static func getOffset() -> Int {
        Int((UIScreen.main.bounds.width / 15).rounded())
    }
     */
}


struct TerminalHint_Previews: PreviewProvider {
    static var previews: some View {
        TerminalHint()
    }
}
