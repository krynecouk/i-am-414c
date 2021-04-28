//
//  TerminalHelpSelect.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

struct TerminalHelpSelect: View {
    @EnvironmentObject var segueVM: SegueViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    private static let ADAPTIVE = [GridItem(.adaptive(minimum: 90, maximum: .infinity))]
    
    @State var offset: Offset = (0, 0)
    
    var body: some View {
        GeometryReader { metrics in
            Grid(columns: TerminalHelpSelect.ADAPTIVE) {
                Text("Hint")
                    .font(Font.custom(FontName.proggyTiny.rawValue, size: 29))
                    .padding()
                    .background(Color.primary)
                    .offset(x: self.offset.x, y: self.offset.y)
            }
            .id(metrics.frame(in: .global).size.width)
            .onAppear {
                let frame = metrics.frame(in: .global)
                let frameW = frame.size.width
                if frameW > 500 {
                    segueVM.setHelpSize((.infinity, 150))
                    segueVM.setSettingsSize((.infinity, 150))
                } else {
                    segueVM.setHelpSize((.infinity, 200))
                    segueVM.setSettingsSize((.infinity, 300))
                }
            }
            .onReceive(segueVM.$isOpen) { isOpen in
                withAnimation {
                    self.offset = isOpen ? (0,0) : (0, 100)
                }
            }
        }
        //.frame(maxWidth: self.size.width, maxHeight: self.size.height)
        .background(segueVM.isOpen ? Color("GoldBck").edgesIgnoringSafeArea(.all) : Color("BlackBck").edgesIgnoringSafeArea(.all))
    }
}


