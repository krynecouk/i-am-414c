//
//  TerminalView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.03.2021.
//

import SwiftUI

struct TerminalView: View {
    @State var text: String = ""
    @State var open: Bool = false
    @State var offset: CGFloat = 0
    
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Spacer()
                VStack(spacing: 0) {
                    HStack {
                        TerminalFont("414C >")
                        TerminalFont(text)
                        TerminalFont("█")
                    }
                    .onTapGesture {
                        withAnimation(Animation.spring()) {
                            self.offset = open ? metrics.size.height * 0.52 : 0
                            open.toggle()
                        }
                    }
                }
                .border(Color.pink)
                .offset(y: offset)
                .frame(width: metrics.size.width, height: metrics.size.height * 0.6, alignment: .topLeading)
                .border(Color.green)
                .onAppear {
                    self.offset = metrics.size.height * 0.52
                }
                .onReceive(orientationChanged) { _ in
                    // not working
                    self.offset = open ? 0 : metrics.size.height * 0.52
                }
            }
        }
        
    }
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            TerminalView()
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
