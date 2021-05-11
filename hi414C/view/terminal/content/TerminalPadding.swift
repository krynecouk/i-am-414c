//
//  TerminalPadding.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.05.2021.
//

import SwiftUI

struct TerminalPadding: View {
    @EnvironmentObject var segueVM: SegueViewModel
    
    var body: some View {
        ForEach((0..<getPadding()).map { Item($0) }) { _ in
            Color.clear
                .frame(width: 60, height: 80)
        }
    }
    
    func getPadding() -> Int {
        let rows = (segueVM.segue.height / 80).rounded()
        return Int(rows) * getCols()
    }
    
    func getCols() -> Int {
        let cols = (UIScreen.main.bounds.width - 40) / 70
        return Int(cols.rounded())
    }
}
