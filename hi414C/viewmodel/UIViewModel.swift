//
//  UIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.04.2021.
//

import SwiftUI

class UIViewModel: ObservableObject {
    @Published var isDetail = false
    @Published var isHelp = false
    
    func isWideScreen() -> Bool {
        UIScreen.main.bounds.width > 500
    }
}
