//
//  ChatViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.04.2021.
//

import SwiftUI

typealias Conversation = (message: Message?, replies: Set<String>)

class ChatViewModel: ObservableObject, Resetable {
    private(set) var messages: [Message] = []
    private(set) var current: Conversation = (.none, [])
    private(set) var currentExtended: Conversation = (.none, [])
    private(set) var root: Conversation = (.none, [])
    private(set) var allReplies: [String] = []
    
    func add(message: Message) {
        if !message.text.isEmpty {
            self.messages.append(message)
        }
        
        if messages.count > 100 {
            self.messages = Array(self.messages[30...])
        }
    }
    
    func reset() {
        self.messages = []
    }

    func setCurrent(message: Message?, replies: Set<String>) {
        self.current = (message, replies)
    }
    
    func setCurrentExtended(message: Message?, replies: Set<String>) {
        self.currentExtended = (message, replies)
    }
    
    func setRoot(message: Message?, replies: Set<String>) {
        self.root = (message, replies)
    }
    
    func setAllReplies(_ replies: [String]) {
        self.allReplies = replies
    }
    
}

struct Message: Identifiable {
    var id: UUID
    var author: MessageAuthor
    var text: String
    
    init(id: UUID = UUID(), from author: MessageAuthor, text: String) {
        self.id = id
        self.author = author
        self.text = text
    }
}

enum MessageAuthor {
    case robot, al
}
