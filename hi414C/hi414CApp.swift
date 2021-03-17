//
//  hi414CApp.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

@main
struct hi414CApp: App {
    @StateObject var graphViewModel = GraphViewModel()
    @StateObject var asciiViewModel = ASCIIViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(graphViewModel)
                .environmentObject(asciiViewModel)
        }
    }
}
