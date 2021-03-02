//
//  TerminalPanel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 02.03.2021.
//

import SwiftUI

struct TerminalPanel<Content: View> : View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Spacer()
                VStack {
                   content
                }
                .frame(
                    width: metrics.size.width,
                    height: metrics.size.height * 0.6,
                    alignment: .topLeading)
            }
        }
    }
}

struct TerminalPanel_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TerminalPanel {
                Text("test")
            }
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
