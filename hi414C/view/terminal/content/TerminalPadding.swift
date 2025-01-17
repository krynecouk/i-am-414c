//
//  TerminalPadding.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.05.2021.
//

import SwiftUI

struct TerminalPadding: View {
    @EnvironmentObject var segueVM: SegueViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let frameW: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        ForEach((0..<getPadding()).map { Item($0) }) { _ in
            Color.clear
                .frame(width: 60, height: getHeight())
        }
    }
    
    func getPadding() -> Int {
        let rows = (segueVM.segue.height / getHeight()).rounded()
        return Int(rows) * getCols()
    }
    
    func getCols() -> Int {
        let cols = (frameW - 40) / 70
        return Int(cols.rounded())
    }
    
    func getHeight() -> CGFloat {
        (themeVM.theme.font.robot.size * 5.2)
    }
}
