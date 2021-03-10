//
//  TerminalSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.03.2021.
//

import SwiftUI


struct TerminalSequeProps {
    static let INIT_HEIGHT: CGFloat = 50
}

struct TerminalSegue<Header: View, Content: View> : View {
    
    @State var open: Bool = false
    @State var height: CGFloat = TerminalSequeProps.INIT_HEIGHT
    
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
                    .onTapGesture {
                        withAnimation(Animation.spring()) {
                            self.height = open ? metrics.size.height * 0.4 : TerminalSequeProps.INIT_HEIGHT
                            open.toggle()
                        }
                    }

                    Group {
                        content
                            .offset(y: 40)
                    }
                }
                .frame(width: metrics.size.width, height: self.height, alignment: .topLeading)
                .onAppear {
                    self.height = TerminalSequeProps.INIT_HEIGHT
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
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
