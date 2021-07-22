//
//  SegueViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

class SegueViewModel: ObservableObject {
    static let header: Size = (.infinity, 64)
    static let extendedHeader: Size = (.infinity, 128)
    
    @Published private(set) var segue: Size = header
    @Published private(set) var learn: Size = (.infinity, 270)
    @Published private(set) var chat: Size = (.infinity, 270)
    @Published private(set) var settings: Size = (.infinity, 200)
    @Published private(set) var keyboard: Size = (.infinity, 200)
    @Published private(set) var isOpen: Bool = false
    @Published private(set) var opened: SegueType?
    
    func open(type: SegueType = .keyboard, extended: Bool = false) {
        if type == .keyboard && extended {
            self.segue = SegueViewModel.extendedHeader
        } else {
            self.segue = SegueViewModel.header
        }
        
        self.isOpen = true
        self.opened = type
        print("segue: ", self.segue)
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
    
    func setLearnSize(_ size: Size) {
        self.learn = size
    }
    
    func setSettingsSize(_ size: Size) {
        self.settings = size
    }
    
    func setChatSize(_ size: Size) {
        self.chat = size
    }
}

enum SegueType {
    case keyboard, learn, chat, settings
}
