//
//  Curtain.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct Curtain: View {
    let color: Color;
    
    init(of color: Color = Color.black) {
        self.color = color;
    }
    
    var body: some View {
        Rectangle()
            .fill(color)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct Curtain_Previews: PreviewProvider {
    static var previews: some View {
        Curtain()
    }
}
