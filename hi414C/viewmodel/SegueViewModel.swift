//
//  SegueViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

class SegueViewModel: ObservableObject {
    @Published private(set) var isOpen: Bool = false
    
    func open() {
        self.isOpen = true
    }
    
    func close() {
        self.isOpen = false
    }
}
