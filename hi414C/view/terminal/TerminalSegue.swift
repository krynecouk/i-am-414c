//
//  TerminalSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.03.2021.
//

import SwiftUI

struct TerminalSegue<Header: View, Content: View> : View {
    @State var open: Bool = false
    @State var offset: CGFloat = 0
    
    let header: Header
    let content: Content
    
    init(header: Header, @ViewBuilder content: () -> Content) {
        self.header = header
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Spacer()
                VStack {
                    Group {
                        ScrollView(.horizontal) {
                            HStack {
                                header
                            }.padding(.leading)
                        }
                    }
                    .frame(width: metrics.size.width, alignment: .topLeading)
                    .onTapGesture {
                        withAnimation(Animation.spring()) {
                            self.offset = open ? metrics.size.height * 0.52 : 0
                            open.toggle()
                        }
                    }
                    
                    Group {
                        TerminalFont("=================================")
                        content
                    }.offset(y: 40)
                    
                }
                .frame(width: metrics.size.width, height: metrics.size.height, alignment: .topLeading)
                .offset(y: offset)
                .frame(width: metrics.size.width, height: metrics.size.height * 0.6, alignment: .topLeading)
                .onAppear {
                    self.offset = metrics.size.height * 0.52
                }
            }
        }
    }
}

struct TerminalSegue_Previews: PreviewProvider {
    static var previews: some View {
        TerminalSegue(header: Text("Click me")) {
            VStack {
                Text("Some content")
            }
        }
    }
}
