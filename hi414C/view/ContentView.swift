//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State var isVideo = false // TODO true
    @State var isIntro = true
    
    init() {
        print("WARN: CONTENT VIEW")
    }
    
    var body: some View {
        if isVideo {
            IntroVideo()
                .onTapGesture {
                    isVideo = false
                    isIntro = true
                }
        } else {
            CathodeView {
                if isIntro {
                    IntroScreen()
                } else {
                    TerminalView()
                }
            }
            .onTapGesture {
                if isIntro {
                    self.isIntro = false
                }
            }
            .statusBar(hidden: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .withEnvironment()
    }
}

