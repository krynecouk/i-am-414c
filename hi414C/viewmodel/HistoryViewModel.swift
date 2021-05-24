//
//  HistoryViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.04.2021.
//

import SwiftUI
import OrderedCollections

typealias History = [Message]
typealias Answer = String
typealias Answers = OrderedSet<Answer>

class HistoryViewModel: ObservableObject {
    private(set) var history: History = []
    private(set) var answers: Answers = []
    
    func add(message: Message) {
        if !message.text.isEmpty {
            self.history.append(message)
        }
    }
    
    func replace(with answers: Answers) {
        self.answers = answers
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
