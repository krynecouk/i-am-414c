//
//  UIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.04.2021.
//

import SwiftUI

class UIViewModel: ObservableObject, Resetable {
    @Published var isIntro = true
    @Published var video: VideoType? = .intro
    @Published var detail = (is: false, animated: true)
    @Published var isDetailAvailable = false
    @Published var isHelp = false
    @Published var current: ContentType = .test
    @Published var isWaiting: Bool = false
    @Published var isRefreshWave: Bool = false
    @Published var withHint: Bool = false
    
    @Published var isFinishedGame = false
    @Published private(set) var isHelpModalClosed = HelpModalDao.find()
    @Published private(set) var errors: Int = 0
    
    let error: Sound = Sound.of(.error)

    func shake() {
        error.play()
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
        HelpModalDao.store(closed: false)
        self.isHelpModalClosed = false
        GameOverDao.store(finished: false)
        self.isFinishedGame = false
    }
    
    func closeHelp() {
        HelpModalDao.store(closed: true)
        self.isHelpModalClosed = true
    }
    
    func finishGame() {
        GameOverDao.store(finished: true)
        self.isFinishedGame = true
    }
}

enum ContentType {
    case message, test
}
