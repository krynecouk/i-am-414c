//
//  HistoryViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.04.2021.
//

import SwiftUI

typealias History = [Message]

class HistoryViewModel: ObservableObject {
    private(set) var history: History = []
    
    func add(message: Message) {
        if !message.text.isEmpty {
            self.history.append(message)
        }
    }
    
    func remove() {
        self.history = []
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
    case _414C, AL
}
