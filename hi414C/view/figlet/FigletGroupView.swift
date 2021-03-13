//
//  FigletGroupView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.03.2021.
//

import SwiftUI

struct FigletGroupView: View {
    var values: [String] = []

    init(_ values: String...) {
        self.values = values
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FigletGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FigletGroupView()
    }
}
