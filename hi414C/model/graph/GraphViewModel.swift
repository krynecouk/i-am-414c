//
//  GraphViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

import SwiftUI

class GraphViewModel: ObservableObject {
    @Published var node: Node = Graphs.HI

    func process(ctx: Context) {
        for edge in node.edges {
            if (edge.isTraversable(ctx: ctx)) {
                self.node = edge.traverse()
                print("in new node: ", self.node.id)
                return
            }
        }
        for edge in Graphs.HI {
            if (edge.isTraversable(ctx: ctx)) {
                self.node = edge.traverse()
                print("in new node: ", self.node.id)
                return
            }
        }
        // todo
    }
}
