//
//  SegueViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

class SegueViewModel: ObservableObject {
    static let header: Size = (.infinity, 64)
    
    @Published private(set) var segue: Size = header
    @Published private(set) var help: Size = (.infinity, 200)
    @Published private(set) var chat: Size = (.infinity, 100)
    @Published private(set) var settings: Size = (.infinity, 150)
    @Published private(set) var keyboard: Size = (.infinity, 200)
    @Published private(set) var isOpen: Bool = false
    @Published private(set) var opened: SegueType?
    
    func open(type: SegueType = .keyboard) {
        self.isOpen = true
        self.opened = type
    }
    
    func close() {
        self.isOpen = false
        self.opened = .none
    }
    
    func setSegueSize(_ size: Size) {
        self.segue = size
    }
    
    func setKeyboardSize(_ size: Size) {
        self.keyboard = size
    }
    
    func setHelpSize(_ size: Size) {
        self.help = size
    }
    
    func setSettingsSize(_ size: Size) {
        self.settings = size
    }
    
    func setChatSize(_ size: Size) {
        self.chat = size
    }
}

enum SegueType {
    case keyboard, help, chat, settings
}
