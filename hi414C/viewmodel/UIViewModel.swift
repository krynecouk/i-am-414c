//
//  UIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.04.2021.
//

import SwiftUI

class UIViewModel: ObservableObject, Resetable {
    @Published var isIntro = true
    @Published var isFinishedGame = false
    @Published var video: VideoType? = .none
    @Published var detail = (is: false, animated: true)
    @Published var isDetailAvailable = false
    @Published var isHelp = false
    @Published var current: ContentType = .test
    @Published var isWaiting: Bool = false
    @Published private(set) var errors: Int = 0

    func shake() {
        Sound.of(.dulled).play()
        withAnimation {
            self.errors += 1
        }
    }
    
    func isWideScreen() -> Bool {
        UIScreen.main.bounds.width > 500
    }
    
    func reset() {
        self.current = .test
        self.isHelp = false
        self.isIntro = true
        self.isWaiting = false
        self.detail = (false, false)
    }
}



enum ContentType {
    case message, test
}
