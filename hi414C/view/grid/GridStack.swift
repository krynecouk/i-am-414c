//
//  Grid2.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.04.2021.
//

import SwiftUI

// 'Content' here is used to store the View you defined in the Block
// 'T' is the object type of your list.
struct GridStack<Content: View, T: Identifiable>: View {
    
    private let columns: Int
    
    // Multi-dimensional array of your list. Modified as per rendering needs.
    private var list: [[T]] = []
    
    // This block you specify in 'UIGrid' is stored here
    private let content: (T) -> Content
    
    init(columns: Int, list: [T], @ViewBuilder content:@escaping (T) -> Content) {
        self.columns = columns
        self.content = content
        self.setupList(list)
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(0 ..< self.list.count, id: \.self) { i in
                    HStack {
                        ForEach(self.list[i]) { object in
                            
                            // Your UI defined in the block is called from here.
                            self.content(object)
                                .frame(width: UIScreen.main.bounds.size.width/CGFloat(self.columns))
                        }
                    }
                }
                
            }
        }
    }
    
    // setupList(_:) Converts your array into multi-dimensional array.
    private mutating func setupList(_ list: [T]) {
        var column = 0
        var columnIndex = 0
        
        for object in list {
            if columnIndex < self.columns {
                if columnIndex == 0 {
                    self.list.insert([object], at: column)
                    columnIndex += 1
                } else {
                    self.list[column].append(object)
                    columnIndex += 1
                }
            } else {
                column += 1
                self.list.insert([object], at: column)
                columnIndex = 1
            }
        }
    }
}
