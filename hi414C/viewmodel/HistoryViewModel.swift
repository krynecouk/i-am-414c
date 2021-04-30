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
        self.history.append(message)
    }
    
    func remove() {
        self.history = []
    }
}

struct Message {
    var author: MessageAuthor
    var text: String
    
    init(from author: MessageAuthor, text: String) {
        self.author = author
        self.text = text
    }
}

enum MessageAuthor {
    case _414C, AL
}
