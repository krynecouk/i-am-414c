//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 60, maximum: .infinity), spacing: 20),
    ]
    
    var body: some View {
        ZStack {
            CathodeView() {
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
                    }
                    .border(Color.blue)
                    .padding(30)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
