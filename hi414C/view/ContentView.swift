//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var graphViewModel = GraphViewModel()
    @StateObject var testViewModel = TestViewModel()

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
                                if (true) {
                                    FigletGroupView(graphViewModel.node.id)
                                }
                            }
                        }
                        .padding(30)
                    }
                }
                TerminalView()
                    .environmentObject(graphViewModel)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
