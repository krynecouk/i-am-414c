//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 60, maximum: .infinity))
    ]
    
    var body: some View {
        ZStack {
            CathodeView() {
                VStack {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            Group() {
                                ANSIRegular.H
                                ANSIRegular.ZERO
                                ANSIRegular.ZERO
                                ANSIRegular.ONE
                                ANSIRegular.ZERO
                                ANSIRegular.ZERO
                                ANSIRegular.ONE
                                ANSIRegular.ZERO
                                ANSIRegular.ZERO
                            }
                            Group() {
                                ANSIRegular.H
                                ANSIRegular.ZERO
                                ANSIRegular.ZERO
                                ANSIRegular.ONE
                                ANSIRegular.ZERO
                                ANSIRegular.ZERO
                                ANSIRegular.ONE
                                ANSIRegular.ZERO
                                ANSIRegular.ZERO
                            }
                            Group() {
                                ANSIRegular.H
                                ANSIRegular.ZERO
                                ANSIRegular.ZERO
                                ANSIRegular.ONE
                                ANSIRegular.ZERO
                                ANSIRegular.ZERO
                                ANSIRegular.ONE
                                ANSIRegular.ZERO
                                ANSIRegular.ZERO
                            }
                        }
                        .padding(30)
                    }
                    Text("FOOOOOOO").foregroundColor(.green)
                }.border(Color.yellow)
            }
        }
    }
}

struct Footer: View {
    var body: some View {
        Text("FOOTER").foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
