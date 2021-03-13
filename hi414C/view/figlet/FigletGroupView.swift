//
//  FigletGroupView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.03.2021.
//

import SwiftUI

struct FigletGroupView: View {
    var values: [String] = []
    var figlets: [Figlet] = []
    
    init(_ values: String...) {
        self.values = values
        for char in values.joined() {
            let ascii = ASCII.from(symbol: String(char))!
            figlets.append(ANSIRegular[ascii.symbol]!)
        }
    }
    
    var body: some View {
        // TODO duplicated data
        ForEach(figlets, id: \.symbol) { figlet in
            FigletView(figlet)
        }
    }
}

struct FigletGroupView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FigletGroupView("HELLO")
        }
    }
}
