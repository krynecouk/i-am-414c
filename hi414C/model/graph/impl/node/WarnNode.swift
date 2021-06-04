//
//  WarnNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.06.2021.
//

class WarnNode: ThemeNode {
    init(_ msg: String, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(msg, theme: WarnTheme(), edges)
    }
}
