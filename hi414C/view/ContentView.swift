//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var graphViewModel = GraphViewModel()
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 60, maximum: .infinity)),
    ]

    var body: some View {
        ZStack {
            CathodeView {
                VStack {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            Group {
                                FigletView(ANSIRegular.H)
                                FigletView(ANSIRegular.ZERO)
                                FigletView(ANSIRegular.ZERO)
                                FigletView(ANSIRegular.ONE)
                                FigletView(ANSIRegular.ZERO)
                                FigletView(ANSIRegular.ZERO)
                                FigletView(ANSIRegular.ONE)
                                FigletView(ANSIRegular.ZERO)
                                FigletView(ANSIRegular.ZERO)
                            }
                            Text(graphViewModel.node.id)
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    graphViewModel.process(ctx: Context(input: "AL"))
                                }
                        }
                        .padding(30)
                    }
                }
                TerminalView()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Footer: View {
    var body: some View {
        TerminalView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
