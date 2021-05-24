//
//  ChatViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.04.2021.
//

import SwiftUI
import OrderedCollections

class ChatViewModel: ObservableObject {
    private(set) var messages: [Message] = []
    private(set) var replies: OrderedSet<String> = []
    
    func add(message: Message) {
        if !message.text.isEmpty {
            self.messages.append(message)
        }
    }
    
    func clear() {
        self.messages = []
    }

    func setReplies(_ replies: OrderedSet<String>) {
        self.replies = replies
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
