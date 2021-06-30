//
//  ChatViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.04.2021.
//

import SwiftUI
import OrderedCollections

typealias Conversation = (message: Message?, replies: OrderedSet<String>)

class ChatViewModel: ObservableObject, Resetable {
    private(set) var messages: [Message] = []
    private(set) var current: Conversation = (.none, [])
    private(set) var root: Conversation = (.none, [])
    
    func add(message: Message) {
        if !message.text.isEmpty {
            self.messages.append(message)
        }
        
        if messages.count > 200 {
            self.messages = Array(self.messages[50...])
        }
    }
    
    func reset() {
        self.messages = []
    }

    func setCurrent(message: Message?, replies: OrderedSet<String>) {
        self.current = (message, replies)
    }
    
    func setRoot(message: Message?, replies: OrderedSet<String>) {
        self.root = (message, replies)
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
