//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var graphViewModel: GraphViewModel
    @EnvironmentObject var asciiViewModel: ASCIIViewModel
    
    var body: some View {
        ZStack {
            CathodeView {
                ASCIIGrid(content: graphViewModel.node.id, knownSymbols: asciiViewModel.known)
                    .padding(30)
                TerminalView()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .withEnvironment()
    }
}
